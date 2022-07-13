package com.e1i4.catchmind.board.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.e1i4.catchmind.board.model.vo.Post;
import com.e1i4.catchmind.board.model.vo.Reply;
import com.e1i4.catchmind.common.model.vo.Attach;
import com.e1i4.catchmind.common.model.vo.PageInfo;

@Repository
public class BoardDao {

	public int selectListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("boardMapper.selectListCount");
	}

	public ArrayList<Post> selectList(PageInfo pi, SqlSessionTemplate sqlSession) {
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage()-1) * limit;
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("boardMapper.selectList", null, rowBounds);
	}

	public int insertPost(Post p, SqlSessionTemplate sqlSession) {
		return sqlSession.insert("boardMapper.insertPost", p);
	}
	
	public int insertFile(Attach a, SqlSessionTemplate sqlSession) {
		return sqlSession.insert("boardMapper.insertFile", a);
	}

	public int increaseCount(int postNo, SqlSessionTemplate sqlSession) {
		return sqlSession.update("boardMapper.increaseCount", postNo);
	}

	public Post selectPost(int postNo, SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("boardMapper.selectPost", postNo);
	}

	public Attach selectFile(int attPost, SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("boardMapper.selectFile", attPost);
	}

	public int insertReply(Reply r, SqlSessionTemplate sqlSession) {
		return sqlSession.insert("boardMapper.insertReply", r);
	}

	public ArrayList<Reply> selectReplyList(int postNo, SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("boardMapper.selectReplyList", postNo);
	}

	public int deletePost(int postNo, SqlSessionTemplate sqlSession) {
		return sqlSession.delete("boardMapper.deletePost", postNo);
	}

	public int deleteReply(int replyNo, SqlSessionTemplate sqlSession) {
		return sqlSession.delete("boardMapper.deleteReply", replyNo);
	}

}
