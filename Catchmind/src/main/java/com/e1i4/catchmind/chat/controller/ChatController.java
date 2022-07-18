package com.e1i4.catchmind.chat.controller;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.e1i4.catchmind.chat.model.service.ChatService;
import com.e1i4.catchmind.chat.model.vo.Chat;
 
@Controller
public class ChatController {
	
	@Autowired
	private ChatService chatService;

	// 채팅 메세지 전달
    @MessageMapping("/{roomNo}")
    @SendTo("/subscribe/{roomNo}")
    public Chat broadcasting(Chat chat) {
    	DateFormat dateFormat = new SimpleDateFormat("yyyyMMddHHmmSS");
        chat.setChatTime(dateFormat.format(new Date()));
        return chat;
    }
    
    @RequestMapping("/chat.do")
    public String chatroom(int roomNo, Model model) {
    	model.addAttribute("roomNo", roomNo);
    	HashMap map = chatService.getUsers(roomNo);
    	model.addAttribute("users", map);
    	return "chat/chatTemp";
    }
    
    /*
    @RequestMapping(value="/chat.do", method=RequestMethod.POST)
    public String chatroom(Model model, HttpServletRequest request) {
    
    	if(!request.getParameter("userNo1").isEmpty() && !request.getParameter("userNo2").isEmpty()) {
	    	int userNo1 = Integer.parseInt(request.getParameter("userNo1"));
	    	int userNo2 = Integer.parseInt(request.getParameter("userNo2"));
	    	int roomNo = 0;
	    	
	    	if(userNo1 > userNo2) {
	    		int temp = userNo2;
	    		userNo2 = userNo1;
	    		userNo1 = temp;
	    	}
	    	
	    	roomNo = chatService.getRoomNo(userNo1, userNo2);
	    	
	    	
    		model.addAttribute("roomNo", roomNo);
    		return "chat/chat";
	    	
    	}
    		    	
    	model.addAttribute("alertMsg", "잘못된 접근입니다.");
    	return "redirect:" + request.getHeader("Referer");

    }
    
    */
    /*
    @RequestMapping("sendRequest.ch")
    public String chatRequest(int userNo, int requestTo) {
    	int result = chatService.chatRequest(userNo, requestTo);
    	if(result == -1) {
    	}
    	else {
    	}
    }
    */
    
    @ResponseBody
    @RequestMapping("cancelRequest.ch")
    public int cancelRequest(int userNo) {
    	int result = chatService.cancelRequest(userNo);
    	return result;
    }
    
    @ResponseBody
    @RequestMapping(value="chatAgreed.ch", method=RequestMethod.POST)
    public int chatAgreed(int userNo, int userNo2) {
    	return chatService.chatAgreed(userNo, userNo2);
    }

}