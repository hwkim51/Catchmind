package com.e1i4.catchmind.chat.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.e1i4.catchmind.member.model.vo.Block;
import com.e1i4.catchmind.member.model.vo.Follow;
import com.e1i4.catchmind.member.model.vo.Member;

@Repository
public class MatchDao {

	public ArrayList<Member> matchList(SqlSessionTemplate sqlSession, Member m) {
		
		return (ArrayList) sqlSession.selectList("matchMapper.matchList", m);
	}

	public int insertBlock(SqlSessionTemplate sqlSession, Block b) {
		return sqlSession.insert("matchMapper.insertBlock", b);
	}

	public int insertFollow(SqlSessionTemplate sqlSession, Follow f) {
		return sqlSession.insert("matchMapper.insertFollow", f);
	}

}
