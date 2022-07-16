package com.e1i4.catchmind.board.model.service;

import java.util.ArrayList;

import com.e1i4.catchmind.board.model.vo.Catch;
import com.e1i4.catchmind.board.model.vo.Like;
import com.e1i4.catchmind.board.model.vo.Post;
import com.e1i4.catchmind.board.model.vo.Reply;
import com.e1i4.catchmind.board.model.vo.Report;
import com.e1i4.catchmind.common.model.vo.Attach;
import com.e1i4.catchmind.common.model.vo.PageInfo;
import com.e1i4.catchmind.inquiry.model.vo.Inquiry;

public interface BoardService {
	// 게시판 리스트 조회 + 페이징 처리
	// 게시글 총 갯수 조회
	int selectListCount();
	
	// 게시글 리스트 조회
	ArrayList<Post> selectList(PageInfo pi);
	
	// 게시글 작성하기 서비스
	int insertPost(Post p);
	
	// 게시글 사진 추가 서비스
	int insertFile(Attach a);
	
	// 게시글 조회수 증가
	int increaseCount(int postNo);
	
	// 게시글 상세 조회
	Post selectPost(int postNo);
	
	// 게시글 상세 조회 파일
	Attach selectFile(int attPost);
	
	// 게시글 삭제 서비스
	int deletePost(int postNo);
	
	int updatePost(Post p);
	
	// 댓글 리스트 조회 서비스(Ajax)
	ArrayList<Reply> selectReplyList(int postNo);
	
	// 댓글 작성 서비스
	int insertReply(Reply r);
	

	ArrayList<Post> selectTopPostList();

	int deleteReply(int replyNo);

	int insertReport(Report r);

	int updateFile(Attach a);

	int deleteFile(Attach a);

	int addFile(Attach a);

	ArrayList<Post> selectMyList(PageInfo pi, int userNo);

	int selectMyListCount(int userNo);

	int selectCatchListCount();

	ArrayList<Catch> selectCatchList(PageInfo pi);

	Catch selectCatch(int catchNo);

	ArrayList<Attach> selectFiles(int catchNo);

	int insertCatch(Catch c);

	int insertFiles(Attach a);

	int deleteCatch(int catchNo);

	int increaseCatchCount(int catchNo);

	int deleteFiles(Attach a);

	int addFiles(Attach a);

	int updateCatch(Catch c);

	int selectLike(Like like);

	int insertLike(Like l);

	int likeCount(int catchNo);

	Attach selectFileTop(int catchNo);

	int getCatchNo();

	ArrayList<Catch> selectMyCatchList(PageInfo pi, int userNo);

	int selectMyCatchCount(int userNo);

	int selectMyQACount(int userNo);

	ArrayList<Inquiry> selectMyQAList(PageInfo pi, int userNo);

	int updateQA(Inquiry i);

	int deleteQA(int qaNo);
	
}
