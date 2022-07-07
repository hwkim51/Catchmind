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
		
		return sqlSession.selectOne("chatMapper.getRoomNo", map);
	}
	
	public int createRoomNo(SqlSessionTemplate sqlSession, int userNo1, int userNo2) {
		
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("userNo1", userNo1);
		map.put("userNo2", userNo2);
		
		return sqlSession.selectOne("chatMapper.createRoomNo", map);
		
	}
	
}
