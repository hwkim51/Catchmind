package com.e1i4.catchmind.board.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@ToString
public class Catch {
	private int catchNo;
	private String catchTitle;
	private String catchContent;
	private String catchDate;
	private int catchCount;
	private String catchStatus;
	private String catchWriter;
	private String nickName;
}
