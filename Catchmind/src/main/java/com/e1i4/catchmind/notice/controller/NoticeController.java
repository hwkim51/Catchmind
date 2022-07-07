package com.e1i4.catchmind.notice.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

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
		
		model.addAttribute("list", list);
		model.addAttribute("pi", pi);
		
		return "notice/noticeList";
	}
	
	// 공지사항 상세 조회 - 유진
	@RequestMapping(value="detail.no")
	public String selectNotice(int nno, Model model) {
		
		//1. 먼저 조회수 + 1 처리
		int result = noticeService.increaseCount(nno);
		
		if(result > 0) { //조회수가 증가한 경우
			
			Notice n = noticeService.selectNotice(nno);
		
				// 코드 진행 중 ,,, 220706
		
			model.addAttribute("n", n);
			return "redirect:detail.no?nno=" + nno;
		}
		else { //조회수 증가 실패한 경우
			
			model.addAttribute("errorMsg", "공지사항 조회에 실패했습니다.");
			return ""; //에러 페이지 포워딩
		}
	
	}
}
