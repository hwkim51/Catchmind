package com.e1i4.catchmind.common.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Getter
@Setter
@ToString
public class Attach {
	private int attNo;
	private String attOrigin;
	private String attChange;
	private int attNotice;
	private int attPost;
	private int attCatch;
}
