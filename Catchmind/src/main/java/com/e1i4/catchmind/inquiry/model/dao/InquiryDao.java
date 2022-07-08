package com.e1i4.catchmind.inquiry.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.e1i4.catchmind.inquiry.model.vo.Inquiry;

@Repository
public class InquiryDao {
	
	public int insertInquiry(SqlSessionTemplate sqlSession, Inquiry in) {
		
		return sqlSession.insert("inquiryMapper.insertInquiry", in);
	}

}
