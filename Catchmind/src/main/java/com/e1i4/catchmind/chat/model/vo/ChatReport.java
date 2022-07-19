package com.e1i4.catchmind.chat.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class ChatReport {
	private int userNo;
	private int reportedFrom;
	private String reportedFor;
}
