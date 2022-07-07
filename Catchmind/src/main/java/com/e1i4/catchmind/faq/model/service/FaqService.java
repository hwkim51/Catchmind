package com.e1i4.catchmind.faq.model.service;

import java.util.ArrayList;

import com.e1i4.catchmind.faq.model.vo.Faq;

public interface FaqService {

	ArrayList<Faq> selectFaq(int faqNo);
}
