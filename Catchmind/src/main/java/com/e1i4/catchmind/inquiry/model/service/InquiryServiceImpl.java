package com.e1i4.catchmind.inquiry.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.e1i4.catchmind.inquiry.model.dao.InquiryDao;
import com.e1i4.catchmind.inquiry.model.vo.Inquiry;

@Service
public class InquiryServiceImpl implements InquiryService {

	@Autowired
	private InquiryDao inquiryDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int insertInquiry(Inquiry in) {
		
		return inquiryDao.insertInquiry(sqlSession, in);
		
		
	}


}
