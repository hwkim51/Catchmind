package com.e1i4.catchmind.faq.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.e1i4.catchmind.faq.model.vo.Faq;

@Repository
public class FaqDao {

	public ArrayList<Faq> selectFaq(SqlSessionTemplate sqlSession, int faqNo) {
		return (ArrayList)sqlSession.selectList("faqMapper.selectFaq", faqNo);
	}
	
	public ArrayList<Faq> selectFaqList(SqlSessionTemplate sqlSession){
		return (ArrayList)sqlSession.selectList("faqMapper.selectFaqList");
	}
}
