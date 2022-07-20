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
import com.e1i4.catchmind.chat.model.vo.SearchMatch;
import com.e1i4.catchmind.member.model.vo.Block;
import com.e1i4.catchmind.member.model.vo.Follow;
import com.e1i4.catchmind.member.model.vo.Member;
import com.google.gson.Gson;

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
	public String insertBlock(int userNo, int block) {
		Block b = new Block();
		
		b.setUserNo(userNo); // 차단한 유저
		b.setBlockedUser(block); // 차단당한 유저
		
		int result = mdao.insertBlock(sqlSession, b);
		
		return (result>0)? "success" : "fail";
	}
	
	@ResponseBody
	@RequestMapping(value="follow.ma", produces="text/html; charset=UTF-8;")
	public String insertFollowed(int userNo, int follow) {
		Follow f = new Follow();
		
		f.setFoUser(userNo);
		f.setFoedUser(follow);
		
		int result = mdao.insertFollow(sqlSession, f);
		
		return (result>0)? "success" : "fail";
	}
	
	@RequestMapping(value="searchList.ma", produces="text/html; charset=UTF-8;")
	public String searchList(String mbti, String hlow, String hhigh, String alow, String ahigh, HttpSession session, Model model) {
		SearchMatch m = new SearchMatch();
		m.setGender(((Member) session.getAttribute("loginUser")).getGender());
		m.setUserNo(((Member) session.getAttribute("loginUser")).getUserNo());
		
		System.out.println(mbti);
		System.out.println(hlow);
		System.out.println(hhigh);
		System.out.println(alow);
		System.out.println(ahigh);
		
		
		if (mbti.equals("")) {
			if (!(hlow.equals(""))) {
				m.setHlow(Integer.parseInt(hlow));
			} else {
				m.setHlow(0);
			}
			if (!(hhigh.equals(""))) {
				m.setHhigh(Integer.parseInt(hhigh));
			} else {
				m.setHhigh(500);
			}
			if (!(alow.equals(""))) {
				m.setAlow(Integer.parseInt(alow));
			} else {
				m.setAlow(0);
			}
			if (!(ahigh.equals(""))) {
				m.setAhigh(Integer.parseInt(ahigh));
			} else {
				m.setAhigh(500);
			}
			ArrayList<Member> result = mdao.searchList1(sqlSession, m);

			model.addAttribute("mlist", result);
			
			return "chat/matchListView2";
		} else {
			m.setMbti(mbti);
			if (!(hlow.equals(""))) {
				m.setHlow(Integer.parseInt(hlow));
			} else {
				m.setHlow(0);
			}
			if (!(hhigh.equals(""))) {
				m.setHhigh(Integer.parseInt(hhigh));
			} else {
				m.setHhigh(500);
			}
			if (!(alow.equals(""))) {
				m.setAlow(Integer.parseInt(alow));
			} else {
				m.setAlow(0);
			}
			if (!(ahigh.equals(""))) {
				m.setAhigh(Integer.parseInt(ahigh));
			} else {
				m.setAhigh(500);
			}
			ArrayList<Member> result = mdao.searchList2(sqlSession, m);

			model.addAttribute("mlist", result);
			
			return "chat/matchListView2";
		}
		
		
	}
}
