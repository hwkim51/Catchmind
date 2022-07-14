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
import com.e1i4.catchmind.board.model.vo.Post;
import com.e1i4.catchmind.board.model.vo.Reply;
import com.e1i4.catchmind.board.model.vo.Report;
import com.e1i4.catchmind.common.model.vo.Attach;
import com.e1i4.catchmind.common.model.vo.PageInfo;
import com.e1i4.catchmind.common.template.Pagination;
import com.google.gson.Gson;

@Controller
public class BoardController {
	
	public static final String SERVICEKEY = "EAk%2FcJd62BzsuJHpbCtIksn5S31hprT9toGxp8xmushfAKYmT9OTzNwrznDBK3YOaflpBbZiPPiGB7pyfIYhew%3D%3D";
	
	@Autowired
	private BoardService boardService;
	
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
	
	@RequestMapping("enrollForm.po")
	public String enrollFormPost() {
		return "board/enrollFormPost";
	}
	
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
	
	@PostMapping("delete.po")
	public String deleteBoard(int postNo, Model model, String filePath, HttpSession session) {
		int result = boardService.deletePost(postNo);
		
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
	
	@PostMapping("updateEnroll.po")
	public ModelAndView updateEnrollFormPost(int postNo, ModelAndView mv) {
		int result = boardService.increaseCount(postNo);
		
		if(result>0) {
			Post p = boardService.selectPost(postNo);
			Attach a = boardService.selectFile(postNo);
			
			mv.addObject("a", a);
			mv.addObject("p", p).setViewName("board/updateEnrollFormPost");
			return mv;
		} else {
			mv.addObject("errorMsg", "상세조회 요청에 실패하였습니다.").setViewName("common/errorPage");
			return mv;
		}
	}
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
	
	@ResponseBody
	@RequestMapping(value="insert.rep", produces="text/html; charset=UTF-8;")
	public String insertReply(Reply r) {
		return (boardService.insertReply(r)>0) ? "success" : "fail";
	}
	
	@ResponseBody
	@RequestMapping(value="list.rep", produces="application/json; charset=UTF-8")
	public String ajaxSelectReplyList(int pno) {
		ArrayList<Reply> list = boardService.selectReplyList(pno);
		
		return new Gson().toJson(list);
	}
	
	
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
		
		return (result1>0)? "success" : "faul";
		
	}
	
	
	
	
	
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
	
	@RequestMapping("list.lo")
	public String listViewLove() {
		return "board/loveListView";
	}
	
	
	
	
	
	
	
	
	
	
	// ########################### 기능적 메소드 ###########################
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
