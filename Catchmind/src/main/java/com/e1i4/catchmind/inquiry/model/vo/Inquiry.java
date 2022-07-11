package com.e1i4.catchmind.inquiry.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@NoArgsConstructor
public class Inquiry {

	private int qaNo;
	private String qaTitle;
	private String qaContent;
	private String qaDate;
	private String anContent;
	private String qaAnswerDate;
	private String qaWriter;
	private String qaAnswerYn; //답변여부 컬럼이 필요해서 새로 추가함
	
}
