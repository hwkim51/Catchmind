package com.e1i4.catchmind.chat.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.e1i4.catchmind.chat.model.dao.MatchDao;
import com.e1i4.catchmind.member.model.vo.Block;
import com.e1i4.catchmind.member.model.vo.Follow;
import com.e1i4.catchmind.member.model.vo.Member;

@Controller
public class MatchController {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private MatchDao mdao;
	
	
	@RequestMapping("matchList.ch")
	public String matchList(HttpSession session, Model model) {
		
		if((Member) session.getAttribute("loginUser")!= null) {
		Member m = (Member) session.getAttribute("loginUser");
		ArrayList<Member> result = mdao.matchList(sqlSession, m);
		
		model.addAttribute("mlist", result);
		
		return "chat/matchListView";
		} else {
			session.setAttribute("alertMsg", "로그인 후 이용가능합니다.");
			return "main";
		}
	}
	
	@ResponseBody
	@RequestMapping(value="block.ma", produces="text/html; charset=UTF-8;")
	public void insertBlock(int userNo, int block) {
		Block b = new Block();
		
		b.setUserNo(userNo); // 차단한 유저
		b.setBlockedUser(block); // 차단당한 유저
		
		int result = mdao.insertBlock(sqlSession, b);
	}
	
	@ResponseBody
	@RequestMapping(value="follow.ma", produces="text/html; charset=UTF-8;")
	public void insertFollowed(int userNo, int follow) {
		Follow f = new Follow();
		
		f.setFoUser(userNo);
		f.setFoedUser(follow);
		
		int result = mdao.insertFollow(sqlSession, f);
	}
}
