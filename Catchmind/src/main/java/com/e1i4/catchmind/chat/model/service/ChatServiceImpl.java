package com.e1i4.catchmind.chat.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.e1i4.catchmind.chat.model.dao.ChatDao;

@Service
public class ChatServiceImpl implements ChatService {

	@Autowired
	private ChatDao chatDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int getRoomNo(int userNo1, int userNo2) {
		return chatDao.getRoomNo(sqlSession, userNo1, userNo2);
	}
	
	@Override
	public int createRoomNo(int userNo1, int userNo2) {
		return chatDao.createRoomNo(sqlSession, userNo1, userNo2);
	}

}
