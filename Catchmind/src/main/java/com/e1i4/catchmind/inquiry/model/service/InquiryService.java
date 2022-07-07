package com.e1i4.catchmind.inquiry.model.service;

import com.e1i4.catchmind.inquiry.model.vo.Inquiry;

public interface InquiryService {

	// 1:1 문의 작성하기
	int insertInquiry(Inquiry in);
	
	
}
