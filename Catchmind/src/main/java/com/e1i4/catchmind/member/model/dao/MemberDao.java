package com.e1i4.catchmind.member.model.dao;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.e1i4.catchmind.member.model.vo.Block;
import com.e1i4.catchmind.member.model.vo.Follow;
import com.e1i4.catchmind.member.model.vo.Member;

@Repository
public class MemberDao {

	// 로그인(select)
	public Member loginMember(SqlSessionTemplate sqlSession, Member m) {

		return sqlSession.selectOne("memberMapper.loginMember", m);
		
	}
	
	// 아이디 중복 체크(select)
	public int idCheck(SqlSessionTemplate sqlSession, String checkId) {
		return sqlSession.selectOne("memberMapper.idCheck", checkId);
	}

	// 아이디찾기(select)
	public Member findId(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.selectOne("memberMapper.findId", m);
	}

	// 비밀번호찾기 - 일치 회원 찾기 (select)
	public Member findPwd(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.selectOne("memberMapper.findPwd", m);
	}

	// 닉네임 중복체크 서비스(select)
	public int nicknameCheck(SqlSessionTemplate sqlSession, String nickname) {
		return sqlSession.selectOne("memberMapper.nicknameCheck", nickname);
	}

	// 회원가입 서비스(insert)
	public int insertMember(SqlSessionTemplate sqlSession, Member m) {
		
		int result = sqlSession.insert("memberMapper.insertMember", m);
		String userId = m.getUserId();
		int userNo = (Integer)sqlSession.selectOne("memberMapper.selectMemberById", userId);
		sqlSession.insert("chatMapper.insertChatClaim", userNo);
		sqlSession.insert("memberMapper.createReview", userNo);
		return result;
	}

	// 비밀번호 찾기 - 변경 서비스(update)
	public int changePwd(SqlSessionTemplate sqlSession, Member m) {
		
		// System.out.println("DAO: " + sqlSession.update("memberMapper.changePwd", m));
		
		return sqlSession.update("memberMapper.changePwd", m);
	}

	// 로그인 시 recentLogin 변경(update)
	public int updateRecentLogin(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.update("memberMapper.updateRecentLogin", m);
	}

	public ArrayList<Member> matchList(SqlSessionTemplate sqlSession, Member m) {
		return (ArrayList)sqlSession.selectList("memberMapper.matchList", m);
	}

	// 로그아웃 시 recentLogout 변경(update)
	public int updateRecentLogout(SqlSessionTemplate sqlSession, String userId) {
		return sqlSession.update("memberMapper.updateRecentLogout", userId);
	}
	
	public int updateRefreshSession(SqlSessionTemplate sqlSession, String userId) {
		return sqlSession.update("memberMapper.updateRefreshSession", userId);
	}
	// 마이 페이지 팔로우 리스트 조회 서비스(select)
	public ArrayList<Member> selectFollowList(SqlSessionTemplate sqlSession, int userNo){
		return (ArrayList)sqlSession.selectList("memberMapper.selectFollowList", userNo);
	}
	
	// 마이 페이지 차단 리스트 조회 서비스(select)
	public ArrayList<Member> selectBlockList(SqlSessionTemplate sqlSession, int userNo){
		return (ArrayList)sqlSession.selectList("memberMapper.selectBlockList", userNo);
	}
	
	public int deleteBlockMember(SqlSessionTemplate sqlSession, Block b) {
		return sqlSession.delete("memberMapper.deleteBlockMember", b);
	}
	
	// 마이페이지 - 프로필 수정 서비스(update)
	public int updateProfile(SqlSessionTemplate sqlSession, Member m) {
		
		return sqlSession.update("memberMapper.updateProfile", m);
	}
	
	public int loginSignal(SqlSessionTemplate sqlSession, int userNo) {
		return sqlSession.update("memberMapper.loginSignal", userNo);
	}
	
	public Member getChatClaim(SqlSessionTemplate sqlSession, int userNo) {
		int result = sqlSession.selectOne("chatMapper.getChatClaim", userNo);
		if(result != 0) {
			return sqlSession.selectOne("memberMapper.selectMember", result);
		}
		else {
			return new Member();
		}
	}
	
	// 마이페이지 - 회원 정보 수정 서비스(update)
	public int updateInfo(SqlSessionTemplate sqlSession, Member m) {
		
		return sqlSession.update("memberMapper.updateInfo", m);
	}
	
	public int unfollowMember(SqlSessionTemplate sqlSession, Follow f) {
		return sqlSession.delete("memberMapper.unfollowMember", f);
	}
	
	// 마이페이지 - 프로필 수정 > 기존 비밀번호 체크 서비스(select)
	public int originPwdCheck(SqlSessionTemplate sqlSession, String checkOriginPwd) {
		return sqlSession.selectOne("memberMapper.originPwdCheck", checkOriginPwd);
	}
	
	// 마이페이지 - 프로필 수정 > 변경된 비밀번호 업데이트 서비스(update)
	public int infoUpdatePwd(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.update("memberMapper.infoUpdatePwd", m);
	}
	
	// 커플 관리 > 커플 요청 리스트 조회 서비스(select)
	public ArrayList<Member> selectRequestList(SqlSessionTemplate sqlSession, Member m) {
		return (ArrayList)sqlSession.selectList("memberMapper.selectRequestList", m);
	}
	
	// 커플 관리 > 커플 요청을 받는 회원의 회원 번호 조회 서비스(select)
	public String selectCoupleNo(SqlSessionTemplate sqlSession, String coupleId) {
		return sqlSession.selectOne("memberMapper.selectCoupleNo", coupleId);
	}
	
	// 커플 관리 > 커플 아이디어 업데이트 서비스(update)
	public int updateCoupleId(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.update("memberMapper.updateCoupleId", m);
	}
	
	// 커플 관리 > 커플 거절 서비스(delete)
	public int refuseCouple(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.update("memberMapper.refuseCouple", m);
	}
	
	// 팔로우 서비스(insert)
	public int followMember(SqlSessionTemplate sqlSession, Follow f) {
		return sqlSession.insert("memberMapper.followMember", f);
	}
	
	// 차단 서비스(insert)
	public int blockMember(SqlSessionTemplate sqlSession, Block b) {
		return sqlSession.insert("memberMapper.blockMember", b);
	} 
	
	// 커플 회원 정보 조회 서비스(select)
	public Member selectCoupleInfo(SqlSessionTemplate sqlSession, String partner) {
		return sqlSession.selectOne("memberMapper.selectCoupleInfo", partner);
	}
	
	// 마이페이지 - 커플 삭제 서비스(update)
	public int deleteCouple(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.update("memberMapper.deleteCouple", m);
	}
	
	// 마이페이지 - 회원 탈퇴 서비스(update)
	public int deleteMember(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.update("memberMapper.deleteMember", m);
	}
	
	public int checkBlocked(SqlSessionTemplate sqlSession, Block b) {
		return sqlSession.selectOne("memberMapper.checkBlocked", b);
	}

	public int emailCheck(SqlSessionTemplate sqlSession, String email) {
		return sqlSession.selectOne("memberMapper.emailCheck", email);
	}

	public int phoneCheck(SqlSessionTemplate sqlSession, String phone) {
		return sqlSession.selectOne("memberMapper.phoneCheck", phone);
	}
	
	public int imageReview(SqlSessionTemplate sqlSession, String reviewType, int userNo) {
		switch(reviewType) {
		case "CHARMING" : return sqlSession.update("memberMapper.addCharming", userNo);
		case "KIND" : return sqlSession.update("memberMapper.addKind", userNo);
		case "WARMHEARTED" : return sqlSession.update("memberMapper.addWarmhearted", userNo);
		case "RAPID" : return sqlSession.update("memberMapper.addRapid", userNo);
		case "HAPPY" : return sqlSession.update("memberMapper.addHappy", userNo);
		case "LOVE" : return sqlSession.update("memberMapper.addLove", userNo);
		default : return 0;
		}
	}
	
	public String myImage(SqlSessionTemplate sqlSession, Member m) {
		Map map = sqlSession.selectOne("memberMapper.myImage", m);
		int[] arr = new int[6];
		arr[0] = Integer.parseInt(String.valueOf(map.get("CHARMING")));
		arr[1] = Integer.parseInt(String.valueOf(map.get("KIND")));
		arr[2] = Integer.parseInt(String.valueOf(map.get("WARMHEARTED")));
		arr[3] = Integer.parseInt(String.valueOf(map.get("RAPID")));
		arr[4] = Integer.parseInt(String.valueOf(map.get("HAPPY")));
		arr[5] = Integer.parseInt(String.valueOf(map.get("LOVE")));
		String image = "";
		if((arr[0] == Arrays.stream(arr).max().getAsInt()) && (arr[0] != 0)) {
			image = "CHARMING";
		}
		else if((arr[1] == Arrays.stream(arr).max().getAsInt()) && (arr[1] != 0)) {
			image = "KIND";
		}
		else if((arr[2] == Arrays.stream(arr).max().getAsInt()) && (arr[2] != 0)) {
			image = "WARMHEARTED";
		}
		else if((arr[3] == Arrays.stream(arr).max().getAsInt()) && (arr[3] != 0)) {
			image = "RAPID";
		}
		else if((arr[4] == Arrays.stream(arr).max().getAsInt()) && (arr[4] != 0)) {
			image = "HAPPY";
		}
		else if((arr[5] == Arrays.stream(arr).max().getAsInt()) && (arr[5] != 0)) {
			image = "LOVE";
		}
		
		return image;
	}
}
