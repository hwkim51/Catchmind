package com.e1i4.catchmind.faq.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.e1i4.catchmind.faq.model.dao.FaqDao;
import com.e1i4.catchmind.faq.model.vo.Faq;

@Service
public class FaqServiceImpl implements FaqService {

	@Autowired
	private FaqDao faqDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	// ajax로 faq 질문-답변 조회
	public ArrayList<Faq> selectFaq(int faqNo) {
		
		return faqDao.selectFaq(sqlSession, faqNo);
		
	}

	@Override
	public ArrayList<Faq> selectFaqList() {
		return faqDao.selectFaqList(sqlSession);
	}
}
