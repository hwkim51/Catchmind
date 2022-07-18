package com.e1i4.catchmind.chat.model.service;

import java.util.HashMap;

public interface ChatService {
	int getRoomNo(int userNo1, int userNo2);
	
	int chatRequest(int userNo, int requestTo);
	
	int cancelRequest(int userNo);
	
	HashMap getUsers(int roomNo);
	
	int chatAgreed(int userNo, int userNo2);
}
