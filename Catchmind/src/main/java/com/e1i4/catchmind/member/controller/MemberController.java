package com.e1i4.catchmind.member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.e1i4.catchmind.member.model.service.MemberService;
import com.e1i4.catchmind.member.model.vo.Member;

@Controller
public class MemberController {

	@Autowired
	private MemberService memberService;
	
	// 로그인페이지로 이동
	@RequestMapping(value="loginPage.me")
	public String loginPage() {		
		return "member/login"; 	
	}
	
	// 로그인(select)
	@RequestMapping(value="login.me")
	public String loginMember(
								Member m,
								HttpSession session) {		
		Member loginUser = memberService.loginMember(m);

		if(loginUser == null) {
			session.setAttribute("alertMsg", "일치하는 회원정보가 없습니다.");
			return "redirect:loginPage.me";
		}
		else { 
			session.setAttribute("loginUser", loginUser);
			return "redirect:/"; 	
		}
	}
	
	// 로그아웃 => 마이페이지 생성하면 거기서 로그아웃버튼만들기 ?(수빈)
	@RequestMapping(value="logout.me")
	public String logoutMember() {
		return ""; 
	}
	
	@RequestMapping(value="enrollForm.me")
	public String enrollForm() {
		return "member/memberEnrollForm";
	}
	
	// 아이디 중복체크(select)
	@ResponseBody
	@RequestMapping(value="idCheck.me", produces="text/html; charset=UTF-8")
	public String idCheck(String checkId) {
		int count = memberService.idCheck(checkId);
		return (count>0)?"NNNNN" : "NNNNY"; 
	}
	
	// 아이디 찾기 페이지로 이동
	@RequestMapping(value="findIdPage.me")
	public String findIdPage() {	
		return "member/findId"; 	
	}
	
	// 아이디 찾기 
	@RequestMapping(value="findId.me")
	public String findId(
							Member m,
							Model model
			) {	
		Member findUser = memberService.findId(m);
		model.addAttribute("findUser",findUser);
		
		return "member/findResult"; 	
	}
	
	// 비밀번호 찾기 페이지로 이동
	@RequestMapping(value="findPwdPage.me")
	public String findPwdPage() {
		return "member/findPwd"; 	
	}
	
	// 비밀번호 찾기 - 일치회원 조회
	@RequestMapping(value="findPwd.me")
	public String findPwd(
							Member m,
							Model model
			) {	
		Member findUser = memberService.findPwd(m);
		model.addAttribute("findUser",findUser);
		
		return "member/changePwd"; 	
	}
	
//	// 비밀번호 찾기 - 변경 ( 실패 ing임 .. ^^ (수빈))
//	@ResponseBody
//	@RequestMapping(value="changePwd.me", produces="text/html; charset=UTF-8")
//	public String changePwd(
//							String userId, 
//							String userPwd,
//							Member m,
//							HttpSession session) {	
//		
//		int result = memberService.changePwd(m);
//		
//		System.out.println(result);
//		return (result>0)?"NNNNN" : "NNNNY"; 
//	}
	
	// 회원가입(insert)
//	@RequestMapping(value="insert.me")
//	public String insertMember(Member m) {
//		
//		
//		return "member/login";
//	}
	
	// 닉네임 중복체크(select)
	@ResponseBody
	@RequestMapping(value="nicknameCheck.me", produces="text/html; charset=UTF-8")
	public String nicknameCheck(String nickname) {
		int count = memberService.nicknameCheck(nickname);
		System.out.println(count);
		return (count>0)? "NNNNN" : "NNNNY"; 
	}
	
}
