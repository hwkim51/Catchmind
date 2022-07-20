package com.e1i4.catchmind.chat.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.e1i4.catchmind.chat.model.vo.Chat;
import com.e1i4.catchmind.chat.model.vo.ChatReport;

public interface ChatService {
	int getRoomNo(int userNo1, int userNo2);
	
	int chatRequest(int userNo, int requestTo);
	
	int cancelRequest(int userNo);
	
	HashMap getUsers(int roomNo);
	
	int chatAgreed(int userNo, int userNo2);
	
	ArrayList<Chat> getChatLog(int roomNo);
	
	int checkRequest(int userNo);
	
	void insertChat(Chat chat);
	
	int chatReport(ChatReport cr);
	
	int signalFromChatRoom(int roomNo, int userNo);
	
	HashMap getRoomTimes(int roomNo);
	
	void clearRoom(int roomNo);
	
	int setRoomTime(int roomNo);
}
