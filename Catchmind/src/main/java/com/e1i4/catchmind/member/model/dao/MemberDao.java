package com.e1i4.catchmind.member.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

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
		return sqlSession.insert("memberMapper.insertMember", m);
	}

	// 비밀번호 찾기 - 변경 서비스(update)
	public int changePwd(SqlSessionTemplate sqlSession, Member m) {
		
		System.out.println("DAO: " + sqlSession.update("memberMapper.changePwd", m));
		
		return sqlSession.update("memberMapper.changePwd", m);
	}

	// 로그인 시 recentLogin 변경(update)
	public int updateRecentLogin(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.update("memberMapper.updateRecentLogin", m);
	}

	public ArrayList<Member> matchList(SqlSessionTemplate sqlSession, Member m) {
		return (ArrayList)sqlSession.selectList("memberMapper.matchList", m);
	}

}
