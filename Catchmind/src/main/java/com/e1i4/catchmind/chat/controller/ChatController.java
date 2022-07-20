package com.e1i4.catchmind.chat.controller;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
import com.e1i4.catchmind.chat.model.vo.ChatReport;
import com.e1i4.catchmind.member.model.service.MemberService;
import com.e1i4.catchmind.member.model.vo.Block;
import com.e1i4.catchmind.member.model.vo.Follow;
import com.e1i4.catchmind.member.model.vo.Member;
 
@Controller
public class ChatController {
	
	@Autowired
	private ChatService chatService;
	
	@Autowired
	private MemberService memberService;
	
	// 채팅 메세지 전달
    @MessageMapping("/{roomNo}")
    @SendTo("/subscribe/{roomNo}")
    public Chat broadcasting(Chat chat) {
    	DateFormat dateFormat = new SimpleDateFormat("yyyyMMddHHmmss");
        chat.setChatTime(dateFormat.format(new Date()));
        if(chat.getRoomNo() != 0) {
        	chatService.insertChat(chat);
        }
        chat.setChatTime(chat.getChatTime().substring(8, 10) + ":" + chat.getChatTime().substring(10, 12));
        return chat;
    }
    
    @RequestMapping("/chat.do")
    public String chatroom(int roomNo, Model model) {
    	model.addAttribute("roomNo", roomNo);
    	HashMap map = chatService.getUsers(roomNo);
    	model.addAttribute("users", map);
    	ArrayList<Chat> list = chatService.getChatLog(roomNo);
    	for(int i = 1; i < list.size(); i++) {
    		if(list.get(i).getChatTime().substring(8, 12).equals(list.get(i-1).getChatTime().substring(8, 12))) {
    			list.get(i-1).setChatTime("");
    		}
    	}
    	for(int i = 0; i < list.size(); i++) {
    		if(!list.get(i).getChatTime().equals("")) {
    			list.get(i).setChatTime(list.get(i).getChatTime().substring(8, 10) + ":" +list.get(i).getChatTime().substring(10, 12));
    		}
    	}
    	model.addAttribute("chatlist", list);
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

    @ResponseBody
    @RequestMapping("sendRequest.ch")
    public int chatRequest(int userNo, int requestTo, Model model, HttpServletRequest request) {
    	int result = chatService.chatRequest(userNo, requestTo);
    	if(result == -1) {
    		model.addAttribute("alertMsg", "상대가 이미 다른 상대와 채팅 중입니다.");
    		return -1;
    	}
    	else if(result == -2) {
    		model.addAttribute("alertMsg", "상대가 다른 상대의 채팅 신청을 고민하고 있습니다.");
    		return -2;
    	}
    	else {
    		try {
				Thread.sleep(5000);
				int requestResult = chatService.checkRequest(userNo);
				
				if(requestResult == 0) {
					// model.addAttribute("alertMsg", "상대가 채팅 신청을 거부했습니다.");
					return 0;
				}
				else if(requestResult == requestTo) {
					return chatService.getRoomNo(userNo, requestTo);
				}
				else {
					// model.addAttribute("alertMsg", "상대가 채팅할 수 있는 상태가 아닙니다.");
					return -3;
				}
				
			} catch (InterruptedException e) {
				e.printStackTrace();
			}
    		
    		return -4;
    	}
    }
    
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
    
    @RequestMapping("report.ch")
    public String chatReport(ChatReport cr, Model model) {
    	int result = chatService.chatReport(cr);
    	chatService.cancelRequest(cr.getReportedFrom());
    	if(result > 0) {
    		model.addAttribute("alertMsg", "성공적으로 신고되었습니다.");
    	}
    	else {
    		model.addAttribute("alertMsg", "신고에 실패했습니다.");
    	}
    	return "common/main";
    }
    
    @RequestMapping("block.ch")
	public String blockMember(int userNo,
							  Model model,
							  HttpSession session) {
		
		if((Member)session.getAttribute("loginUser")!=null) {
			int user = ((Member)session.getAttribute("loginUser")).getUserNo();
			Block b = new Block();
			b.setUserNo(user);
			b.setBlockedUser(userNo);
			int result = memberService.blockMember(b);
			if(result > 0) {
				Follow f = new Follow();
				f.setFoUser(user);
				f.setFoedUser(userNo);
				memberService.unfollowMember(f);
				model.addAttribute("alertMsg", "차단 성공");
				return "main";
			} else {
				
				model.addAttribute("errorMsg", "차단 실패");
				return "common/errorPage";
			}
		}
		else {
			return "redirect:/";
		}
	}
    
    @ResponseBody
    @RequestMapping("signalFromChatRoom.ch")
    public int signalFromChatRoom(String roomNo, String userNo) {
    	int roomNoTemp = Integer.parseInt(roomNo);
    	int userNoTemp = Integer.parseInt(userNo);
    	int result = chatService.signalFromChatRoom(roomNoTemp, userNoTemp);
    	HashMap map = chatService.getRoomTimes(roomNoTemp);
    	Long recentTime;
    	if(result == 1) {
    		recentTime = ((Date)map.get("ROOMTIME2")).getTime();
    	}
    	else {
    		recentTime = ((Date)map.get("ROOMTIME1")).getTime();
    	}
    	// Long recentLogout = getRecentLogout().getTime();
		// System.out.println("recentTime : " + recentTime);
		
		Long sysdateTime = new Date().getTime();
		// System.out.println("sysdateTime : " + sysdateTime);
		
		long timediff = sysdateTime - recentTime;
		// System.out.println("timediff :" + timediff);
		
		if(timediff > 10000){
			chatService.clearRoom(roomNoTemp);
			return 0;
		} else {
			return 1;
		}
    }
    
    @ResponseBody
    @RequestMapping("setRoomTime.ch")
    public int setRoomTime(String roomNo) {
    	int roomNoTemp = Integer.parseInt(roomNo);
    	int result = chatService.setRoomTime(roomNoTemp);
    	return result;
    	
    }

}