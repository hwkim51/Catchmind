package com.e1i4.catchmind.admin.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.e1i4.catchmind.admin.model.dao.AdminDao;
import com.e1i4.catchmind.board.model.vo.Catch;
import com.e1i4.catchmind.board.model.vo.Post;
import com.e1i4.catchmind.board.model.vo.Reply;
import com.e1i4.catchmind.board.model.vo.Report;
import com.e1i4.catchmind.catchboard.model.vo.CatchBoard;
import com.e1i4.catchmind.common.model.vo.Attach;
import com.e1i4.catchmind.common.model.vo.PageInfo;
import com.e1i4.catchmind.faq.model.vo.Faq;
import com.e1i4.catchmind.inquiry.model.vo.Inquiry;
import com.e1i4.catchmind.member.model.vo.Member;
import com.e1i4.catchmind.notice.model.vo.Notice;

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
	public ArrayList<Post> selectPostList(PageInfo pi) {
		return adminDao.selectPostList(sqlSession, pi);
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

	@Override
	public Inquiry selectInquiry(int qaNo) {
		return adminDao.selectInquiry(sqlSession, qaNo);
	}

	@Override
	public int updateInquiryAnswer(Inquiry in) {
		return adminDao.updateInquiryAnswer(sqlSession, in);
	}

	@Override
	public int selectListCount() {
		return adminDao.selectListCount(sqlSession);
	}

	@Override
	public ArrayList<Notice> selectList(PageInfo pi) {
		return adminDao.selectList(sqlSession, pi);
	}
	
	@Override
	public Notice selectNotice(int noticeNo) {
		return adminDao.selectNotice(sqlSession, noticeNo);
	}

	@Override
	public ArrayList<Notice> selectNoticeList(PageInfo pi) {
		return adminDao.selectNoticeList(sqlSession, pi);
	}
	
	@Override
	public int insertNotice(Notice n) {
		return adminDao.insertNotice(sqlSession, n);
	}

	@Override
	public Notice updateFormNotice(int noticeNo) {
		return adminDao.updateFormNotice(sqlSession, noticeNo);
	}

	@Override
	public int updateNotice(Notice n) {
		return adminDao.updateNotice(sqlSession, n);
	}

	@Override
	public int deleteNotice(int noticeNo) {
		return adminDao.deleteNotice(sqlSession, noticeNo);
	}

	@Override
	public int recoverNotice(int noticeNo) {
		return adminDao.recoverNotice(sqlSession, noticeNo);
	}

	@Override
	public ArrayList<Faq> selectFaqList(PageInfo pi) {
		return adminDao.selectFaqList(sqlSession, pi);
	}

	@Override
	public int selectFaqCount() {
		return adminDao.selectFaqCount(sqlSession);
	}

	@Override
	public int insertFaq(Faq f) {
		return adminDao.insertFaq(sqlSession, f);
	}

	@Override
	public int deleteFaq(int faqNo) {
		return adminDao.deleteFaq(sqlSession, faqNo);
	}

	@Override
	public int selectPostCount() {
		return adminDao.selectPostCount(sqlSession);
	}

	@Override
	public int selectCatchCount() {
		return adminDao.selectCatchCount(sqlSession);
	}

	@Override
	public ArrayList<Catch> selectCatchList(PageInfo pi) {
		return adminDao.selectCatchList(sqlSession, pi);
	}

	@Override
	public int recoverPost(int postNo) {
		return adminDao.recoverPost(sqlSession, postNo);
	}
	
	@Override
	public int deletePost(int postNo) {
		return adminDao.deletePost(sqlSession, postNo);
	}

	@Override
	public int recoverCatch(int catchNo) {
		return adminDao.recoverCatch(sqlSession, catchNo);
	}

	@Override
	public int deleteCatch(int catchNo) {
		return adminDao.deleteCatch(sqlSession, catchNo);
	}

	@Override
	public int selectReportCount() {
		return adminDao.selectReportCount(sqlSession);
	}

	@Override
	public ArrayList<Report> selectReportList(PageInfo pi) {
		return adminDao.selectReportList(sqlSession, pi);
	}

	@Override
	public Post detailPostReport(int postNo) {
		return adminDao.detailPostReport(sqlSession, postNo);
	}

	@Override
	public Attach selectFile(int attPost) {
		return adminDao.selectFile(sqlSession, attPost);
	}

	@Override
	public ArrayList<Reply> selectReplyList(int postNo) {
		return adminDao.selectReplyList(sqlSession, postNo);
	}

	@Override
	public Catch detailCatchReport(int catchNo) {
		return adminDao.detailCatchReport(sqlSession, catchNo);
	}

	@Override
	public int deleteMemberAccount(String userId) {
		return adminDao.deleteMemberAccount(sqlSession, userId);
	}
}
