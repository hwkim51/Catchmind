package com.e1i4.catchmind.chat.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@NoArgsConstructor
@AllArgsConstructor
@Data
@Setter
@Getter
public class ChatReport {
	private int userNo;
	private int reportedFrom;
	private String reportedFor;
}
