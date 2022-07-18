package com.e1i4.catchmind.chat.model.dao;

import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class ChatDao {

	public int getRoomNo(SqlSessionTemplate sqlSession, int userNo1, int userNo2) {
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("userNo1", userNo1);
		map.put("userNo2", userNo2);
		if(sqlSession.selectOne("chatMapper.getRoomNo", map) != null) {
			return sqlSession.selectOne("chatMapper.getRoomNo", map);
		}
		else {
			return createRoomNo(sqlSession, userNo1, userNo2);
		}
		
	}
	
	public int createRoomNo(SqlSessionTemplate sqlSession, int userNo1, int userNo2) {
		
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("userNo1", userNo1);
		map.put("userNo2", userNo2);
		
		return sqlSession.selectOne("chatMapper.createRoomNo", map);
		
	}
	
	public int chatRequest(SqlSessionTemplate sqlSession, int userNo, int requestTo) {
		int existence = sqlSession.selectOne("chatMapper.requestExistence", requestTo);
		if(existence == 0) {
			HashMap<String, Integer> map = new HashMap<String, Integer>();
			map.put("userNo1", userNo);
			map.put("userNo2", requestTo);
			return sqlSession.update("chatMapper.chatRequest", map);
		}
		else {
			return -1;
		}

	}
	
	public int cancelRequest(SqlSessionTemplate sqlSession, int userNo) {
		return sqlSession.update("chatMapper.cancelRequest", userNo);
	}
	
	public HashMap getUsers(SqlSessionTemplate sqlSession, int roomNo) {
		return sqlSession.selectOne("chatMapper.getUsers", roomNo);
	}
	
	public int chatAgreed(SqlSessionTemplate sqlSession, int userNo, int userNo2) {
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("userNo1", userNo);
		map.put("userNo2", userNo2);
		return sqlSession.update("chatMapper.chatAgreed", map);
	}
	
}
