package com.e1i4.catchmind.notice.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.e1i4.catchmind.common.model.vo.PageInfo;
import com.e1i4.catchmind.common.template.Pagination;
import com.e1i4.catchmind.notice.model.service.NoticeService;
import com.e1i4.catchmind.notice.model.vo.Notice;


@Controller
public class NoticeController {

	@Autowired
	private NoticeService noticeService;
	
	// 공지사항 전체 조회 - 유진
	   @RequestMapping(value="list.no")
	   public String selectList(@RequestParam(value="cpage", defaultValue="1") int currentPage, Model model) {
	      
	      // 먼저 페이징 처리를 위해 변수 세팅
	      int listCount = noticeService.selectListCount();
	      int pageLimit = 10;
	      int boardLimit = 5;
	      
	      PageInfo pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);
	      
	      ArrayList<Notice> list = noticeService.selectList(pi);
	      if(!list.isEmpty()) {
	         String pic = list.get(0).getChangeName();
	         model.addAttribute("pic", pic);
	      }
	      model.addAttribute("list", list);
	      model.addAttribute("pi", pi);
	      
	      
	      return "notice/noticeList";
	   }
	
	// 공지사항 상세 조회 - 유진
	@RequestMapping(value="detail.no")
	public ModelAndView selectNotice(int nno, ModelAndView mv) {
		
		//1. 먼저 조회수 + 1 처리
		int result = noticeService.increaseCount(nno);
		
		if(result > 0) { //조회수가 증가한 경우
			
			Notice n = noticeService.selectNotice(nno);
			mv.addObject("n", n).setViewName("notice/noticeDetailView");
		}
		else { //조회수 증가 실패한 경우
			
			mv.addObject("errorMsg", "게시글 상세 조회에 실패하였습니다.").setViewName("common/errorPage");			
		}
		return mv;
	}
}
