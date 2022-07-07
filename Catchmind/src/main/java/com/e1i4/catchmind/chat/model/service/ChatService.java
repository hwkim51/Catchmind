package com.e1i4.catchmind.chat.model.service;

public interface ChatService {
	int getRoomNo(int userNo1, int userNo2);
	
	int createRoomNo(int userNo1, int userNo2);
}
