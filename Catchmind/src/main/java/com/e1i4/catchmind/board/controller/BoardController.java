package com.e1i4.catchmind.board.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.e1i4.catchmind.board.model.service.BoardService;

@Controller
public class BoardController {
	@Autowired
	private BoardService boardService;
	
	@RequestMapping("list.po")
	public String selectList() {
		return "board/postListView";
	}
	
	@RequestMapping("detail.po")
	public String detailview() {
		return "board/postDetailView";
	}
}
