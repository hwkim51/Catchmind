package com.e1i4.catchmind.admin.model.service;

import java.util.ArrayList;

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

public interface AdminService {

	int selectMemberCount();
	
	ArrayList<Member> selectMemberList(PageInfo pi);
	
	int blackMember(String userId);
	
	int deleteMember(String userId);
	
	int deleteMemberAccount(String userId);
	
	int recoverMember(String userId);
	
	Member updateMember(Member m);
	
	ArrayList<Post> selectPostList(PageInfo pi);
	
	ArrayList<CatchBoard> selectCatchBoardList(PageInfo pi);

	ArrayList<Inquiry> selectInquiryList(PageInfo pi);
	
	int selectBoardCount();
	
	int selectCatchBoardCount();
	
	int selectInquiryCount();
	
	Inquiry selectInquiry(int qaNo);
	
	int updateInquiryAnswer(Inquiry in);
	
	int selectListCount();
	
	ArrayList<Notice> selectList(PageInfo pi);
	
	Notice selectNotice(int noticeNo);
	
	ArrayList<Notice> selectNoticeList(PageInfo pi);
	
	int insertNotice(Notice n);
	
	Notice updateFormNotice(int noticeNo);
	
	int updateNotice(Notice n);
	
	int deleteNotice(int noticeNo);
	
	int recoverNotice(int noticeNo);
	
	ArrayList<Faq> selectFaqList(PageInfo pi);
	
	int selectFaqCount();
	
	int insertFaq(Faq f);
	
	int deleteFaq(int faqNo);
	
	int selectPostCount();
	
	ArrayList<Post> selectPostList(PageInfo pi);

	int selectCatchCount();

	ArrayList<Catch> selectCatchList(PageInfo pi);

	int recoverPost(int postNo);
	
	int deletePost(int postNo);

	int recoverCatch(int catchNo);

	int deleteCatch(int catchNo);
	
	int selectReportCount();
	
	ArrayList<Report> selectReportList(PageInfo pi);
	
	Post detailPostReport(int postNo);
	
	Attach selectFile(int attPost);
	
	ArrayList<Reply> selectReplyList(int postNo);
	
	Catch detailCatchReport(int catchNo);
	
	int deleteReply(int replyNo);
	
	int selectChatReportCount();
	
	ArrayList<ChatReport> selectChatReportList(PageInfo pi);
	
	int deleteChatReportMember(int userNo);
}
