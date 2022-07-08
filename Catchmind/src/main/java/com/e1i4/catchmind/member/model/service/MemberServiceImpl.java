package com.e1i4.catchmind.member.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.e1i4.catchmind.member.model.dao.MemberDao;
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

}
