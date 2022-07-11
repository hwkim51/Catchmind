package com.e1i4.catchmind.member.controller;


import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

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
	
	// 마이페이지로 이동
	@RequestMapping(value="myPage.me")
	public String myPage() {
		
		return "member/myPage";
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
			int updateRecentLogin = updateRecentLogin(m);
			return "redirect:/"; 	
		}
	}
	
	// 로그인 시 recentLogin 업데이트(update)
	public int updateRecentLogin(Member m) {
		int updateRecentLogin = memberService.updateRecentLogin(m);
		return updateRecentLogin;
	}
	
	// 로그아웃 => 마이페이지 생성하면 거기서 로그아웃버튼만들기 ?(수빈)
	@RequestMapping(value="logout.me")
	public String logoutMember() {
		return ""; 
	}
	
	// 아이디 중복체크(select)
	@ResponseBody
	@RequestMapping(value="idCheck.me", produces="text/html; charset=UTF-8")
	public String idCheck(String checkId) {
		int count = memberService.idCheck(checkId);
		return (count>0)?"NNNNN" : "NNNNY"; 
	}
	
	// 닉네임 중복체크(select)
	@ResponseBody
	@RequestMapping(value="nicknameCheck.me", produces="text/html; charset=UTF-8")
	public String nicknameCheck(String nickname) {
		int count = memberService.nicknameCheck(nickname);
		return (count>0)? "NNNNN" : "NNNNY"; 
	}
		
	// 아이디 찾기 페이지로 이동
	@RequestMapping(value="findIdPage.me")
	public String findIdPage() {	
		return "member/findId"; 	
	}
	
	// 아이디 찾기 
	@RequestMapping(value="result.me")
	public String findId(
							Member m,
							Model model,
							HttpSession session
			) {	
		Member findUser = memberService.findId(m);
		session.setAttribute("resultMsg", "입력한 정보로 찾은 회원 조회 결과 입니다.");
		model.addAttribute("findUser",findUser);
		return "member/findResult"; 	
	}
	
	// 비밀번호 찾기 페이지로 이동
	@RequestMapping(value="findPwdPage.me")
	public String findPwdPage() {
		return "member/findPwd"; 	
	}
	
	// 비밀번호 찾기 - step1) ajax로 이메일 인증번호 보내기
	@ResponseBody
	@RequestMapping(value="sendEmail.me", produces="text/html; charset=UTF-8")
	public void getCertificationNum(String email,
									HttpServletResponse response) throws ServletException, IOException {
			
			int otp = (int)(Math.random() * 999999) + 100000;
			
			// 이메일로 otp 값 보내고
			String recipient = email;
	        String code = String.valueOf(otp);
	 
	        // 1. 발신자의 메일 계정과 비밀번호 설정
	        final String user = "catchmindofficialacount@gmail.com";
	        final String password = "equcnttfysvizeqc";
	 
	        // 2. Property에 SMTP 서버 정보 설정
	        Properties prop = new Properties();
	        prop.put("mail.smtp.host", "smtp.gmail.com");
	        prop.put("mail.smtp.port", 465);
	        prop.put("mail.smtp.auth", "true");
	        prop.put("mail.smtp.ssl.enable", "true");
	        prop.put("mail.smtp.ssl.trust", "smtp.gmail.com");
	 
	        // 3. SMTP 서버정보와 사용자 정보를 기반으로 Session 클래스의 인스턴스 생성
	        Session session = Session.getDefaultInstance(prop, new javax.mail.Authenticator() {
	            protected PasswordAuthentication getPasswordAuthentication() {
	                return new PasswordAuthentication(user, password);
	            }
	        });
	 
	        // 4. Message 클래스의 객체를 사용하여 수신자와 내용, 제목의 메시지를 작성한다.
	        // 5. Transport 클래스를 사용하여 작성한 메세지를 전달한다.
	 
	        MimeMessage message = new MimeMessage(session);
	        try {
	            message.setFrom(new InternetAddress(user));
	 
	            // 수신자 메일 주소
	            message.addRecipient(Message.RecipientType.TO, new InternetAddress(recipient));
	 
	            // Subject
	            message.setSubject("[CATCHMIND] 인증코드를 확인해 주세요");
	 
	            // Text
	            message.setText("인증코드를 확인 후 입력해 주세요 : "+ code);
	 
	            Transport.send(message);    // send message
	 
	 
	        } catch (AddressException e) {
	            e.printStackTrace();
	        } catch (MessagingException e) {
	            e.printStackTrace();
	        }
			
			// 응답데이터로 otp 값 보내고
			response.setContentType("text/html; charset=UTF-8");
			response.getWriter().print(otp);
	}
		
	// 비밀번호 찾기 - step2) 일치회원 조회
	@RequestMapping(value="findPwd.me")
	public String findPwd(
							Member m,
							Model model
			) {	
		Member findUser = memberService.findPwd(m);
		model.addAttribute("findUser",findUser);
		
		return "member/changePwd"; 	
	}
	
	// 비밀번호 찾기 - step3) 변경 서비스
	@RequestMapping(value="changePwd.me")
	public String changePwd(
							Member m,
							Model model,
							HttpSession session) {	
		
		int result = memberService.changePwd(m);
		
		if(result>0) {
			session.setAttribute("resultMsg", "비밀번호가 성공적으로 변경되었습니다.");
			model.addAttribute("findUser",m);
			return "member/findResult";
		}
		else {
			model.addAttribute("errorMsg","비밀번호 변경 실패");
			return "errorPage";
		}
	}
	
	// 회원가입 페이지로 이동
		@RequestMapping(value="enrollForm.me")
		public String enrollForm() {
			return "member/memberEnrollForm";
		}
		
	// 회원가입(insert)
	@RequestMapping(value="insert.me")
	public String insertMember(
								Member m,
								MultipartFile upfilePic,
								Model model,
								HttpSession session
								) {
		
		if(!upfilePic.getOriginalFilename().equals("")) {
			String changeName = saveFile(upfilePic, session);
			m.setPic("resources/picUploadFiles/" + changeName);
			
		}
		int result = memberService.insertMember(m);
		
		if(result > 0 ) {
			session.setAttribute("resultMsg", "성공적으로 회원가입이 완료되었습니다.");
			model.addAttribute("findUser",m);
				return "member/findResult";
		}else {
			model.addAttribute("errorMsg","회원가입 실패");
			return "errorPage";
		}
	}
	
	@RequestMapping(value="match.me")
	public String matchList(Member m, Model model) {
		ArrayList<Member> list = memberService.matchList(m);
		return "";
	}
	
	// 회원가입 시 프로필 사진 저장 메소드
	public String saveFile(MultipartFile upfilePic, HttpSession session) {
		
		String originName = upfilePic.getOriginalFilename();
		String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
		int ranNum = (int)(Math.random() * 90000 + 10000);
		String ext = originName.substring(originName.lastIndexOf("."));
		String changeName = currentTime + ranNum + ext;
		String savePath = session.getServletContext().getRealPath("/resources/picUploadFiles/");
		try {
			upfilePic.transferTo(new File(savePath + changeName));
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}
		return changeName;
	}
	
}
