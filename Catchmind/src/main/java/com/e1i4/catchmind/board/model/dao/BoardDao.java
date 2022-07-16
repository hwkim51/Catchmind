package com.e1i4.catchmind.board.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.e1i4.catchmind.board.model.vo.Catch;
import com.e1i4.catchmind.board.model.vo.Like;
import com.e1i4.catchmind.board.model.vo.Post;
import com.e1i4.catchmind.board.model.vo.Reply;
import com.e1i4.catchmind.board.model.vo.Report;
import com.e1i4.catchmind.common.model.vo.Attach;
import com.e1i4.catchmind.common.model.vo.PageInfo;
import com.e1i4.catchmind.inquiry.model.vo.Inquiry;

@Repository
public class BoardDao {

	
	/* ============================ Post ============================ */
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
	
	public int deletePost(int postNo, SqlSessionTemplate sqlSession) {
		return sqlSession.update("boardMapper.deletePost", postNo);
	}
	
	public int updatePost(Post p, SqlSessionTemplate sqlSession) {
		return sqlSession.update("boardMapper.updatePost", p);
	}
	
	public int updateFile(Attach a, SqlSessionTemplate sqlSession) {
		return sqlSession.update("boardMapper.updateFile", a);
	}

	public int deleteFile(Attach a, SqlSessionTemplate sqlSession) {
		return sqlSession.delete("boardMapper.deleteFile", a);
	}

	public int addFile(Attach a, SqlSessionTemplate sqlSession) {
		return sqlSession.insert("boardMapper.addFile", a);
	}

	public ArrayList<Post> selectMyList(PageInfo pi, int userNo, SqlSessionTemplate sqlSession) {
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage()-1) * limit;
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("boardMapper.selectMyList", userNo, rowBounds);
	}
	public int selectMyListCount(int userNo, SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("boardMapper.selectMyListCount", userNo);
	}
	/* ============================ Report ============================ */
	public int insertReport(Report r, SqlSessionTemplate sqlSession) {
		return sqlSession.insert("boardMapper.insertReport", r);
	}
	
	/* ============================ Reply ============================ */
	public int insertReply(Reply r, SqlSessionTemplate sqlSession) {
		return sqlSession.insert("boardMapper.insertReply", r);
	}

	public ArrayList<Reply> selectReplyList(int postNo, SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("boardMapper.selectReplyList", postNo);
	}
	
	public int deleteReply(int replyNo, SqlSessionTemplate sqlSession) {
		return sqlSession.update("boardMapper.deleteReply", replyNo);
	}

	/* ============================ Catch ============================ */
	public int selectCatchListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("boardMapper.selectCatchListCount");
	}

	public ArrayList<Catch> selectCatchList(PageInfo pi, SqlSessionTemplate sqlSession) {
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage()-1) * limit;
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("boardMapper.selectCatchList", null, rowBounds);
	}

	public Catch selectCatch(int catchNo, SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("boardMapper.selectCatch", catchNo);
	}

	public ArrayList<Attach> selectFiles(int catchNo, SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("boardMapper.selectFiles", catchNo);
	}

	public int insertCatch(Catch c, SqlSessionTemplate sqlSession) {
		return sqlSession.insert("boardMapper.insertCatch", c);
	}

	public int insertFiles(Attach a, SqlSessionTemplate sqlSession) {
		return sqlSession.insert("boardMapper.insertFiles", a);
	}

	public int deleteCatch(int catchNo, SqlSessionTemplate sqlSession) {
		return sqlSession.update("boardMapper.deleteCatch", catchNo);
	}

	public int increaseCatchCount(int catchNo, SqlSessionTemplate sqlSession) {
		return sqlSession.update("boardMapper.increaseCatchCount", catchNo);
	}

	public int deleteFiles(Attach a, SqlSessionTemplate sqlSession) {
		return sqlSession.delete("boardMapper.deleteFiles", a);
	}

	public int addFiles(Attach a, SqlSessionTemplate sqlSession) {
		return sqlSession.insert("boardMapper.addFiles", a);
	}

	public int updateCatch(Catch c, SqlSessionTemplate sqlSession) {
		return sqlSession.update("boardMapper.updateCatch", c);
	}

	public int insertLike(Like l, SqlSessionTemplate sqlSession) {
		return sqlSession.insert("boardMapper.insertLike", l);
	}

	public int selectLike(Like like, SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("boardMapper.selectLike", like);
	}

	public int likeCount(int catchNo, SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("boardMapper.likeCount", catchNo);
	}

	public Attach selectFileTop(int catchNo, SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("boardMapper.selectFileTop", catchNo);
	}

	public int getCatchNo(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("boardMapper.getCatchNo");
	}

	public ArrayList<Catch> selectMyCatchList(PageInfo pi, int userNo, SqlSessionTemplate sqlSession) {
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage()-1) * limit;
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("boardMapper.selectMyCatchList", userNo, rowBounds);
	}

	public int selectMyCatchCount(int userNo, SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("boardMapper.selectMyCatchCount", userNo);
	}

	public int selectMyQACount(int userNo, SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("boardMapper.selectMyQACount", userNo);
	}

	public ArrayList<Inquiry> selectMyQAList(PageInfo pi, int userNo, SqlSessionTemplate sqlSession) {
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage()-1) * limit;
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("boardMapper.selectMyQAList", userNo, rowBounds);
	}

	public int updateQA(Inquiry i, SqlSessionTemplate sqlSession) {
		return sqlSession.update("boardMapper.updateQA", i);
	}

	public int deleteQA(int qaNo, SqlSessionTemplate sqlSession) {
		return sqlSession.delete("boardMapper.deleteQA", qaNo);
	}
}
