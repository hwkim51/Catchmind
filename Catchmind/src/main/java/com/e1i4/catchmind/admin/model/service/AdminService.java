package com.e1i4.catchmind.admin.model.service;

import java.util.ArrayList;

import com.e1i4.catchmind.board.model.vo.Board;
import com.e1i4.catchmind.catchboard.model.vo.CatchBoard;
import com.e1i4.catchmind.common.model.vo.PageInfo;
import com.e1i4.catchmind.inquiry.model.vo.Inquiry;
import com.e1i4.catchmind.member.model.vo.Member;

public interface AdminService {

	int selectMemberCount();
	
	ArrayList<Member> selectMemberList(PageInfo pi);
	
	int blackMember(String userId);
	
	int deleteMember(String userId);
	
	int recoverMember(String userId);
	
	Member updateMember(Member m);
	
	ArrayList<Board> selectBoardList(PageInfo pi);
	
	ArrayList<CatchBoard> selectCatchBoardList(PageInfo pi);

	ArrayList<Inquiry> selectInquiryList(PageInfo pi);
	
	int selectBoardCount();
	
	int selectCatchBoardCount();
	
	int selectInquiryCount();
	
	
}
