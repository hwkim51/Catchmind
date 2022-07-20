package com.e1i4.catchmind.admin.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.e1i4.catchmind.board.model.vo.Board;
import com.e1i4.catchmind.board.model.vo.Catch;
import com.e1i4.catchmind.board.model.vo.Post;
import com.e1i4.catchmind.board.model.vo.Reply;
import com.e1i4.catchmind.board.model.vo.Report;
import com.e1i4.catchmind.catchboard.model.vo.CatchBoard;
import com.e1i4.catchmind.chat.model.vo.ChatReport;
import com.e1i4.catchmind.common.model.vo.Attach;
import com.e1i4.catchmind.common.model.vo.PageInfo;
import com.e1i4.catchmind.faq.model.vo.Faq;
import com.e1i4.catchmind.inquiry.model.vo.Inquiry;
import com.e1i4.catchmind.member.model.vo.Member;
import com.e1i4.catchmind.notice.model.vo.Notice;

@Repository
public class AdminDao {

	public int selectMemberCount(SqlSessionTemplate sqlSession) {
		
		return sqlSession.selectOne("memberMapper.selectMemberCount");
		
	};
	
	public ArrayList<Member> selectMemberList(SqlSessionTemplate sqlSession, PageInfo pi) {
		
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage() - 1) * limit;
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("memberMapper.selectMemberList", null, rowBounds);
		
	}
	
	public int blackMember(SqlSessionTemplate sqlSession, String userId) {
		
		return sqlSession.update("memberMapper.blackMember", userId);
		
	}
	
	public int deleteMember(SqlSessionTemplate sqlSession, String userId) {
		
		return sqlSession.update("memberMapper.deleteMember", userId);
		
	}
	
	public int recoverMember(SqlSessionTemplate sqlSession, String userId) {
		
		return sqlSession.update("memberMapper.recoverMember", userId);
		
	}
	
	public Member updateMember(SqlSessionTemplate sqlSession, Member m) {
		
		int result = sqlSession.update("memberMapper.updateMemberAdmin", m);
		
		if(result > 0) {
			return sqlSession.selectOne("memberMapper.selectMember", m);
		}
		else {
			return null;
		}
	}
	
	public ArrayList<Post> selectPostList(SqlSessionTemplate sqlSession, PageInfo pi) {
		
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage() - 1) * limit;
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("boardMapper.selectPostList", null, rowBounds);
		
	}
	
	public ArrayList<CatchBoard> selectCatchBoardList(SqlSessionTemplate sqlSession, PageInfo pi) {
		
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage() - 1) * limit;
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("boardMapper.selectadCatchList", null, rowBounds);
		
	}
	
	public int selectBoardCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("boardMapper.selectBoardCount");
	}
	
	public int selectCatchBoardCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("boardMapper.selectCatchListCount");
	}
	
	public ArrayList<Inquiry> selectInquiryList(SqlSessionTemplate sqlSession, PageInfo pi) {
		
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage() - 1) * limit;
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("inquiryMapper.selectInquiryList", null, rowBounds);
		
	}
	
	public int selectInquiryCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("inquiryMapper.selectInquiryCount");
	}
	
	public Inquiry selectInquiry(SqlSessionTemplate sqlSession, int qaNo) {
		return sqlSession.selectOne("inquiryMapper.selectInquiry", qaNo);
	}
	
	public int updateInquiryAnswer(SqlSessionTemplate sqlSession, Inquiry in) {
		return sqlSession.update("inquiryMapper.updateInquiryAnswer", in);
	}
	
	public int selectListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("noticeMapper.selectListCount");
	}
	
	public ArrayList<Notice> selectList(SqlSessionTemplate sqlSession, PageInfo pi) {
		
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage() - 1) * limit;
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("noticeMapper.selectList", null, rowBounds);
	}
	
	public Notice selectNotice(SqlSessionTemplate sqlSession, int noticeNo) {
		return sqlSession.selectOne("noticeMapper.selectNotice", noticeNo);
	}
	
	public ArrayList<Notice> selectNoticeList(SqlSessionTemplate sqlSession, PageInfo pi){
		
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage() - 1) * limit;
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		return (ArrayList)sqlSession.selectList("noticeMapper.selectNoticeList", null, rowBounds);
	}

	public int insertNotice(SqlSessionTemplate sqlSession, Notice n) {
		return sqlSession.insert("noticeMapper.insertNotice", n);
	}
	
	public Notice updateFormNotice(SqlSessionTemplate sqlSession, int noticeNo) {
		return sqlSession.selectOne("noticeMapper.selectNotice", noticeNo);
	}
	
	public int updateNotice(SqlSessionTemplate sqlSession, Notice n) {
		return sqlSession.update("noticeMapper.updateNotice", n);
	}
	
	public int deleteNotice(SqlSessionTemplate sqlSession ,int noticeNo) {
		return sqlSession.update("noticeMapper.deleteNotice", noticeNo);
	}
	
	public int recoverNotice(SqlSessionTemplate sqlSession ,int noticeNo) {
		return sqlSession.update("noticeMapper.recoverNotice", noticeNo);
	}
	
	public ArrayList<Faq> selectFaqList(SqlSessionTemplate sqlSession, PageInfo pi){
		
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage() - 1) * limit;
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		return (ArrayList)sqlSession.selectList("faqMapper.selectFaqList", null, rowBounds);
	}
	
	public int selectFaqCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("faqMapper.selectFaqCount");
	}
	
	public int insertFaq(SqlSessionTemplate sqlSession, Faq f) {
		return sqlSession.insert("faqMapper.insertFaq", f);
	}
	
	public int deleteFaq(SqlSessionTemplate sqlSession, int faqNo) {
		return sqlSession.delete("faqMapper.deleteFaq", faqNo);
	}
	
	public int selectPostCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("boardMapper.selectPostCount");
	}
	
	public ArrayList<Post> selectPostList(SqlSessionTemplate sqlSession, PageInfo pi){
		
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage() - 1) * limit;
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("boardMapper.selectPostList", null, rowBounds);
	}

	public int selectCatchCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("boardMapper.selectadCatchCount");
	}

	public ArrayList<Catch> selectCatchList(SqlSessionTemplate sqlSession, PageInfo pi) {
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage() - 1) * limit;
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("boardMapper.selectadCatchList", null, rowBounds);
	}

	public int recoverPost(SqlSessionTemplate sqlSession, int postNo) {
		return sqlSession.update("boardMapper.recoverfncPost", postNo);
	}
	
	public int deletePost(SqlSessionTemplate sqlSession, int postNo) {
		return sqlSession.update("boardMapper.deletefncPost", postNo);
	}

	public int recoverCatch(SqlSessionTemplate sqlSession, int catchNo) {
		return sqlSession.update("boardMapper.recoverfncCatch", catchNo);
	}

	public int deleteCatch(SqlSessionTemplate sqlSession, int catchNo) {
		return sqlSession.update("boardMapper.deletefncCatch", catchNo);
	}
	
	public int selectReportCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("boardMapper.selectReportCount");
	}
	
	public ArrayList<Report> selectReportList(SqlSessionTemplate sqlSession, PageInfo pi){
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage() - 1) * limit;
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		return (ArrayList)sqlSession.selectList("boardMapper.selectReportList", null, rowBounds);
	}
	
	public Post detailPostReport(SqlSessionTemplate sqlSession, int postNo) {
		return sqlSession.selectOne("boardMapper.selectPost", postNo);
	}
	
	public Attach selectFile(SqlSessionTemplate sqlSession, int attPost) {
		return sqlSession.selectOne("boardMapper.selectFile", attPost);
	}
	
	public ArrayList<Reply> selectReplyList(SqlSessionTemplate sqlSession, int postNo) {
		return (ArrayList)sqlSession.selectList("boardMapper.selectReplyList", postNo);
	}
	
	public Catch detailCatchReport(SqlSessionTemplate sqlSession, int catchNo) {
		return sqlSession.selectOne("boardMapper.selectCatch", catchNo);
	}
	
	public int deleteReply(SqlSessionTemplate sqlSession, int replyNo) {
		return sqlSession.update("boardMapper.deleteReply", replyNo);
	}
	
	public int selectChatReportCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("chatMapper.selectChatReportCount");
	}

	public ArrayList<ChatReport> selectChatReportList(SqlSessionTemplate sqlSession, PageInfo pi){
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage() - 1) * limit;
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		return (ArrayList)sqlSession.selectList("chatMapper.selectChatReportList", null, rowBounds);
	}
	
	public int deleteChatReportMember(SqlSessionTemplate sqlSession, int userNo) {
		return sqlSession.update("memberMapper.deleteChatReportMember", userNo);
	}
}
