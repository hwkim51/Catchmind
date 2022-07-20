package com.e1i4.catchmind.admin.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.e1i4.catchmind.admin.model.service.AdminService;
import com.e1i4.catchmind.board.model.vo.Post;
import com.e1i4.catchmind.board.model.vo.Reply;
import com.e1i4.catchmind.board.model.vo.Report;
import com.e1i4.catchmind.catchboard.model.vo.CatchBoard;
import com.e1i4.catchmind.chat.model.vo.ChatReport;
import com.e1i4.catchmind.common.model.vo.Attach;
import com.e1i4.catchmind.common.model.vo.PageInfo;
import com.e1i4.catchmind.common.template.Pagination;
import com.e1i4.catchmind.faq.model.vo.Faq;
import com.e1i4.catchmind.inquiry.model.vo.Inquiry;
import com.e1i4.catchmind.member.model.vo.Member;
import com.e1i4.catchmind.notice.model.vo.Notice;

@Controller
public class AdminController {
	
	@Autowired
	private AdminService adminService;
	
	@RequestMapping("memberList.ad")
	public String selectMemberList(@RequestParam(value="cpage", defaultValue="1") int currentPage, Model model) {
		
		int listCount = adminService.selectMemberCount();
		
		int pageLimit = 10;
		int boardLimit = 5;
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);
		
		ArrayList<Member> list = adminService.selectMemberList(pi);
		
		model.addAttribute("list", list);
		model.addAttribute("pi", pi);
		
		return "admin/memberListView";
	}
	
	// 회원관리 - 블랙리스트 처리  : 수빈
	@RequestMapping("blackMember.ad")
	public String blackMemeber(String userId, HttpSession session) {
		
		int result = adminService.blackMember(userId);
		
		if(result > 0) {
			session.setAttribute("alertMsg", "'ID : "+userId+"'는 블랙리스트 처리되었습니다.");
			return "redirect:memberList.ad";
		}
		else {
			session.setAttribute("alertMsg", "'ID : "+userId+"' 블랙리스트 처리가 실패되었습니다.");
			return "common/errorPage";
		}
	}
	
	// 회원관리 - 회원탈퇴 처리  : 수빈
	@RequestMapping("deleteMember.ad")
	public String deleteMemberAccount(String userId, HttpSession session) {
		
		int result = adminService.deleteMemberAccount(userId);
		
		if(result > 0) {
			session.setAttribute("alertMsg", "'ID : "+userId+"'는 탈퇴 처리되었습니다.");
			return "redirect:memberList.ad";
		}
		else {
			session.setAttribute("alertMsg", "'ID : "+userId+"' 탈퇴 처리가 실패되었습니다.");
			return "common/errorPage";
		}
	}
	
	// 회원관리 - 회원계정 복구 처리  : 수빈
	@RequestMapping("recoverMember.ad")
	public String recoverMember(String userId, HttpSession session) {
		
		int result = adminService.recoverMember(userId);
		
		if(result > 0) {
			session.setAttribute("alertMsg", "'ID : "+userId+"' 계정이 복구 처리되었습니다.");
			return "redirect:memberList.ad";
		}
		else {
			session.setAttribute("alertMsg", "'ID : "+userId+"' 계정 복구 처리가 실패되었습니다.");
			return "common/errorPage";
		}
	}
	
	@RequestMapping("updateMember.ad")
	public String updateMember(Member m, Model model) {
		Member updateMem = adminService.updateMember(m);
		
		model.addAttribute("updateMem", updateMem);
		return "admin/memberListView";
	}
	
	@RequestMapping("catchList.ad")
	public String selectCatchBoardList(@RequestParam(value="cpage", defaultValue="1") int currentPage, Model model) {
				
		int listCount = adminService.selectCatchBoardCount();
		
		int pageLimit = 10;
		int boardLimit = 5;
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);
		
		ArrayList<CatchBoard> list = adminService.selectCatchBoardList(pi);
		
		model.addAttribute("list", list);
		model.addAttribute("pi", pi);
		
		return "admin/catchListViewAdmin";
	}
	
	@RequestMapping("inquiryList.ad")
	public String selectInquiryList(@RequestParam(value="cpage", defaultValue="1") int currentPage, Model model) {
		int listCount = adminService.selectInquiryCount();
		
		int pageLimit = 10;
		int boardLimit = 5;
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);
		
		ArrayList<Inquiry> list = adminService.selectInquiryList(pi);
		
		model.addAttribute("list", list);
		model.addAttribute("pi", pi);
		
		return "admin/inquiryListView";
	}
	
	@RequestMapping("detailInquiry.ad")
	public ModelAndView selectInquiry(int qno, ModelAndView mv) {
		
		Inquiry in = adminService.selectInquiry(qno);
		
		mv.addObject("in", in).setViewName("admin/inquiryDetailView");
		
		return mv;
	}
	// 에브리타임 복구 기능(인범)
		@RequestMapping(value="recoverfncPost.ad", method=RequestMethod.GET)
		public String recoverfncPost(int postNo, HttpSession session) {
		
			
			int result = adminService.recoverPost(postNo);
			
			if(result > 0) {
				session.setAttribute("alertMsg", "게시글 "+postNo+"번에 대한 복구 처리되었습니다.");
				return "redirect:postList.ad";
			}
			else {
				session.setAttribute("alertMsg", "게시글 "+postNo+"번에 대한 복구 처리에 실패하였습니다.");
				return "common/errorPage";
			}
		}
		
		// 에브리타임 삭제 기능(인범)
		@RequestMapping(value="deletefncPost.ad", method=RequestMethod.GET)
		public String deletefncPost(int postNo, HttpSession session) {
			
			int result = adminService.deletePost(postNo);
			
			if(result > 0) {
				session.setAttribute("alertMsg", "게시글 "+postNo+"번에 대한 삭제 처리되었습니다.");
				return "redirect:postList.ad";
			}
			else {
				session.setAttribute("alertMsg", "게시글 "+postNo+"번에 대한 삭제 처리에 실패하였습니다.");
				return "common/errorPage";
			}
		}
		
		// 연애의발견 복구 기능(인범)
		@RequestMapping(value="recoverfncCatch.ad", method=RequestMethod.GET, produces="application/text;charset=utf-8")
		public String recoverfncCatch(int catchNo, HttpSession session) {
		
			
			int result = adminService.recoverCatch(catchNo);
			
			if(result > 0) {
				session.setAttribute("alertMsg", "게시글 "+catchNo+"번에 대한 복구 처리되었습니다.");
				return "redirect:catchList.ad";
			}
			else {
				session.setAttribute("alertMsg", "게시글 "+catchNo+"번에 대한 복구 처리에 실패하였습니다.");
				return "common/errorPage";
			}
		}
		
		// 연애의발견 삭제 기능(인범)
		@RequestMapping(value="deletefncCatch.ad", method=RequestMethod.GET, produces="application/text;charset=utf-8")
		public String deletefncCatch(int catchNo, HttpSession session) {
			
			int result = adminService.deleteCatch(catchNo);
			
			if(result > 0) {
				session.setAttribute("alertMsg", "게시글 "+catchNo+"번에 대한 삭제 처리되었습니다.");
				return "redirect:catchList.ad";
			}
			else {
				session.setAttribute("alertMsg", "게시글 "+catchNo+"번에 대한 삭제 처리에 실패하였습니다.");
				return "common/errorPage";
			}
		}
	
	@RequestMapping("updateInquiry.ad")
	public String updateInquiryAnswer(Model model, HttpSession session, Inquiry in) {
		
		int result = adminService.updateInquiryAnswer(in);
		
		if(result > 0) {
			return "redirect:detailInquiry.ad?qno="+in.getQaNo();
			
		}
		else {
			model.addAttribute("errorMsg", "답변 등록에 실패하였습니다.");
			return "common/errorMsg";
		}
	}
	
	@RequestMapping("noticeList.ad")
	public String selectList(@RequestParam(value="cpage", defaultValue="1") int currentPage, Model model) {
		int listCount = adminService.selectListCount();
		
		int pageLimit = 10;
		int boardLimit = 5;
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);
		
		ArrayList<Notice> list = adminService.selectNoticeList(pi);
		
		model.addAttribute("list", list);
		model.addAttribute("pi", pi);
		
		return "admin/noticeListView";
	}
	
	@RequestMapping("detailNotice.ad")
	public ModelAndView selectNotice(int nno, ModelAndView mv) {
		
		Notice n = adminService.selectNotice(nno);
		
		mv.addObject("n", n).setViewName("admin/noticeDetailAdmin");
		
		return mv;
	}
	
	@RequestMapping("noticeEnrollForm.ad")
	public String noticeEnrollForm() {
		return "admin/noticeEnrollForm";
	}
	
	@RequestMapping("insertNotice.ad")
	public String insertNotice(Model model,
				  HttpSession session,
				  Notice n,
				  MultipartFile upfile) {
		
		if(!upfile.getOriginalFilename().equals("")) {
			
			String changeName = saveFile(upfile, session);
			n.setOriginName(upfile.getOriginalFilename());
			n.setChangeName("resources/noticeUploadFiles/"+changeName);
		}
		
		int result = adminService.insertNotice(n);
		
		if(result > 0) {
			session.setAttribute("alertMsg", "공지사항을 등록하였습니다.");
			return "redirect:noticeList.ad";
		}
		else {
			model.addAttribute("errorMsg", "1:1 문의 등록에 실패하였습니다. ");
			return "common/errorPage";
		}
	}
	
	@RequestMapping("updateFormNo.ad")
	public String updateFormNotice(int noticeNo, Model model) {
		
		Notice n = adminService.updateFormNotice(noticeNo);
		model.addAttribute("n", n);
		return "admin/updateFormNotice";
		
	}
	
	@RequestMapping("updateNo.ad")
	public String updateNotice(Notice n,
							   MultipartFile reUpfile,
							   Model model,
							   HttpSession session) {
		
		if(!reUpfile.getOriginalFilename().equals("")) { //새로 첨부된 파일명이 있을 경우
			
			if(n.getOriginName() != null) { //기존 첨부 파일의 원본명이 있을 경우
				
				//기존 첨부파일을 서버로부터 삭제(수정명으로 진행)
				String savePath = session.getServletContext().getRealPath(n.getChangeName());
				new File(savePath).delete();
			}

			String changeName = saveFile(reUpfile, session);
			n.setChangeName("resources/noticeUploadFiles/"+changeName);
			n.setOriginName(reUpfile.getOriginalFilename());
		}	
		int result = adminService.updateNotice(n);
		if(result>0) {
			
			session.setAttribute("alertMsg", "공지사항을 수정하였습니다.");
			return "redirect:noticeList.ad";
		}else {
			
			model.addAttribute("errorMsg", "공지사항 수정에 실패하였습니다.");
			return "common/errorPage";
		}
	}
	
	@RequestMapping("deleteNo.ad")
	public String deleteNotice(int noticeNo, Model model, HttpSession session) {
		
		int result = adminService.deleteNotice(noticeNo);
		
		if(result > 0) {
			session.setAttribute("alertMsg", "공지사항을 삭제하였습니다.");
			return "redirect:noticeList.ad";
		}
		else {
			model.addAttribute("errorMsg", "공지사항 삭제에 실패하였습니다.");
			return "common/errorPage";
		}
	}
	
	@RequestMapping("recoverNo.ad")
	public String recoverNotice(int noticeNo, Model model, HttpSession session) {
		
		int result = adminService.recoverNotice(noticeNo);
		
		if(result > 0) {
			session.setAttribute("alertMsg", "공지사항을 복구하였습니다.");
			return "redirect:noticeList.ad";
		}
		else {
			model.addAttribute("errorMsg", "공지사항 복구에 실패하였습니다.");
			return "common/errorPage";
		}
	}
	
	@RequestMapping("faqList.ad")
	public String selectFaqList(@RequestParam(value="cpage", defaultValue="1") int currentPage, Model model) {
		
		int listCount = adminService.selectFaqCount();
		
		int pageLimit = 10;
		int boardLimit = 5;
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);
		
		ArrayList<Faq> list = adminService.selectFaqList(pi);
		model.addAttribute("list", list);
		model.addAttribute("pi", pi);
		return "admin/faqListView";
	}
	
	@RequestMapping("insertFaq.ad")
	public String insertFaq(Faq f, Model model, HttpSession session) {
		
		int result = adminService.insertFaq(f);
		if(result > 0) {
			session.setAttribute("alertMsg", "faq를 등록하였습니다.");
			return "redirect:faqList.ad";
		}else {
			model.addAttribute("errorMsg", "faq 등록에 실패하였습니다.");
			return "common/errorPage";
		}
	}
	
	@RequestMapping("deleteFaq.ad")
	public String deleteFaq(int fno, Model model, HttpSession session) {
		
		int result = adminService.deleteFaq(fno);
		if(result > 0) {
			session.setAttribute("alertMsg", "FAQ를 삭제하였습니다.");
			return "redirect:faqList.ad";
		}else {
			model.addAttribute("errorMsg", "faq 삭제에 실패하였습니다.");
			return "common/errorPage";
		}
	}
	
	
	// 사진 첨부 관련 메소드
	public String saveFile(MultipartFile upfile, HttpSession session) {
		
		
		String originName = upfile.getOriginalFilename(); 
		String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
		int ranNum = (int)(Math.random() * 90000 + 10000); 		
		String ext = originName.substring(originName.lastIndexOf("."));		
		String changeName = currentTime + ranNum + ext;		
		String savePath = session.getServletContext().getRealPath("/resources/noticeUploadFiles/");
		
		try {
			upfile.transferTo(new File(savePath + changeName));
		} catch (IOException e) {
			e.printStackTrace();
		}
					
		return changeName;
	}
	
	// 통계 페이지 : 수빈
	@RequestMapping("statistics.ad")
	public String statistics() {
		return "admin/statistics";
	}
	
	//에브리타임 전체 조회 (유진)
	@RequestMapping("postList.ad")
	public String selectPostList(@RequestParam(value="cpage", defaultValue="1") int currentPage, Model model) {
		
		int listCount = adminService.selectPostCount();
		// System.out.println(listCount);
		
		int pageLimit = 10;
		int boardLimit = 5;
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);
		
		ArrayList<Post> list = adminService.selectPostList(pi);
		// System.out.println(list);
		model.addAttribute("list", list);
		model.addAttribute("pi", pi);
		
		return "admin/postListViewAdmin";
	}
	
	
	
	// 게시판 신고 내역 전체 조회(유진)
	@RequestMapping("reportList.ad")
	public String selectReportList(@RequestParam(value="cpage", defaultValue="1") int currentPage, Model model) {
		
		int listCount = adminService.selectReportCount();
		
		int pageLimit = 10;
		int boardLimit = 5;
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);
		
		ArrayList<Report> list = adminService.selectReportList(pi);
		model.addAttribute("list", list);
		model.addAttribute("pi", pi);
		
		return "admin/reportListView";
	}
	
	//에브리타임 신고글 상세 조회
	@RequestMapping("detailPost.ad")
	public ModelAndView detailPostReport(int reportNo, ModelAndView mv) {
		
		Post p = adminService.detailPostReport(reportNo);
		Attach a = adminService.selectFile(reportNo);
		ArrayList<Reply> rlist = adminService.selectReplyList(reportNo);
		
		mv.addObject("a", a);
		mv.addObject("rlist", rlist);
		mv.addObject("p", p).setViewName("admin/reportDetailView");
		return mv;
	}
	
	//에브리타임 신고된 게시글 삭제 처리
	@RequestMapping("deletePo.ad")
	public String deletePost(int postNo, Model model, HttpSession session) {
		System.out.println(postNo);
		int result = adminService.deletePost(postNo);
		System.out.println(result);
		if(result > 0) {
			session.setAttribute("alertMsg", "신고된 게시글 처리 완료");
			return "redirect:reportList.ad";
		}
		else {
			model.addAttribute("errorMsg", "처리 실패");
			return "common/errorPage";
		}
	}
	
	@RequestMapping("deleteReply.ad")
	public String deleteReply(int replyNo, Model model) {
		
		int result = adminService.deleteReply(replyNo);
		if(result > 0){
			return "redirect:reportList.ad";
		}else {
			model.addAttribute("errorMsg", "댓글 삭제  실패");
			return "common/errorPage";
		}
	}
	
	// 채팅 신고 내역 전체 조회(유진)
	@RequestMapping("chatReportList.ad")
	public String selectChatReportList(@RequestParam(value="cpage", defaultValue="1") int currentPage, Model model) {
		
		int listCount = adminService.selectChatReportCount();
		
		int pageLimit = 10;
		int boardLimit = 5;
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);
		
		ArrayList<ChatReport> list = adminService.selectChatReportList(pi);
		model.addAttribute("list", list);
		model.addAttribute("pi", pi);
		
		return "admin/chatReportListView";
	}
	
	@RequestMapping("deleteChatReportMember.ad")
	public String deleteChatReportMember(int userNo, Model model, HttpSession session) {
		
		int result = adminService.deleteChatReportMember(userNo);
		if(result > 0) {
			session.setAttribute("alertMsg", "유저 차단 성공");
			return "redirect:chatReportList.ad";
		}else {
			model.addAttribute("errorMsg", "유저 차단  실패");
			return "common/errorPage";
		}
	
	}
	
	@GetMapping("/error")
	public String error(HttpSession session) {
		session.setAttribute("alertMsg", "잘못된 접근입니다.\n메인 페이지로 이동했습니다.");
		return "redirect:/";
	}
	
	
	/*
	@RequestMapping("detailCatch.ad")
	public ModelAndView detailCatchReport(int reportNo, ModelAndView mv) {
		
		Catch c = adminService.detailCatchReport(reportNo);
		Attach a = adminService.selectFileTop(reportNo);
		
		mv.addObject("a", a);
		mv.addObject("c", c).setViewName("admin/reportCatchDetailView");
		return mv;
	}
	
	@RequestMapping("detail.ca")
	public ModelAndView detailCatch(int cno, ModelAndView mv, HttpSession session) {
		int result = adminService.increaseCatchCount(cno);
		if((session.getAttribute("loginUser"))!=null) {
			Like like = new Like();
			like.setLikeUser(((Member)session.getAttribute("loginUser")).getUserNo());
			like.setCatchNo(cno);
			int llist = adminService.selectLike(like);
			mv.addObject("llist", llist);
		}
		if(result>0) {
			Catch c = adminService.selectCatch(cno);
			ArrayList<Attach> alist = adminService.selectFiles(cno);
			int l = adminService.likeCount(cno);
			
			mv.addObject("l", l);
			mv.addObject("alist", alist);
			mv.addObject("c", c).setViewName("board/catchDetailView");
			return mv;
		} else {
			mv.addObject("errorMsg", "상세조회 요청에 실패하였습니다.").setViewName("common/errorPage");
			return mv;
		}
	}
	*/
}
