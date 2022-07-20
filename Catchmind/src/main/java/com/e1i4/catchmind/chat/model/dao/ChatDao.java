package com.e1i4.catchmind.chat.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.e1i4.catchmind.chat.model.vo.Chat;
import com.e1i4.catchmind.chat.model.vo.ChatReport;
import com.e1i4.catchmind.member.model.vo.Member;

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
			if(requestTo == (Integer)sqlSession.selectOne("chatMapper.checkRequest", existence)) {
				return -1;
			}
			else {
				return -2;
			}
		}

	}
	
	public int cancelRequest(SqlSessionTemplate sqlSession, int userNo) {
		return sqlSession.update("chatMapper.cancelRequest", userNo);
	}
	
	public HashMap getUsers(SqlSessionTemplate sqlSession, int roomNo) {
		HashMap map = sqlSession.selectOne("chatMapper.getUsers", roomNo);
		int result = Integer.parseInt(String.valueOf(map.get("USER_NO1")));
		Member m1 = sqlSession.selectOne("memberMapper.selectMember", result);
		result = Integer.parseInt(String.valueOf(map.get("USER_NO2")));
		Member m2 = sqlSession.selectOne("memberMapper.selectMember", result);
		
		map.put("m1", m1);
		map.put("m2", m2);
		return map;
	}
	
	public int chatAgreed(SqlSessionTemplate sqlSession, int userNo, int userNo2) {
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("userNo1", userNo);
		map.put("userNo2", userNo2);
		return sqlSession.update("chatMapper.chatAgreed", map);
	}
	
	
	public ArrayList<Chat> getChatLog(SqlSessionTemplate sqlSession, int roomNo) {
		return (ArrayList)sqlSession.selectList("chatMapper.getChatLog", roomNo);
	}
	
	public int checkRequest(SqlSessionTemplate sqlSession, int userNo) {
		return sqlSession.selectOne("chatMapper.checkRequest", userNo);
	}
	
	public void insertChat(SqlSessionTemplate sqlSession, Chat chat) {
		sqlSession.insert("chatMapper.insertChat", chat);
	} 
	
	public int chatReport(SqlSessionTemplate sqlSession, ChatReport cr) {
		return sqlSession.insert("chatMapper.chatReport", cr);
	}
	
}
