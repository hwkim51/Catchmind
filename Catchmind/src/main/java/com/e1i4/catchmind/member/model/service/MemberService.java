package com.e1i4.catchmind.member.model.service;

import java.util.ArrayList;

import com.e1i4.catchmind.member.model.vo.Block;
import com.e1i4.catchmind.member.model.vo.Follow;
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
	
	// 비밀번호 찾기 - 변경 서비스(update)
	int changePwd(Member m);

	// 로그인 시 recentLogin 업데이트(update)
	int updateRecentLogin(Member m);
	
	ArrayList<Member> matchList(Member m);
	
	// 로그아웃 시 recentLogout 업데이트
	int updateRecentLogout(String userId);
	
	// 마이 페이지 팔로우 리스트 조회 서비스(select)
	ArrayList<Member> selectFollowList(int userNo);
	
	// 마이 페이지 차단 리스트 조회 서비스(select)
	ArrayList<Member> selectBlockList(int userNo);
	
	int deleteBlockMember(Block b);
	
	// 마이페이지 - 프로필 수정 서비스(update)
	int updateProfile(Member m);
	
	
	// 마이페이지 - 회원 정보 수정 서비스(update)
	int updateInfo(Member m);

	int unfollowMember(Follow f);
	
}
