package com.e1i4.catchmind.notice.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.e1i4.catchmind.common.model.vo.PageInfo;
import com.e1i4.catchmind.notice.model.dao.NoticeDao;
import com.e1i4.catchmind.notice.model.vo.Notice;

@Service
public class NoticeServiceImpl implements NoticeService {

	@Autowired
	private NoticeDao noticeDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	// 공지사항 전체 개수 조회  - 유진
	@Override
	public int selectListCount() {
		return noticeDao.selectListCount(sqlSession);
	}

	// 공지사항 전체 조회 메소드 - 유진
	@Override
	public ArrayList<Notice> selectList(PageInfo pi) {
		return noticeDao.selectList(sqlSession, pi);
	}

	// 공지사항 조회 시 조회수 +1 메소드 - 유진
	@Override
	public int increaseCount(int noticeNo) {
		return noticeDao.increaseCount(sqlSession, noticeNo);
	}

	// 공지사항 상세 조회 메소드 - 유진
	@Override
	public Notice selectNotice(int noticeNo) {
		return noticeDao.selectNotice(sqlSession, noticeNo);
	}

}
