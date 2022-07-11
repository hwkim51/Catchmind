package com.e1i4.catchmind.test.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.e1i4.catchmind.test.model.vo.Test;

@Repository
public class TestDao {
	
	// MBTI 테스트 결과 업데이트 서비스(int)
	public int updateMbti(SqlSessionTemplate sqlSession, Test t) {
		
		return sqlSession.update("testMapper.updateMbti", t);
	}

}
