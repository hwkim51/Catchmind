package com.e1i4.catchmind.board.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.e1i4.catchmind.board.model.dao.BoardDao;
import com.e1i4.catchmind.board.model.vo.Post;
import com.e1i4.catchmind.board.model.vo.Reply;
import com.e1i4.catchmind.board.model.vo.Report;
import com.e1i4.catchmind.common.model.vo.Attach;
import com.e1i4.catchmind.common.model.vo.PageInfo;

@Service
public class BoardServiceImpl implements BoardService {

	@Autowired
	private BoardDao boardDao;
	@Autowired
	private SqlSessionTemplate sqlSession;
	
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
		return 0;
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


	

}
