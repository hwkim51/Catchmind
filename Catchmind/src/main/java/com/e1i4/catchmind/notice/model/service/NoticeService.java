package com.e1i4.catchmind.notice.model.service;

import java.util.ArrayList;

import com.e1i4.catchmind.common.model.vo.PageInfo;
import com.e1i4.catchmind.notice.model.vo.Notice;

public interface NoticeService {

	// 공지사항 게시글 개수 조회
	int selectListCount();
	// 공지사항 리스트 전체 조회
	ArrayList<Notice> selectList(PageInfo pi);
	
	// 조회수 증가
	int increaseCount(int noticeNo);
	// 공지사항 게시글 상세 조회
	Notice selectNotice(int noticeNo);
}
