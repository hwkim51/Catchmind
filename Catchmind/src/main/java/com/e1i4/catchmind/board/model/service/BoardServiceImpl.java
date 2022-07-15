package com.e1i4.catchmind.board.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.e1i4.catchmind.board.model.dao.BoardDao;
import com.e1i4.catchmind.board.model.vo.Catch;
import com.e1i4.catchmind.board.model.vo.Like;
import com.e1i4.catchmind.board.model.vo.Post;
import com.e1i4.catchmind.board.model.vo.Reply;
import com.e1i4.catchmind.board.model.vo.Report;
import com.e1i4.catchmind.common.model.vo.Attach;
import com.e1i4.catchmind.common.model.vo.PageInfo;

import oracle.net.aso.r;

@Service
public class BoardServiceImpl implements BoardService {

	@Autowired
	private BoardDao boardDao;
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	/* ============================ Post ============================ */
	@Override
	public int selectListCount() {
		return boardDao.selectListCount(sqlSession);
	}

	@Override
	public ArrayList<Post> selectList(PageInfo pi) {
		return boardDao.selectList(pi, sqlSession);
	}

	@Override
	public int insertPost(Post p) {
		return boardDao.insertPost(p, sqlSession);
	}
	
	@Override
	public int insertFile(Attach a) {
		return boardDao.insertFile(a, sqlSession);
	}

	@Override
	public int increaseCount(int postNo) {
		return boardDao.increaseCount(postNo, sqlSession);
	}

	@Override
	public Post selectPost(int postNo) {
		return boardDao.selectPost(postNo, sqlSession);
	}
	
	@Override
	public Attach selectFile(int attPost) {
		return boardDao.selectFile(attPost, sqlSession);
	}
	
	@Override
	public int deletePost(int postNo) {
		return boardDao.deletePost(postNo, sqlSession);
	}
	
	@Override
	public int insertReply(Reply r) {
		return boardDao.insertReply(r, sqlSession);
	}
	
	@Override
	public ArrayList<Reply> selectReplyList(int postNo) {
		return boardDao.selectReplyList(postNo, sqlSession);
	}

	

	@Override
	public int updatePost(Post p) {
		return boardDao.updatePost(p, sqlSession);
	}
	
	@Override
	public int updateFile(Attach a) {
		return boardDao.updateFile(a, sqlSession);
	}
	@Override
	public int deleteFile(Attach a) {
		return boardDao.deleteFile(a, sqlSession);
	}

	@Override
	public ArrayList<Post> selectTopPostList() {
		return null;
	}

	@Override
	public int deleteReply(int replyNo) {
		return boardDao.deleteReply(replyNo, sqlSession);
	}

	@Override
	public int insertReport(Report r) {
		return boardDao.insertReport(r, sqlSession);
	}

	@Override
	public int addFile(Attach a) {
		return boardDao.addFile(a, sqlSession);
	}

	
	
	/* ============================ 내 글 관리 ============================ */
	@Override
	public ArrayList<Post> selectMyList(PageInfo pi, int userNo) {
		return boardDao.selectMyList(pi, userNo, sqlSession);
	}

	@Override
	public int selectMyListCount(int userNo) {
		return boardDao.selectMyListCount(userNo, sqlSession);
	}

	
	/* ============================ Catch ============================ */
	@Override
	public int selectCatchListCount() {
		return boardDao.selectCatchListCount(sqlSession);
	}

	@Override
	public ArrayList<Catch> selectCatchList(PageInfo pi) {
		return boardDao.selectCatchList(pi, sqlSession);
	}

	@Override
	public Catch selectCatch(int catchNo) {
		return boardDao.selectCatch(catchNo, sqlSession);
	}

	@Override
	public ArrayList<Attach> selectFiles(int catchNo) {
		return boardDao.selectFiles(catchNo, sqlSession);
	}

	@Override
	public int insertCatch(Catch c) {
		return boardDao.insertCatch(c, sqlSession);
	}

	@Override
	public int insertFiles(Attach a) {
		return boardDao.insertFiles(a, sqlSession);
	}

	@Override
	public int deleteCatch(int catchNo) {
		return boardDao.deleteCatch(catchNo, sqlSession);
	}

	@Override
	public int increaseCatchCount(int catchNo) {
		return boardDao.increaseCatchCount(catchNo, sqlSession);
	}

	@Override
	public int deleteFiles(Attach a) {
		return boardDao.deleteFiles(a, sqlSession);
	}

	@Override
	public int addFiles(Attach a) {
		return boardDao.addFiles(a, sqlSession);
	}

	@Override
	public int updateCatch(Catch c) {
		return boardDao.updateCatch(c, sqlSession);
	}

	@Override
	public int insertLike(Like l) {
		return boardDao.insertLike(l, sqlSession);
	}

	@Override
	public int selectLike(Like like) {
		return boardDao.selectLike(like, sqlSession);
	}

	@Override
	public int likeCount(int catchNo) {
		return boardDao.likeCount(catchNo, sqlSession);
	}

	@Override
	public Attach selectFileTop(int catchNo) {
		return boardDao.selectFileTop(catchNo, sqlSession);
	}

	@Override
	public int getCatchNo() {
		return boardDao.getCatchNo(sqlSession);
	}

	


	

}
