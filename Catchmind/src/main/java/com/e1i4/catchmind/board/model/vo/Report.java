package com.e1i4.catchmind.board.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Getter
@Setter
@ToString
public class Report {
	private String repContent;
	private String catchNo;
	private String postNo;
	private String replyNo;
}
