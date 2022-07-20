package com.e1i4.catchmind.chat.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

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
	
	@RequestMapping("recList.ch")
	public String recList(HttpSession session, Model model) {
		
		if((Member) session.getAttribute("loginUser")!= null) {
			Member m = (Member) session.getAttribute("loginUser");
			ArrayList<Member> result = mdao.matchList3(sqlSession, m);
			List<Map.Entry<Member, Double>> sortedResult = sortByDistance(result, m);
			ArrayList<Member> mlist = new ArrayList<>();
			for(Map.Entry<Member, Double> map : sortedResult) {
				mlist.add(map.getKey());
			}

			result = mdao.matchList2(sqlSession, m);
			sortedResult = sortByDistance(result, m);
			for(Map.Entry<Member, Double> map : sortedResult) {
				mlist.add(map.getKey());
			}

			result = mdao.matchList1(sqlSession, m);
			sortedResult = sortByDistance(result, m);
			for(Map.Entry<Member, Double> map : sortedResult) {
				mlist.add(map.getKey());
			}		
			model.addAttribute("mlist", mlist);
			
			return "chat/recommandList";
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
		if((Member) session.getAttribute("loginUser")!= null) {
		SearchMatch m = new SearchMatch();
		m.setGender(((Member) session.getAttribute("loginUser")).getGender());
		m.setUserNo(((Member) session.getAttribute("loginUser")).getUserNo());
		
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
			
			return "chat/matchSearch";
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
			
			return "chat/matchSearch";
		}
		} else {
			session.setAttribute("alertMsg", "로그인 후 이용가능합니다.");
			return "main";
		}
		
	}
	
	public List<Map.Entry<Member, Double>> sortByDistance(ArrayList<Member> result, Member m) {
		
		Map<Member, Double> map = new HashMap<>();
		
		for(Member tempMember : result) {
			map.put(tempMember, getDistance(tempMember, m));
		}
		
		List<Map.Entry<Member, Double>> entryList = new LinkedList<>(map.entrySet());
		entryList.sort(Map.Entry.comparingByValue());
		return entryList;
	};
	
	public double getDistance(Member distanceTo, Member m) {
		
		final double RADIUS = 6372.8;
		
		double mlat = m.getLatitude();
		double mlon = m.getLongitude();
		double distanceToLat = distanceTo.getLatitude();
		double distanceToLon = distanceTo.getLongitude();
		
		double latDiff = Math.toRadians(distanceToLat - mlat);
        double lonDiff = Math.toRadians(distanceToLon - mlon);
        
        mlat = Math.toRadians(mlat);
        distanceToLat = Math.toRadians(distanceToLat);        
		
        double result = 2 * Math.asin(Math.sqrt(Math.pow(Math.sin(latDiff / 2),2) + Math.pow(Math.sin(lonDiff / 2),2) * Math.cos(mlat) * Math.cos(distanceToLat)));
        
		return RADIUS * result;
	}
}
