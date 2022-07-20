package com.e1i4.catchmind.chat.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.e1i4.catchmind.chat.model.vo.SearchMatch;
import com.e1i4.catchmind.member.model.vo.Block;
import com.e1i4.catchmind.member.model.vo.Follow;
import com.e1i4.catchmind.member.model.vo.Member;

@Repository
public class MatchDao {
	
	public ArrayList<Member> matchList(SqlSessionTemplate sqlSession, Member m) {
		
		return (ArrayList) sqlSession.selectList("matchMapper.selectMatchList", m);
	}

	public ArrayList<Member> matchList3(SqlSessionTemplate sqlSession, Member m) {
		
		return (ArrayList) sqlSession.selectList("matchMapper.selectMatchList3", m);
	}
	public ArrayList<Member> matchList2(SqlSessionTemplate sqlSession, Member m) {
		
		return (ArrayList) sqlSession.selectList("matchMapper.selectMatchList2", m);
	}
	public ArrayList<Member> matchList1(SqlSessionTemplate sqlSession, Member m) {
		
		return (ArrayList) sqlSession.selectList("matchMapper.selectMatchList1", m);
	}

	public int insertBlock(SqlSessionTemplate sqlSession, Block b) {
		return sqlSession.insert("matchMapper.insertBlock", b);
	}

	public int insertFollow(SqlSessionTemplate sqlSession, Follow f) {
		return sqlSession.insert("matchMapper.insertFollow", f);
	}

	public ArrayList<Member> searchList1(SqlSessionTemplate sqlSession, SearchMatch m) {
		return (ArrayList) sqlSession.selectList("matchMapper.searchList1",m);
	}

	public ArrayList<Member> searchList2(SqlSessionTemplate sqlSession, SearchMatch m) {
		return (ArrayList) sqlSession.selectList("matchMapper.searchList2",m);
	}

}
