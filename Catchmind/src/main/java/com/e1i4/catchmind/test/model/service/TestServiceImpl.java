package com.e1i4.catchmind.test.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.e1i4.catchmind.test.model.dao.TestDao;
import com.e1i4.catchmind.test.model.vo.Test;

@Service
public class TestServiceImpl implements TestService {

	@Autowired
	private TestDao testDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	// MBTI 테스트 결과 업데이트 서비스(int)
	@Override
	public int updateMbti(Test t) {
		
		return testDao.updateMbti(sqlSession, t);
	}
	
	

}
