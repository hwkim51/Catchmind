package com.e1i4.catchmind.chat.model.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class SearchMatch {
	private int userNo;
	private String gender;
	private String mbti;
	private int hlow;
	private int hhigh;
	private int alow;
	private int ahigh;

}
