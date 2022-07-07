package com.e1i4.catchmind.admin.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.e1i4.catchmind.admin.model.dao.AdminDao;
import com.e1i4.catchmind.board.model.vo.Board;
import com.e1i4.catchmind.catchboard.model.vo.CatchBoard;
import com.e1i4.catchmind.common.model.vo.PageInfo;
import com.e1i4.catchmind.inquiry.model.vo.Inquiry;
import com.e1i4.catchmind.member.model.vo.Member;

@Service
public class AdminServiceImpl implements AdminService {

	@Autowired
	private AdminDao adminDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int selectMemberCount() {
		return adminDao.selectMemberCount(sqlSession);
	}

	@Override
	public ArrayList<Member> selectMemberList(PageInfo pi) {
		return adminDao.selectMemberList(sqlSession, pi);
	}

	@Override
	public int blackMember(String userId) {
		return adminDao.blackMember(sqlSession, userId);
	}

	@Override
	public int deleteMember(String userId) {
		return adminDao.deleteMember(sqlSession, userId);
	}

	@Override
	public int recoverMember(String userId) {
		return adminDao.recoverMember(sqlSession, userId);
	}

	@Override
	public Member updateMember(Member m) {
		return adminDao.updateMember(sqlSession, m);
	}

	@Override
	public ArrayList<Board> selectBoardList(PageInfo pi) {
		return adminDao.selectBoardList(sqlSession, pi);
	}

	@Override
	public ArrayList<CatchBoard> selectCatchBoardList(PageInfo pi) {
		return adminDao.selectCatchBoardList(sqlSession, pi);
	}

	@Override
	public int selectBoardCount() {
		return adminDao.selectBoardCount(sqlSession);
	}

	@Override
	public int selectCatchBoardCount() {
		return adminDao.selectCatchBoardCount(sqlSession);
	}

	@Override
	public ArrayList<Inquiry> selectInquiryList(PageInfo pi) {
		return adminDao.selectInquiryList(sqlSession, pi);
	}

	@Override
	public int selectInquiryCount() {
		return adminDao.selectInquiryCount(sqlSession);
	}
	
	

}
