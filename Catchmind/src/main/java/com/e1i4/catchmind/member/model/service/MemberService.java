package com.e1i4.catchmind.member.model.service;

import com.e1i4.catchmind.member.model.vo.Member;

public interface MemberService {
	
	// 로그인서비스(select)
	Member loginMember(Member m);
	
	// 아이디 중복체크 서비스(select)
	int idCheck(String checkId);

	// 닉네임 중복체크 서비스(select)
	int nicknameCheck(String nickname);
	
	// 회원가입서비스(insert)
	int insertMember(Member m);
	
	// 회원 탈퇴 서비스 (update)
	int deleteMember(String userId);
	
	// 회원정보수정서비스 (update)
	int updateMember(Member m);

	// 아이디 찾기 서비스(select)
	Member findId(Member m);

	// 비밀번호 찾기 서비스(select)
	Member findPwd(Member m);
	
//	// 비밀번호 찾기 - 변경 서비스(update)
//	int changePwd(Member m);
	
}
