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
	int deleteMember(Member m);
	
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
	
	int updateRefreshSession(String userId);
	
	// 마이 페이지 팔로우 리스트 조회 서비스(select)
	ArrayList<Member> selectFollowList(int userNo);
	
	// 마이 페이지 차단 리스트 조회 서비스(select)
	ArrayList<Member> selectBlockList(int userNo);
	
	int deleteBlockMember(Block b);
	
	// 마이페이지 - 프로필 수정 서비스(update)
	int updateProfile(Member m);
	
	// 로그인상태 확인용 메소드
	int loginSignal(int userNo);
	
	// 채팅요청여부 확인용 메소드
	Member getChatClaim(int userNo);
	// 마이페이지 - 프로필 수정 > 기존 비밀번호 체크 서비스(select)
	int originPwdCheck(String checkOriginPwd);
	
	// 마이페이지 - 프로필 수정 > 변경된 비밀번호 업데이트 서비스(update)
	int infoUpdatePwd(Member m);
	
	// 마이페이지 - 회원 정보 수정 서비스(update)
	int updateInfo(Member m);

	int unfollowMember(Follow f);
	
	// 커플 관리 > 커플 요청 리스트 조회 서비스(select)
	ArrayList<Member> selectRequestList(Member m);
	
	// 커플 관리 > 커플 요청을 받는 회원의 회원 번호 조회 서비스(select)
	String selectCoupleNo(String coupleId);
	
	// 커플 관리 > 커플 아이디어 업데이트 서비스(update)
	int updateCoupleId(Member m);
	
	// 커플 관리 > 커플 거절 서비스(delete)
	int refuseCouple(Member m);

	int followMember(Follow f);
	
	int blockMember(Block b);
	
	
	// 커플 회원 정보 조회 서비스(select)
	Member selectCoupleInfo(String partner);
	
	// 마이페이지 - 커플 삭제 서비스(update)
	int deleteCouple(Member m);
	
	int checkBlocked(Block b);

	int emailCheck(String email);

	int phoneCheck(String phone);
	
	int imageReview(String reviewType, int userNo);
	
	String myImage(Member m);
}
