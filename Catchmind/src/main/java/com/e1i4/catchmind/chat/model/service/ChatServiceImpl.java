package com.e1i4.catchmind.chat.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.e1i4.catchmind.chat.model.dao.ChatDao;
import com.e1i4.catchmind.chat.model.vo.Chat;
import com.e1i4.catchmind.chat.model.vo.ChatReport;

@Service
public class ChatServiceImpl implements ChatService {

	@Autowired
	private ChatDao chatDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int getRoomNo(int userNo1, int userNo2) {
		
		if(userNo1 > userNo2) {
    		int temp = userNo2;
    		userNo2 = userNo1;
    		userNo1 = temp;
    	}
		
		return chatDao.getRoomNo(sqlSession, userNo1, userNo2);
	}

	@Override
	public int chatRequest(int userNo, int requestTo) {
		return chatDao.chatRequest(sqlSession, userNo, requestTo);
	}

	@Override
	public int cancelRequest(int userNo) {
		return chatDao.cancelRequest(sqlSession, userNo);		
	}

	@Override
	public HashMap getUsers(int roomNo) {
		return chatDao.getUsers(sqlSession, roomNo);
	}

	@Override
	public int chatAgreed(int userNo, int userNo2) {
		return chatDao.chatAgreed(sqlSession, userNo, userNo2);
	}

	@Override
	public ArrayList<Chat> getChatLog(int roomNo) {
		return chatDao.getChatLog(sqlSession, roomNo);
	}

	@Override
	public int checkRequest(int userNo) {
		return chatDao.checkRequest(sqlSession, userNo);
	}

	@Override
	public void insertChat(Chat chat) {
		chatDao.insertChat(sqlSession, chat);
	}

	@Override
	public int chatReport(ChatReport cr) {
		return chatDao.chatReport(sqlSession, cr);
	}
}
