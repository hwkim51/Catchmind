package com.e1i4.catchmind.board.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.e1i4.catchmind.board.model.service.BoardService;

@Controller
public class BoardController {
	
	public static final String SERVICEKEY = "EAk/cJd62BzsuJHpbCtIksn5S31hprT9toGxp8xmushfAKYmT9OTzNwrznDBK3YOaflpBbZiPPiGB7pyfIYhew==";
	
	@Autowired
	private BoardService boardService;
	
	@RequestMapping("list.po")
	public String listViewPost() {
		return "board/postListView";
	}
	
	@RequestMapping("detail.po")
	public String detailPost() {
		return "board/postDetailView";
	}
	
	@RequestMapping("list.to")
	public String listViewTogether() {
		return "board/togetherListView";
	}
	
	@ResponseBody
	@RequestMapping(value="data.to", produces="text/xml; charset=UTF-8")
	public String airPollution(String location) throws IOException {
		String url = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailCommon";
			url += "?ServiceKey=" + SERVICEKEY;
			url += "&MobileOS=WIN";
			url += "&MobileApp=CatchMind";
			url += "&contentId=8006";
			url += "&numOfRows=6";
			url += "&defaultYN=Y";
			url += "&firstImageYN=Y";
			url += "&areacodeYN=Y";
			url += "&catcodeYN=Y";
			url += "&addrinfoYN=Y";
			url += "&mapinfoYN=Y";
			url += "&overviewYN=Y";
			
			// URL값을 저장하는 구문
			URL requestUrl = new URL(url);
			
			// URL과 연결하는 구문
			HttpURLConnection urlConnection = (HttpURLConnection) requestUrl.openConnection();
			
			// 연결할 때 접속방식 선택
			urlConnection.setRequestMethod("GET");
			
			// 연결되었으니 값들 읽어오기
			BufferedReader br = new BufferedReader(new InputStreamReader(urlConnection.getInputStream()));
			
			String responseText = ""; // 응답데이터 기록용 변수
			String line; // null => 한줄 한줄 씩 읽어서 대입해주는 용도
			
			while((line = br.readLine()) != null) {
				responseText += line;
			}
			
			br.close();
			urlConnection.disconnect();
			
			System.out.println(responseText);
			
			return responseText;
	}
	
	@RequestMapping("list.lo")
	public String listViewLove() {
		return "board/loveListView";
	}
}
