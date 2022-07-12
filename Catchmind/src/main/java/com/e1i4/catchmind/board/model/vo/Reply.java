package com.e1i4.catchmind.board.model.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString
public class Reply {
	private int replyNo;
	private String replyContent;
	private String replyDate;
	private String status;
	private String replyWriter;
	private String replyPost;
	private String replyNickName;
}
