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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.e1i4.catchmind.admin.model.service.AdminService;
import com.e1i4.catchmind.board.model.vo.Board;
import com.e1i4.catchmind.catchboard.model.vo.CatchBoard;
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
	
	@RequestMapping("blackMember.ad")
	public String blackMemeber(String userId, Model model) {
		
		int result = adminService.blackMember(userId);
		
		if(result > 0) {
			model.addAttribute("alertMsg", "black성공!");
			return "admin/memberListView";
		}
		else {
			model.addAttribute("alertMsg", "black실패!");
			return "admin/memberListView";
		}
	}
	
	@RequestMapping("deleteMember.ad")
	public String deleteMember(String userId, Model model) {
		
		int result = adminService.deleteMember(userId);
		
		if(result > 0) {
			model.addAttribute("alertMsg", "탈퇴 성공!");
			return "admin/memberListView";
		}
		else {
			model.addAttribute("alertMsg", "탈퇴 실패!");
			return "admin/memberListView";
		}
	}
	
	@RequestMapping("recoverMember.ad")
	public String recoverMember(String userId, Model model) {
		
		int result = adminService.recoverMember(userId);
		
		if(result > 0) {
			model.addAttribute("alertMsg", "복구 성공!");
			return "admin/memberListView";
		}
		else {
			model.addAttribute("alertMsg", "복구 실패!");
			return "admin/memberListView";
		}
	}
	
	@RequestMapping("updateMember.ad")
	public String updateMember(Member m, Model model) {
		Member updateMem = adminService.updateMember(m);
		
		model.addAttribute("updateMem", updateMem);
		return "admin/memberListView";
	}
	
	@RequestMapping("boardList.ad")
	public String selectBoardList(@RequestParam(value="cpage", defaultValue="1") int currentPage, Model model) {
				
		int listCount = adminService.selectBoardCount();
		
		int pageLimit = 10;
		int boardLimit = 5;
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);
		
		ArrayList<Board> list = adminService.selectBoardList(pi);
		
		model.addAttribute("list", list);
		model.addAttribute("pi", pi);
		
		return "admin/boardListView";
	}
	
	@RequestMapping("catchboardList.ad")
	public String selectCatchBoardList(@RequestParam(value="cpage", defaultValue="1") int currentPage, Model model) {
				
		int listCount = adminService.selectCatchBoardCount();
		
		int pageLimit = 10;
		int boardLimit = 5;
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);
		
		ArrayList<CatchBoard> list = adminService.selectCatchBoardList(pi);
		
		model.addAttribute("list", list);
		model.addAttribute("pi", pi);
		
		return "admin/catchboardListView";
	}
	
	@RequestMapping("inquiryList.ad")
	public String selectInquiryList(@RequestParam(value="cpage", defaultValue="1") int currentPage, Model model) {
		int listCount = adminService.selectInquiryCount();
		
		int pageLimit = 10;
		int boardLimit = 10;
		
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
		int boardLimit = 10;
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);
		
		ArrayList<Notice> list = adminService.selectNoticeList(pi);
		
		model.addAttribute("list", list);
		model.addAttribute("pi", pi);
		
		return "admin/noticeListView";
	}
	
	@RequestMapping("detailNotice.ad")
	public ModelAndView selectNotice(int nno, ModelAndView mv) {
		System.out.println(nno);
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
		int boardLimit = 10;
		
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
}
