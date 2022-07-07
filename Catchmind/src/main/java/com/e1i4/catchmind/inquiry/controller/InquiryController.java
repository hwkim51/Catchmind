package com.e1i4.catchmind.inquiry.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.e1i4.catchmind.inquiry.model.service.InquiryService;
import com.e1i4.catchmind.inquiry.model.vo.Inquiry;


@Controller
public class InquiryController {

	@Autowired
	private InquiryService inquiryService;
	
	//단순히 1:1 문의 작성 화면을 보여주는 메소드 -유진
	@RequestMapping(value="enrollForm.in")
	public String enrollForm() {
		
		return "inquiry/inquiryEnrollForm";
	}
	
	/*
	 *  1:1 문의글 작성 -유진
	 */
	@RequestMapping(value="insert.in")
	public String insertInquiry(Inquiry in, Model model) {
		
		int result = inquiryService.insertInquiry(in);
		
		if(result > 0) { //1:1 문의 작성에 성공한 경우
			
			// 등록 알람 메세지 전달
			// session.addAttribute("alertMsg", "1:1 문의가 등록되었습니다. ");
			
			return "";
		}
		else { //작성 실패한 경우
			
			//오류 메세지 전달
			
			// 메인 화면으로 포워딩? or 에러 페이지로 포워딩
			return "index";
		}
		
	}
	
	
}
