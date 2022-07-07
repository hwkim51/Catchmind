package com.e1i4.catchmind.test.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.e1i4.catchmind.test.model.vo.Test;

@Controller
public class TestController {
	
	@RequestMapping("mbtiTest.te")
	public String mbtiTest() {
		
		return "test/mbtiTestView";
	}
	
	@RequestMapping("mbtiResult.te")
	public String mbtiResult(String mbtiResult, HttpSession session) {
		
		Test testResult = new Test();
		
		System.out.println("mbti 결과" + mbtiResult);
		
		if(mbtiResult.equals("ESTP")) {
			
			testResult = new Test("./resources/images/mbtiResult/ESTP_ResultImg.png", "모험을 즐기는 사업가", "ESTP", 
					"주변에 지대한 영향을 주는 사업가형 사람은 여러 사람이 모인 행사에서 이 자리 저 자리 휙휙 옮겨 다니는 무리 중에서 어렵지 않게 찾아볼 수 있습니다. 직설적이면서도 친근한 농담으로 주변 사람을 " + 
					"웃게 만드는 이들은 주변의 이목을 끄는 것을 좋아합니다. 만일 관객 중 무대에 올라올 사람을 호명하는 경우, 이들은 제일 먼저 자발적으로 손을 들거나 아니면 쑥스러워하는 친구를 대신하여 망설임 " + 
					"없이 무대에 올라서기도 합니다.");
			
		} else if(mbtiResult.equals("ESTJ")) {
			
		} else if(mbtiResult.equals("ESFP")) {
			
		} else if(mbtiResult.equals("ESFJ")) {
			
		} else if(mbtiResult.equals("ENFP")) {
			
		} else if(mbtiResult.equals("ENFJ")) {
			
		} else if(mbtiResult.equals("ENFP")) {
			
		} else if(mbtiResult.equals("ENFJ")) {
			
		} else if(mbtiResult.equals("ENTP")) {
			
		} else if(mbtiResult.equals("ENTJ")) {
			
		} else if(mbtiResult.equals("ISTJ")) {
			
		} else if(mbtiResult.equals("ISTP")) {
			
		} else if(mbtiResult.equals("ISFJ")) {
			
		} else if(mbtiResult.equals("ISFP")) {
			
		} else if(mbtiResult.equals("INFJ")) {
			
		} else if(mbtiResult.equals("INFP")) {
			
		} else if(mbtiResult.equals("INTJ")) {
			
		} else if(mbtiResult.equals("INTP")) {
			
		}
		
		System.out.println(testResult);
		session.setAttribute("testResult", testResult);
		
		return "test/mbtiResultView";
	}
}
