package com.e1i4.catchmind.member.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.e1i4.catchmind.member.model.dao.MemberDao;
import com.e1i4.catchmind.member.model.vo.Block;
import com.e1i4.catchmind.member.model.vo.Follow;
import com.e1i4.catchmind.member.model.vo.Member;

@Service
public class MemberServiceImpl implements MemberService  {

	@Autowired
	private MemberDao memberDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	// 로그인서비스(select)
	@Override
	public Member loginMember(Member m) {
		Member loginUser = memberDao.loginMember(sqlSession, m);
		return loginUser;
	}

	// 아이디 중복체크 서비스(select)
	@Override
	public int idCheck(String checkId) {
		return memberDao.idCheck(sqlSession, checkId);
	}

	// 닉네임 중복체크 서비스(select)
	@Override
	public int nicknameCheck(String nickname) {
		return memberDao.nicknameCheck(sqlSession, nickname);
	}
	
	// 회원가입서비스(insert)
	@Override
	public int insertMember(Member m) {
		return memberDao.insertMember(sqlSession, m);
	}

	// 회원 탈퇴 서비스 (update)
	@Override
	public int deleteMember(String userId) {
		return 0;
	}

	// 회원정보수정서비스 (update)
	@Override
	public int updateMember(Member m) {
		return 0;
	}

	// 아이디찾기서비스(select)
	@Override
	public Member findId(Member m) {
		return memberDao.findId(sqlSession, m);
	}

	// 비밀번호 찾기 서비스(select)
	@Override
	public Member findPwd(Member m) {
		return memberDao.findPwd(sqlSession, m);
	}

	// 비밀번호 찾기 - 변경 서비스(update)
	@Override
	public int changePwd(Member m) {
		return memberDao.changePwd(sqlSession, m);
	}

	// 로그인 시 recentLogin 업데이트(update)
	@Override
	public int updateRecentLogin(Member m) {
		return memberDao.updateRecentLogin(sqlSession, m);
	}

	@Override
	public ArrayList<Member> matchList(Member m) {
		return memberDao.matchList(sqlSession, m);
	}
	
	@Override
	public int updateRecentLogout(String userId) {
		return memberDao.updateRecentLogout(sqlSession, userId);
	}
	
	@Override
	public int updateRefreshSession(String userId) {
		return memberDao.updateRefreshSession(sqlSession, userId);
	}
	
	@Override
	public ArrayList<Member> selectFollowList(int userNo) {
		return memberDao.selectFollowList(sqlSession, userNo);
	}
	
	@Override
	public ArrayList<Member> selectBlockList(int userNo) {
		return memberDao.selectBlockList(sqlSession, userNo);
	}

	@Override
	public int deleteBlockMember(Block b) {
		return memberDao.deleteBlockMember(sqlSession, b);
	}

	// 마이페이지 - 프로필 수정 서비스(update)
	@Override
	public int updateProfile(Member m) {
		return memberDao.updateProfile(sqlSession, m);
	}
	
	// 마이페이지 - 회원 정보 수정 서비스(update)
	@Override
	public int updateInfo(Member m) {
		return memberDao.updateInfo(sqlSession, m);
	}
	
	@Override
	public int unfollowMember(Follow f) {
		return memberDao.unfollowMember(sqlSession, f);
	}

	// 마이페이지 - 프로필 수정 > 기존 비밀번호 체크 서비스(select)
	@Override
	public int originPwdCheck(String checkOriginPwd) {
		return memberDao.originPwdCheck(sqlSession, checkOriginPwd);
	}

	// 마이페이지 - 프로필 수정 > 변경된 비밀번호 업데이트 서비스(update)
	@Override
	public int infoUpdatePwd(Member m) {
		return memberDao.infoUpdatePwd(sqlSession, m);
	}

	// 커플 관리 > 커플 요청 리스트 조회 서비스(select)
	@Override
	public ArrayList<Member> selectRequestList(Member m) {
		return memberDao.selectRequestList(sqlSession, m);
	}
	
	// 커플 관리 > 커플 요청을 받는 회원의 회원 번호 조회 서비스(select)
	@Override
	public String selectCoupleNo(String coupleId) {
		return memberDao.selectCoupleNo(sqlSession, coupleId);
	}

	// 커플 관리 > 커플 아이디어 업데이트 서비스(update)
	@Override
	public int updateCoupleId(Member m) {
		return memberDao.updateCoupleId(sqlSession, m);
	}
	
	// 커플 관리 > 커플 거절 서비스(delete)
	@Override
	public int refuseCouple(Member m) {
		return memberDao.refuseCouple(sqlSession, m);
	}
	
	


	
	
}
