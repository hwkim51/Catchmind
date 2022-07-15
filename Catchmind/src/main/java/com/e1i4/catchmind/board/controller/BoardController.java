package com.e1i4.catchmind.board.controller;

import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.e1i4.catchmind.board.model.service.BoardService;
import com.e1i4.catchmind.board.model.vo.Catch;
import com.e1i4.catchmind.board.model.vo.Like;
import com.e1i4.catchmind.board.model.vo.Post;
import com.e1i4.catchmind.board.model.vo.Reply;
import com.e1i4.catchmind.board.model.vo.Report;
import com.e1i4.catchmind.common.model.vo.Attach;
import com.e1i4.catchmind.common.model.vo.PageInfo;
import com.e1i4.catchmind.common.template.Pagination;
import com.e1i4.catchmind.member.model.vo.Member;
import com.google.gson.Gson;

@Controller
public class BoardController {
	
	public static final String SERVICEKEY = "EAk%2FcJd62BzsuJHpbCtIksn5S31hprT9toGxp8xmushfAKYmT9OTzNwrznDBK3YOaflpBbZiPPiGB7pyfIYhew%3D%3D";
	
	@Autowired
	private BoardService boardService;
	
	/* ============================ Post ============================ */
	/* POST 전체조회 */
	@RequestMapping("list.po")
	public String listViewPost(@RequestParam(value="ppage", defaultValue="1") int currentPage, Model model) {
		
		int listCount = boardService.selectListCount();
		
		int pageLimit = 10;
		int boardLimit = 10;
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);
		
		ArrayList<Post> list = boardService.selectList(pi);
		
		model.addAttribute("pi", pi);
		model.addAttribute("list", list);
		
		
		return "board/postListView";
	}
	
	/* POST 상세조회 */
	@RequestMapping("detail.po")
	public ModelAndView detailPost(int pno, ModelAndView mv) {
		
		int result = boardService.increaseCount(pno);
		
		if(result>0) {
			Post p = boardService.selectPost(pno);
			Attach a = boardService.selectFile(pno);
			ArrayList<Reply> rlist = boardService.selectReplyList(pno);
			
			mv.addObject("a", a);
			mv.addObject("rlist", rlist);
			mv.addObject("p", p).setViewName("board/postDetailView");
			return mv;
		} else {
			mv.addObject("errorMsg", "상세조회 요청에 실패하였습니다.").setViewName("common/errorPage");
			return mv;
		}
	}
	
	/* POST 작성페이지 이동 */
	@RequestMapping("enrollForm.po")
	public String enrollFormPost() {
		return "board/postEnrollForm";
	}
	
	/* POST 작성 */
	@RequestMapping("insert.po")
	public String insertPost(int postWriter,Post p, Attach a, MultipartFile upfile, HttpSession session, Model model) {
		p.setPostWriter(postWriter);
		
		if(!upfile.getOriginalFilename().equals("")) {
			
			String changeName = saveFile(upfile, session);
			
			a.setAttOrigin(upfile.getOriginalFilename());
			a.setAttChange("resources/images/upfiles"+changeName);
		}
		
		int result1 = boardService.insertPost(p);
		int result2 = 0;
		if(!upfile.getOriginalFilename().equals("")) {
			result2 = boardService.insertFile(a);
		}
		
		if((result1+result2)>0) {
			session.setAttribute("alertMsg", "성공적으로 게시글이 등록되었습니다.");
			return "redirect:list.po";
		} else {
			model.addAttribute("errorMsg", "게시글 등록에 실패하였습니다.");
			return "common/errorPage";
		}
	}
	
	/* POST 삭제 */
	@PostMapping("delete.po")
	public String deleteBoard(int postNo, Model model, String filePath, HttpSession session, String attNo) {
		Attach a = new Attach();
		a.setAttNo(attNo);
		int result = boardService.deletePost(postNo);
		int result2 = boardService.deleteFile(a);
		
		if(result>0) {
			// 첨부파일있었던 게시글 삭제 시 첨부파일 서버에서 삭제
			if(!filePath.equals("")) {
				String realPath = session.getServletContext().getRealPath(filePath);
				new File(realPath).delete();
			}
			
			// url재요청
			session.setAttribute("alertMsg", "성공적으로 게시글이 삭제되었습니다.");
			
			return "redirect:list.po";
			
		} else {
			model.addAttribute("errorMsg", "게시글 삭제 실패");
			
			return "common/errorPage";
		}
	}
	
	/* POST 수정페이지 이동 */
	@PostMapping("updateEnroll.po")
	public ModelAndView updateEnrollFormPost(int postNo, ModelAndView mv) {
		int result = boardService.increaseCount(postNo);
		
		if(result>0) {
			Post p = boardService.selectPost(postNo);
			Attach a = boardService.selectFile(postNo);
			
			mv.addObject("a", a);
			mv.addObject("p", p).setViewName("board/postUpdateEnrollForm");
			return mv;
		} else {
			mv.addObject("errorMsg", "상세조회 요청에 실패하였습니다.").setViewName("common/errorPage");
			return mv;
		}
	}
	
	/* POST 수정 */
	@RequestMapping("update.po")
	public String updateBoard(Post p, Attach a, MultipartFile reupfile, HttpSession session, Model model) {
		int result2 = 0;
		if(!reupfile.getOriginalFilename().equals("")) { // 새로운 첨부파일있는 경우
			
			if(a.getAttOrigin() != null) { // 기존 첨부파일이 있을 경우
					String savePath = session.getServletContext().getRealPath(a.getAttChange());
					
					new File(savePath).delete();
					
					String changeName = saveFile(reupfile, session);

					a.setAttOrigin(reupfile.getOriginalFilename());
					a.setAttChange("resources/images/upfiles"+changeName);
					
					result2 = boardService.updateFile(a);
				} else { // 기존 첨부파일이 없는 경우
					String changeName = saveFile(reupfile, session);
					
					a.setAttOrigin(reupfile.getOriginalFilename());
					a.setAttChange("resources/images/upfiles"+changeName);
					a.setAttPost(Integer.toString(p.getPostNo()));
					result2 = boardService.addFile(a);
				}
			
		} else { // 새로운 첨부파일없는 경우
			if(a.getAttOrigin() != null) { // 기존 첨부파일이 있는 경우
			String savePath = session.getServletContext().getRealPath(a.getAttChange());
			
			new File(savePath).delete();
			int result3 = boardService.deleteFile(a);
			} else { // 기존 첨부파일이 없는 경우
				
			}
		}
		

		int result1 = boardService.updatePost(p);
		
		if(result1+result2 > 0) { // 성공
		session.setAttribute("alertMsg", "성공적으로 게시글 수정되었습니다.");
		
		return "redirect:detail.po?pno=" + p.getPostNo();
		} else { // 실패
		model.addAttribute("errorMsg", "게시글 수정 실패");
		return "common/errorPage";
		}

	}
	
	/* ============================ Reply ============================ */
	/* 댓글 입력 */
	@ResponseBody
	@RequestMapping(value="insert.rep", produces="text/html; charset=UTF-8;")
	public String insertReply(Reply r) {
		return (boardService.insertReply(r)>0) ? "success" : "fail";
	}
	/* 댓글 조회 */
	@ResponseBody
	@RequestMapping(value="list.rep", produces="application/json; charset=UTF-8")
	public String ajaxSelectReplyList(int pno) {
		ArrayList<Reply> list = boardService.selectReplyList(pno);
		
		return new Gson().toJson(list);
	}
	/* 댓글 삭제 */
	@ResponseBody
	@RequestMapping(value="delete.rep", produces="text/html; charset=UTF-8;")
	public String deleteReply(int replyNo, HttpSession session) {
		return (boardService.deleteReply(replyNo)>0) ? "success" : "fail";
		
	}
	
	/* ============================ Report ============================ */
	@ResponseBody
	@RequestMapping(value="report.all", produces="text/html; charset=UTF-8;")
	public String insertReport(Report r) {
		int result1 = boardService.insertReport(r);
		
		return (result1>0)? "success" : "fail";
		
	}
	
	
	/* ============================ Catch ============================ */
	/* CATCH 전체조회 */
	@RequestMapping("list.ca")
	public String listViewCatch(@RequestParam(value="cpage", defaultValue="1") int currentPage, Model model) {
		
		int listCount = boardService.selectCatchListCount();
		
		int pageLimit = 10;
		int boardLimit = 6;
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);
		
		ArrayList<Catch> list = boardService.selectCatchList(pi);
		ArrayList<Attach> a = new ArrayList<Attach>();
		for(int i=0; i<=listCount+1;i++) {
			int catchNo = i;
			a.add(boardService.selectFileTop(catchNo));
		}
		
		model.addAttribute("a", a);
		model.addAttribute("pi", pi);
		model.addAttribute("list", list);
		
		
		return "board/catchListView";
	}

	/* CATCH 상세조회 */
	@RequestMapping("detail.ca")
	public ModelAndView detailCatch(int cno, ModelAndView mv, HttpSession session) {
		int result = boardService.increaseCatchCount(cno);
		if((session.getAttribute("loginUser"))!=null) {
			Like like = new Like();
			like.setLikeUser(((Member)session.getAttribute("loginUser")).getUserNo());
			like.setCatchNo(cno);
			int llist = boardService.selectLike(like);
			mv.addObject("llist", llist);
		}
		if(result>0) {
			Catch c = boardService.selectCatch(cno);
			ArrayList<Attach> alist = boardService.selectFiles(cno);
			int l = boardService.likeCount(cno);
			
			mv.addObject("l", l);
			mv.addObject("alist", alist);
			mv.addObject("c", c).setViewName("board/catchDetailView");
			return mv;
		} else {
			mv.addObject("errorMsg", "상세조회 요청에 실패하였습니다.").setViewName("common/errorPage");
			return mv;
		}
	}
	
	/* CATCH 작성페이지 이동 */
	@RequestMapping("enrollForm.ca")
	public String enrollFormCatch() {
		return "board/catchEnrollForm";
	}
	
	/* CATCH 작성 */
	@RequestMapping("insert.ca")
	public String insertCatch(int catchWriter,Catch c, Attach a, ArrayList<MultipartFile> upfile, HttpSession session, Model model) {
		
		int result2 = 0;
		
		c.setCatchWriter(Integer.toString(catchWriter));
		int result1 = boardService.insertCatch(c);
		int result3 = boardService.getCatchNo();
		if(!(upfile.get(0).getOriginalFilename().equals(""))) {
			for(int i=0;i<upfile.size();i++) {
				String originName = upfile.get(i).getOriginalFilename();
				String changeName = saveFile(upfile.get(i), session);
				
				a.setAttOrigin(upfile.get(i).getOriginalFilename());
				a.setAttChange("resources/images/upfiles"+changeName);
				a.setAttCatch(Integer.toString(result3));
				
				result2 = boardService.insertFiles(a);
			}
		}
		if((result1+result2)>0) {
			session.setAttribute("alertMsg", "성공적으로 게시글이 등록되었습니다.");
			return "redirect:list.ca";
		} else {
			model.addAttribute("errorMsg", "게시글 등록에 실패하였습니다.");
			return "common/errorPage";
		}

		
	}
	
	/* CATCH 삭제 */
	@PostMapping("delete.ca")
	public String deleteCatch(int catchNo, Model model, HttpSession session) {
		int result = boardService.deleteCatch(catchNo);
		
		Attach a = new Attach();
		a.setAttCatch(Integer.toString(catchNo));
		
		ArrayList<Attach> path = boardService.selectFiles(Integer.parseInt(a.getAttCatch()));
		
		if(!path.equals(null)) {
			// 첨부파일있었던 게시글 삭제 시 첨부파일 서버에서 삭제
			for(int i = 0; i<path.size();i++) {
				String realPath = session.getServletContext().getRealPath(path.get(i).getAttChange());
				new File(realPath).delete();
			}

			int result2 = boardService.deleteFiles(a);
			
			// url재요청
			session.setAttribute("alertMsg", "성공적으로 게시글이 삭제되었습니다.");
			
			return "redirect:list.ca";
			
		} else {
			model.addAttribute("errorMsg", "게시글 삭제 실패");
			
			return "common/errorPage";
		}
	}
	
	/* CATCH 수정페이지 이동 */
	@PostMapping("updateEnroll.ca")
	public ModelAndView updateEnrollFormCatch(int catchNo, ModelAndView mv) {
		int result = boardService.increaseCatchCount(catchNo);
		
		if(result>0) {
			Catch c = boardService.selectCatch(catchNo);
			ArrayList<Attach> alist = boardService.selectFiles(catchNo);
			
			mv.addObject("alist", alist);
			mv.addObject("c", c).setViewName("board/catchUpdateEnrollForm");
			return mv;
		} else {
			mv.addObject("errorMsg", "상세조회 요청에 실패하였습니다.").setViewName("common/errorPage");
			return mv;
		}
	}
	
	/* CATCH 수정 */
	@RequestMapping("update.ca")
	public String updateCatch(Catch c, Attach a, ArrayList<MultipartFile> reupfile, HttpSession session, Model model) {
		int result2 = 0;
		a.setAttCatch(Integer.toString(c.getCatchNo()));
		if(reupfile.get(0).getSize()>0) { // 새로운 첨부파일있는 경우
			
			if(a.getAttOrigin() != null) { // 기존 첨부파일이 있는 경우
				ArrayList<Attach> path = boardService.selectFiles(Integer.parseInt(a.getAttCatch()));
				for(int i = 0; i<path.size();i++) {
					String realPath = session.getServletContext().getRealPath(path.get(i).getAttChange());
					new File(realPath).delete();
				}

				int result3 = boardService.deleteFiles(a);
			
					for(int i=0;i<reupfile.size();i++) {
						String originName = reupfile.get(i).getOriginalFilename();
						String changeName = saveFile(reupfile.get(i), session);
						
						a.setAttOrigin(reupfile.get(i).getOriginalFilename());
						a.setAttChange("resources/images/upfiles"+changeName);
						
						result2 = boardService.insertFiles(a);
					}
				} else { // 기존 첨부파일이 없는 경우
					for(int i=0;i<reupfile.size();i++) {
						String originName = reupfile.get(i).getOriginalFilename();
						String changeName = saveFile(reupfile.get(i), session);
						
						a.setAttOrigin(reupfile.get(i).getOriginalFilename());
						a.setAttChange("resources/images/upfiles"+changeName);
						
						result2 = boardService.addFiles(a);
					}
				}
			
		} else { // 새로운 첨부파일없는 경우
			if(a.getAttOrigin() != null) { // 기존 첨부파일이 있는 경우
				ArrayList<Attach> path = boardService.selectFiles(Integer.parseInt(a.getAttCatch()));
				for(int i = 0; i<path.size();i++) {
					String realPath = session.getServletContext().getRealPath(path.get(i).getAttChange());
					new File(realPath).delete();
				}

				int result3 = boardService.deleteFiles(a);
			} else { // 기존 첨부파일이 없는 경우
				
			}
		}
		

		int result1 = boardService.updateCatch(c);
		
		if(result1+result2 > 0) { // 성공
		session.setAttribute("alertMsg", "성공적으로 게시글 수정되었습니다.");
		
		return "redirect:detail.ca?cno=" + c.getCatchNo();
		} else { // 실패
		model.addAttribute("errorMsg", "게시글 수정 실패");
		return "common/errorPage";
		}

	}
	
	/* ============================ Like ============================ */
	@ResponseBody
	@RequestMapping("like.ca")
	public String insertLike(int catchNo, int likeUser) {
		Like l = new Like();
		l.setCatchNo(catchNo);
		l.setLikeUser(likeUser);
		
		return (boardService.insertLike(l)>0)? "success":"fail";
	}
	@ResponseBody
	@RequestMapping("countLike.ca")
	public int selectLike(int catchNo) {
		return boardService.likeCount(catchNo);
	}
	
	
	/* ============================ OpenData ============================ */
	@RequestMapping("list.to")
	public String listViewTogether() {
		return "board/togetherListView";
	}
	
	@ResponseBody
	@RequestMapping(value="data.to", produces="text/xml; charset=UTF-8")
	public String airPollution(String location) throws IOException {
		
		// 현재 날짜 구하는 식
		LocalDate now = LocalDate.now();
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyyMMdd");
		String formatedNow = now.format(formatter);
		
		String url = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/searchFestival";
			url += "?ServiceKey=" + SERVICEKEY;
			url += "&MobileOS=WIN";
			url += "&MobileApp=CatchMind";
			url += "&numOfRows=10000";
			url += "&arrange=C";
			url += "&listYN=Y";
			url += "&eventStartDate="+formatedNow;
			
			// URL값을 저장하는 구문
			URL requestUrl = new URL(url);
			
			// URL과 연결하는 구문
			HttpURLConnection urlConnection = (HttpURLConnection) requestUrl.openConnection();
			
			// 연결할 때 접속방식 선택
			urlConnection.setRequestMethod("GET");
			
			// 연결되었으니 값들 읽어오기
			BufferedReader br = new BufferedReader(new InputStreamReader(urlConnection.getInputStream()));
			
			String responseText = ""; // 응답데이터 기록용 변수
			String line; // null => 한줄 한줄 씩 읽어서 대입해주는 용도
			
			while((line = br.readLine()) != null) {
				responseText += line;
				
			}
			
			br.close();
			urlConnection.disconnect();
			
			
			return responseText;
	}
	
	
	
	
	
	
	
	
	/* ============================ 내 글 관리 ============================ */
	@RequestMapping("myBoard.po")
	public String listViewMyPost(@RequestParam(value="ppage", defaultValue="1") int currentPage, HttpSession session, Model model) {
		
		int userNo = ((Member)session.getAttribute("loginUser")).getUserNo();
		
		int listCount = boardService.selectMyListCount(userNo);
		
		int pageLimit = 10;
		int boardLimit = 10;
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);
		
		
		ArrayList<Post> list = boardService.selectMyList(pi, userNo);
		
		model.addAttribute("pi", pi);
		model.addAttribute("list", list);
		
		return "member/myPage-ManageBoardList";
	}
	
	@RequestMapping("myDetail.po")
	public ModelAndView myDetailPost(int pno, ModelAndView mv) {
		
		int result = boardService.increaseCount(pno);
		
		if(result>0) {
			Post p = boardService.selectPost(pno);
			Attach a = boardService.selectFile(pno);
			ArrayList<Reply> rlist = boardService.selectReplyList(pno);
			
			mv.addObject("a", a);
			mv.addObject("rlist", rlist);
			mv.addObject("p", p).setViewName("board/myPostDetailView");
			return mv;
		} else {
			mv.addObject("errorMsg", "상세조회 요청에 실패하였습니다.").setViewName("common/errorPage");
			return mv;
		}
	}
	@PostMapping("myDelete.po")
	public String myDeleteBoard(int postNo, Model model, String filePath, HttpSession session) {
		int result = boardService.deletePost(postNo);
		
		if(result>0) {
			// 첨부파일있었던 게시글 삭제 시 첨부파일 서버에서 삭제
			if(!filePath.equals("")) {
				String realPath = session.getServletContext().getRealPath(filePath);
				new File(realPath).delete();
			}
			
			// url재요청
			session.setAttribute("alertMsg", "성공적으로 게시글이 삭제되었습니다.");
			
			return "redirect:myBoard.po";
			
		} else {
			model.addAttribute("errorMsg", "게시글 삭제 실패");
			
			return "common/errorPage";
		}
	}
	@PostMapping("myUpdateEnroll.po")
	public ModelAndView myUpdateEnrollFormPost(int postNo, ModelAndView mv) {
		int result = boardService.increaseCount(postNo);
		
		if(result>0) {
			Post p = boardService.selectPost(postNo);
			Attach a = boardService.selectFile(postNo);
			
			mv.addObject("a", a);
			mv.addObject("p", p).setViewName("board/myUpdateEnrollFormPost");
			return mv;
		} else {
			mv.addObject("errorMsg", "상세조회 요청에 실패하였습니다.").setViewName("common/errorPage");
			return mv;
		}
	}
	@RequestMapping("myUpdate.po")
	public String myUpdateBoard(Post p, Attach a, MultipartFile reupfile, HttpSession session, Model model) {
		int result2 = 0;
		if(!reupfile.getOriginalFilename().equals("")) { // 새로운 첨부파일있는 경우
			
			if(a.getAttOrigin() != null) { // 기존 첨부파일이 있을 경우
					String savePath = session.getServletContext().getRealPath(a.getAttChange());
					
					new File(savePath).delete();
					
					String changeName = saveFile(reupfile, session);

					a.setAttOrigin(reupfile.getOriginalFilename());
					a.setAttChange("resources/images/upfiles"+changeName);
					
					result2 = boardService.updateFile(a);
				} else { // 기존 첨부파일이 없는 경우
					String changeName = saveFile(reupfile, session);
					
					a.setAttOrigin(reupfile.getOriginalFilename());
					a.setAttChange("resources/images/upfiles"+changeName);
					a.setAttPost(Integer.toString(p.getPostNo()));
					result2 = boardService.addFile(a);
				}
			
		} else { // 새로운 첨부파일없는 경우
			if(a.getAttOrigin() != null) { // 기존 첨부파일이 있는 경우
			String savePath = session.getServletContext().getRealPath(a.getAttChange());
			
			new File(savePath).delete();
			int result3 = boardService.deleteFile(a);
			} else { // 기존 첨부파일이 없는 경우
				
			}
		}
		

		int result1 = boardService.updatePost(p);
		
		if(result1+result2 > 0) { // 성공
		session.setAttribute("alertMsg", "성공적으로 게시글 수정되었습니다.");
		
		return "redirect:myDetail.po?pno=" + p.getPostNo();
		} else { // 실패
		model.addAttribute("errorMsg", "게시글 수정 실패");
		return "common/errorPage";
		}

	}
	
	
	/* ============================ 기능적 메소드 ============================ */
	public String saveFile(MultipartFile upfile, HttpSession session) {
		// 1. 원본파일명 가져오기
		String originName = upfile.getOriginalFilename();
		
		// 2. 시간 형식을 문자열로 뽑아내기
		// SimpleDateFormat
		String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
		
		// 3. 랜덤값 뽑아내기 
		int ranNum = (int)((Math.random() * 90000)+10000);
		
		// 4. 원본파일명으로부터 확장자 부분만 추출
		// 마지막 .을 시작 인덱스로 잡아서 맨 끝까지 출력시키는 구문
		String ext = originName.substring(originName.lastIndexOf("."));
		
		// 5. 이어붙히기
		String changeName = "/CatchMind_"+currentTime + ranNum + ext;
		
		// 6. 업로드하고자 하는 물리적인 경로 알아내기
		String savePath = session.getServletContext().getRealPath("/resources/images/upfiles/");
		
		// 7. 경로와 수정파일명을 합체시킨 후 저장
		try {
			upfile.transferTo(new File(savePath+changeName));
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}
		
		return changeName;
	}
}
