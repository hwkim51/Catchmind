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
	private String qTitle;
	private String qContent;
	private String qDate;
	private String aContent;
	private String qAnswerDate;
	private int qWriter;
	
}
