package com.e1i4.catchmind.faq.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.e1i4.catchmind.faq.model.service.FaqService;
import com.e1i4.catchmind.faq.model.vo.Faq;
import com.google.gson.Gson;

@Controller
public class FaqController {

	@Autowired
	private FaqService faqService;
	
	// ajax로 faq 화면 구성 -유진
	@ResponseBody
	@RequestMapping(value="question.faq", produces="application/json; charset=UTF-8")
	public String selectFaq(int faqNo){
		
		ArrayList<Faq> list = faqService.selectFaq(faqNo); 
		return new Gson().toJson(list);
	}
	
	// faq_Info 페이지 조회 - 유진
	@RequestMapping(value="catchTalk.faq")
	public String catchTalk() {
		
		return "faq/faq_Info"; //단순히 faq_Info 페이지를 보여주는 코드
	}
	
	// faqList 페이지 조회 - 유진
	@RequestMapping(value="catchTalkChat.faq")
	public String catchTalkChat() {
		
		return "faq/faqList"; //단순히 faqList 페이지를 보여주는 코드
	}
	
	
	
}
