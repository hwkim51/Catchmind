package com.e1i4.catchmind.member.controller;


import java.io.File;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
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
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.e1i4.catchmind.chat.model.service.ChatService;
import com.e1i4.catchmind.member.model.service.MemberService;
import com.e1i4.catchmind.member.model.vo.Block;
import com.e1i4.catchmind.member.model.vo.Follow;
import com.e1i4.catchmind.member.model.vo.Member;
import com.google.gson.Gson;

@Controller
public class MemberController {

	@Autowired
	private MemberService memberService;
	
	@Autowired
	private ChatService chatService;
	
	// 로그인페이지로 이동
	@RequestMapping(value="loginPage.me")
	public String loginPage() {		
		return "member/login";
	}
	
	// 마이페이지로 이동 : 수빈
	@RequestMapping(value="myPage.me")
	public String myPage(HttpSession session) {
		
		String partner = ((Member)session.getAttribute("loginUser")).getPartner();
		
		// 커플 회원 정보 조회
		Member coupleMem = memberService.selectCoupleInfo(partner);
		session.setAttribute("coupleMem", coupleMem);
		
		String myImage = memberService.myImage((Member)session.getAttribute("loginUser"));
		session.setAttribute("image", myImage);
		return "member/myPage";
	}
	
	// 로그인(select) : 수빈
	@RequestMapping(value="login.me")
	public String loginMember(
								Member m,
								HttpSession session) {		
		Member loginUser = memberService.loginMember(m);
		//System.out.println(loginUser.getRecentLogin().getTime());
		//System.out.println(loginUser.getRecentLogout().getTime());
		
		if(loginUser == null) {
			session.setAttribute("alertMsg", "일치하는 회원정보가 없습니다.");
			
			return "redirect:loginPage.me";
		}
		else if(loginUser.getUserId().equals("admin")) {
			session.setAttribute("loginUser", loginUser);
			int updateRecentLogin = updateRecentLogin(m);
			return "redirect:memberList.ad";
		}
		else { 
			session.setAttribute("loginUser", loginUser);
			int updateRecentLogin = updateRecentLogin(m);
			return "redirect:/"; 	
		}
	}
	
	// 로그인 시 recentLogin 업데이트(update) : 수빈
	public int updateRecentLogin(Member m) {
		int updateRecentLogin = memberService.updateRecentLogin(m);
		
		return updateRecentLogin;
	}
	
	// 로그아웃  : 수빈 - 세션 만료 전 recent_logout 구문 추가(유진220715)
	@RequestMapping(value="logout.me")
	public String logoutMember(HttpSession session) {
		
	    if((Member)session.getAttribute("loginUser")!=null) {
	    	
		String userId = ((Member)session.getAttribute("loginUser")).getUserId();
	    int updateRecentLogout = memberService.updateRecentLogout(userId);
	   
	    
	    	session.invalidate();
			return "redirect:/"; 
	    } 
		else {
	    	return "redirect:/";
	    }
	}
	
	// 아이디 중복체크(select) : 수빈
	@ResponseBody
	@RequestMapping(value="idCheck.me", produces="text/html; charset=UTF-8")
	public String idCheck(String checkId) {
		int count = memberService.idCheck(checkId);
		return (count>0)?"NNNNN" : "NNNNY"; 
	}
	
	// 닉네임 중복체크(select) : 수빈
	@ResponseBody
	@RequestMapping(value="nicknameCheck.me", produces="text/html; charset=UTF-8")
	public String nicknameCheck(String nickname) {
		int count = memberService.nicknameCheck(nickname);
		return (count>0)? "NNNNN" : "NNNNY"; 
	}
	
	// 이메일 중복체크(select) : 수빈
	@ResponseBody
	@RequestMapping(value="emailCheck.me", produces="text/html; charset=UTF-8")
	public String emailCheck(String email) {
		int count = memberService.emailCheck(email);
		return (count>0)? "NNNNN" : "NNNNY"; 
	}
	
	// 휴대폰 중복체크(select) : 수빈
	@ResponseBody
	@RequestMapping(value="phoneCheck.me", produces="text/html; charset=UTF-8")
	public String phoneCheck(String phone) {
		// System.out.println(phone);
		int count = memberService.phoneCheck(phone);
		return (count>0)? "NNNNN" : "NNNNY"; 
	}
	
	
	// 아이디 찾기 페이지로 이동 : 수빈
	@RequestMapping(value="findIdPage.me")
	public String findIdPage() {	
		return "member/findId"; 	
	}
	
	// 아이디 찾기  : 수빈
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
	
	// 비밀번호 찾기 페이지로 이동 : 수빈
	@RequestMapping(value="findPwdPage.me")
	public String findPwdPage() {
		return "member/findPwd"; 	
	}
	
	// 비밀번호 찾기 - step1) ajax로 이메일 인증번호 보내기 : 수빈
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
		
	// 비밀번호 찾기 - step2) 일치회원 조회 : 수빈
	@RequestMapping(value="findPwd.me")
	public String findPwd(
							Member m,
							Model model
			) {	
		Member findUser = memberService.findPwd(m);
		model.addAttribute("findUser",findUser);
		
		return "member/changePwd"; 	
	}
	
	// 비밀번호 찾기 - step3) 변경 서비스 : 수빈
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
	
	// 회원가입 페이지로 이동 : 수빈
	@RequestMapping(value="enrollForm.me")
	public String enrollForm() {
		return "member/memberEnrollForm";
	}
		
	// 회원가입(insert) : 수빈
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
	
	// 마이페이지 - 팔로우 리스트 페이지로 이동(유진)
	@RequestMapping(value="myFollow.me")
	public String followList() {
		
		return "member/myPage-FollowList";
	}
	
	// 로그아웃 버튼 누르거나 or 창 닫으면 recent_logout 업데이트 메소드 (유진)
	public int updateRecentLogout(String userId) {
		
		//Member m = (Member)session.getAttribute("loginUser");
		int updateRecentLogout = memberService.updateRecentLogout(userId);
		return updateRecentLogout;
	}
	
	// ajax로 팔로우한 유저의 정보 조회 메소드(유진)
	// 팔로우한 회원의 mbti, 닉네임, 자기소개, 프로필 사진, recent_logout 정보 필요
	@ResponseBody
	@RequestMapping(value="fList.me", produces="application/json; charset=UTF-8")
	public String selectFollowList(int userNo) {
		
		ArrayList<Member> list = memberService.selectFollowList(userNo);
		
		for(int i=0; i<list.size(); i++) {
			
			Long recentLogout = list.get(i).getRecentLogout().getTime();
			//System.out.println("recentLogout:"+recentLogout);
			
			Date date = new Date();
			Long sysdateTime = date.getTime();
			//System.out.println("sysdateTime:"+sysdateTime);
			
			long result = sysdateTime - recentLogout;
			//System.out.println("result:"+result);
			
			if(result > 15000){//15초 차이
				list.get(i).setStatus(4); //디비 안가고 테스트 용(접속x)
			} else {
				list.get(i).setStatus(5); //디비 안가고 테스트 용(접속o)
			}
			//System.out.println("arraylist-status:"+list.get(i).getStatus());
		}
		return new Gson().toJson(list);
	}
	
	// 차단한 유저의 정보 조회 메소드(유진)
	@RequestMapping("myBlock.me")
	public String selectBlockList(Model model, HttpSession session) {
		
		if((Member)session.getAttribute("loginUser")!=null) {
		
		int userNo = ((Member)session.getAttribute("loginUser")).getUserNo();
		ArrayList<Member> list = memberService.selectBlockList(userNo);
		
		model.addAttribute("list", list);
		return "member/myPage-BlockList";
		} else {
			return "redirect:/";
		}
	}
	
	// 차단된 회원 차단 해제하는 메소드(유진)
	@RequestMapping("deleteBlock.me")
	public String deleteBlockMember(HttpSession session,
									int blno,
									Model model) {
		
		if((Member)session.getAttribute("loginUser")!=null) {
		    
			int userNo = ((Member)session.getAttribute("loginUser")).getUserNo();
			
			Block b = new Block();
			b.setUserNo(userNo);
			b.setBlockedUser(blno);
			
			int result = memberService.deleteBlockMember(b);
		
			if(result > 0) {
				//session.setAttribute("alertMsg", "해당 회원 차단을 해제하였습니다.");
				return "redirect:myBlock.me";
			}
			else {
				model.addAttribute("errorMsg", "요청 처리 실패");
				return "errorPage";
			}
		}
		else {
			return "redirect:/";
		}
	}
		
	@ResponseBody
	@RequestMapping(value="closeSession.me", produces="text/html; charset=UTF-8")
	public String closeSession(String userId, HttpSession session) { //현재 진행 중
		
		// System.out.println("close:"+userId);
		int updateRecentLogout = 0;
		
		if(userId!=null) {
			// RECENT_LOGOUT 정보 업데이트
			updateRecentLogout = memberService.updateRecentLogout(userId);
			
			//session.removeAttribute("loginUser");
		    session.invalidate();
		}
		return (updateRecentLogout>0)?"YYY":"NNN";
	}
	
// 주석처리 : 수빈(7/18)
//	@ResponseBody
//	@RequestMapping(value="refreshSession.me", produces="text/html; charset=UTF-8")
//	public String refreshSession(String userId, HttpSession session) { 
//		
//		System.out.println("refresh:"+userId);
//		int updateRecentLogout = 0;
//		
//		if(userId!=null) {
//			updateRecentLogout = memberService.updateRefreshSession(userId);
//			
//		}
//		return (updateRecentLogout>0)?"YYY":"NNN";
//	}
//	
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
	
	// 마이페이지 - 프로필 수정 메소드
	@RequestMapping("updateProfile.me")
	public String updateProfile(Member m, MultipartFile profileImg, HttpSession session, Model model) {
		
		if(!profileImg.getOriginalFilename().equals("")) { // 프로필 이미지를 업데이트 한 경우
			
			// 기존 프로필 이미지를 서버로부터 삭제
			String originImg = session.getServletContext().getRealPath(m.getPic());
			new File(originImg).delete();
			
			// 새로운 프로필 이미지 업로드
			String changeName = saveFile(profileImg, session);
			m.setPic("resources/picUploadFiles/" + changeName);
		}
		
		int result = memberService.updateProfile(m);
		
		if(result > 0) { // 프로필 수정 성공
			
			Member updateMem = memberService.loginMember(m);
			
			session.setAttribute("loginUser", updateMem);
			session.setAttribute("alertMsg", "프로필이 성공적으로 수정되었습니다.");
			
			// 마이페이지 url 재요청 (myPage.me)
			return "redirect:myPage.me";
			
		} else { // 프로필 수정 실패
			
			model.addAttribute("errorMsg", "프로필 수정 실패");
			return "common/errorPage";
		}
	}
	// 현우쓰 코드 
	@ResponseBody
	@RequestMapping("loginSignal.me")
	public Map<String, Object> loginSignal(String userNo, Model model, HttpSession session) {
		
		int userNo1 = Integer.parseInt(userNo);
		int result = memberService.loginSignal(userNo1);
		int roomNo = 0;
		if(result > 0) {
			
			Member m = memberService.getChatClaim(userNo1);
			if(m.getUserNo() != 0) {
				int userNo2 = m.getUserNo();
		    	
		    	roomNo = chatService.getRoomNo(userNo1, userNo2);
				
				Map<String, Object> map = new HashMap<String, Object>();
				map.put("chatClaimFrom", m);
				map.put("roomNoWith", roomNo);
				
					Block b = new Block();
					b.setUserNo(userNo1);
					b.setBlockedUser(userNo2);
					int checkBlocked = memberService.checkBlocked(b);
					
					if(checkBlocked == 0) {
						return map;
					}
					else {
						chatService.cancelRequest(userNo1);
						return null;
					}
				
				
			}
		}
		
		 return null;
		
	}
	
	@ResponseBody
	@RequestMapping("signalFromChat.me")
	public int signalFromChat(String userNo) {
		int userNo1 = Integer.parseInt(userNo);   
		int result = memberService.loginSignal(userNo1);
		return result;
	}
	
	// 마이페이지 - 회원 정보 수정 메소드
	@RequestMapping("updateInfo.me")
	public String updateInfo(Member m, String address, HttpSession session, Model model) {
		
		int result = memberService.updateInfo(m);
		
		if(result > 0) { // 회원 정보 수정 성공
			
			Member updateMem = memberService.loginMember(m);
			
			session.setAttribute("loginUser", updateMem);
			session.setAttribute("alertMsg", "회원 정보가 성공적으로 수정되었습니다.");
			session.setAttribute("address", address);
			
			return "redirect:myPage.me";
			
		} else { // 회원 정보 수정 실패
			
			model.addAttribute("errorMsg", "회원 정보 수정 실패");
			return "common/errorPage";
		}
	}
	
	// 마이페이지 - 비밀번호 수정 > 기존 비밀번호 체크 메소드
	@ResponseBody
	@RequestMapping(value="originPwdCheck.me", produces="text/html; charset=UTF-8")
	public String originPwdCheck(String checkOriginPwd) {
		
		// System.out.println(checkOriginPwd);
		
		int count = memberService.originPwdCheck(checkOriginPwd);
		
		return (count > 0) ? "NNNNY" : "NNNNN";
	}
	
	// 마이페이지 - 비밀번호 수정 > 변경 비밀번호 업데이트 메소드
	@RequestMapping("infoUpdatePwd.me")
	public String infoUpdatePwd(Member m, HttpSession session, Model model) {
		
		// System.out.println("비밀번호 업데이트" + m);
		
		int result = memberService.infoUpdatePwd(m);
		
		if(result > 0) {
			
			Member updateMem = memberService.loginMember(m);
			
			session.setAttribute("loginUser", updateMem);
			session.setAttribute("alertMsg", "비밀번호가 성공적으로 수정되었습니다.");
			
			return "redirect:myPage.me";
		
		} else {
			
			model.addAttribute("errorMsg", "비밀번호 수정 실패");
			return "common/errorPage";
		}
	}
	
	// 팔로우 취소하는 메소드 (유진)
	@RequestMapping(value="unfollow.me")
	public String unfollowMember(HttpSession session,
								int foedUser,
								Model model) {
		
		if((Member)session.getAttribute("loginUser")!=null) {
		
			int userNo = ((Member)session.getAttribute("loginUser")).getUserNo();
			Follow f = new Follow();
			f.setFoUser(userNo);
			f.setFoedUser(foedUser);
			int result = memberService.unfollowMember(f);
			
			if(result > 0) {
				return "redirect:myFollow.me";
			}
			else {
				model.addAttribute("errorMsg", "요청 처리 실패");
				return "errorPage";
			}
		} else {
			return "redirect:/";
		}
	}
	
	// 커플관리 페이지로 이동
	@RequestMapping("myCouple.me")
	public String myCouple(HttpSession session, Model model) {
		
		int userNo = ((Member)session.getAttribute("loginUser")).getUserNo();
		String partner = ((Member)session.getAttribute("loginUser")).getPartner();

		Member m = new Member();
		m.setUserNo(userNo);
		m.setPartner(partner);
		
		// System.out.println(m);
		
		// 커플 요청 리스트
		ArrayList<Member> list = memberService.selectRequestList(m);
		// System.out.println("커플관리 페이지" + list);
		
		model.addAttribute("cList", list);
		
		return "member/myPage-ManageCouple";
	}
	
	// 커플관리 > 커플 신청
	@RequestMapping("requestCouple.me")
	public String requestCouple(Member m, String coupleId, HttpSession session, Model model) {
		
		// 커플 요청을 받는 회원의 회원 번호 조회
		String coupleNo = memberService.selectCoupleNo(coupleId);
		
		if(coupleNo != null) { // 커플 요청한 회원의 아이디가 유효할 경우

			m.setPartner(coupleNo);
			
			if(coupleId.equals("admin")) {
				
				session.setAttribute("alertMsg", "관리자에게 커플 요청을 할 수 없습니다.");
				
				return "redirect:myCouple.me";
				
			} else if(coupleId.equals(m.getUserId())) {
				
				session.setAttribute("alertMsg", "회원 본인에게 커플 요청을 할 수 없습니다.");
				
				return "redirect:myCouple.me";
				
			} else {
				
				int result = memberService.updateCoupleId(m);
				
				if(result > 0) {
					
					Member updateMem = memberService.loginMember(m);
					session.setAttribute("loginUser", updateMem);
					
					session.setAttribute("alertMsg", "커플 요청에 성공했습니다.");
					
					return "redirect:myCouple.me";
					
				} else {
					
					model.addAttribute("errorMsg", "커플 요청 실패");
					return "common/errorPage";
				}
			}
			
		} else { // 커플 요청한 회원의 아이디가 유효하지 않을 경우
			
			session.setAttribute("alertMsg", "존재하지 않는 회원입니다.");
			return "redirect:myCouple.me";
		}
	}
	
	// 커플관리 > 커플 수락
	@RequestMapping("acceptCouple.me")
	public String acceptCouple(Member m, HttpSession session, Model model) {
		
		// System.out.println("커플 수우락" + m);
		
		int result = memberService.updateCoupleId(m);
		
		if(result > 0) {
			
			Member updateMem = memberService.loginMember(m);
			
			session.setAttribute("loginUser", updateMem);
			
			session.setAttribute("alertMsg", "커플 수락💖");
			
			return "redirect:myCouple.me";
			
		} else {
			model.addAttribute("errorMsg", "커플 수락 실패");
			return "common/errorPage";
		}
	}
	
	// 커플관리 > 커플 거절
	@RequestMapping("refuseCouple.me")
	public String refuseCouple(Member m, HttpSession session, Model model) {
		
		// System.out.println("커플 거절" + m);
		
		int result = memberService.refuseCouple(m);
		
		if(result > 0) { // 커플 거절 성공
			
			session.setAttribute("alertMsg", "커플 신청이 거절되었습니다.");
			return "redirect:myCouple.me";
			
		} else { // 커플 거절 실패
			
			model.addAttribute("errorMsg", "커플 신청 거절 실패");
			return "common/errorPage";
		}
	}
	
	// 마이페이지 - 커플 삭제
	@RequestMapping("deleteCouple")
	public String deleteCouple(Member m, HttpSession session, Model model) {
		
		int result = memberService.deleteCouple(m);
		
		if(result > 0) { // 커플 삭제 성공
			Member updateMem = memberService.loginMember(m);
			session.setAttribute("loginUser", updateMem);
			
			session.setAttribute("alertMsg", "성공적으로 삭제되었습니다.");
			return "redirect:myPage.me";
			
		} else { // 커플 삭제 실패
			model.addAttribute("errorMsg", "커플 삭제 실패");
			return "common/errorPage";
		}
	}
	
	// 마이페이지 - 회원 탈퇴
	@RequestMapping("deleteMember")
	public String deleteMember(Member m, HttpSession session, Model model) {
		
		int result = memberService.deleteMember(m);
		
		if(result > 0) {
			
			session.setAttribute("alertMsg", "지금까지 캐치마인드를 이용해주셔서 감사합니다.");
			session.removeAttribute("loginUser");
			
			return "main";
			
		} else {
			model.addAttribute("errorMsg", "회원 탈퇴 실패");
			
			return "common/errorPage";
		}
	}
		
	//팔로우하는 메소드(유진)
	@RequestMapping("follow.me")
	public String followMember(int userNo, 
							   Model model, 
							   HttpSession session) {
		
		if((Member)session.getAttribute("loginUser")!=null) {
			int foUser = ((Member)session.getAttribute("loginUser")).getUserNo();
			Follow f = new Follow();
			f.setFoUser(foUser);
			f.setFoedUser(userNo);
			
			int result = memberService.followMember(f);
			if(result > 0) {
				session.setAttribute("alertMsg", "해당 회원을 팔로우합니다.");
				return "chat/matchListView";
			} else {
				
				session.setAttribute("alertMsg", "이미 팔로우한 회원입니다.");
				return "chat/matchListView";
			}
		}
		else {
			model.addAttribute("errorMsg", "팔로우 실패");
			return "common/errorPage";
		}
	}
	
	//차단하는 메소드(유진)
	@RequestMapping("block.me")
	public String blockMember(int userNo,
							  Model model,
							  HttpSession session) {
		
		if((Member)session.getAttribute("loginUser")!=null) {
			int user = ((Member)session.getAttribute("loginUser")).getUserNo();
			Block b = new Block();
			b.setUserNo(user);
			b.setBlockedUser(userNo);
			int result = memberService.blockMember(b);
			// System.out.println(result);
			if(result > 0) {
				model.addAttribute("alertMsg", "차단 성공");
				return "chat/matchListView";
			} else {
				
				model.addAttribute("errorMsg", "차단 실패");
				return "common/errorPage";
			}
		}
		else {
			return "redirect:/";
		}
	}
	
	@ResponseBody
	@RequestMapping(value="imageReview.me", produces="application/json; charset=UTF-8")
	public int imageReview(String reviewType, int reviewNo) {
		int result = memberService.imageReview(reviewType, reviewNo);
		return result;
	}
	
}
