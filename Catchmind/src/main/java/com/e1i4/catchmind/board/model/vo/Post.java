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
public class Post {
	private int postNo;
	private String postTitle;
	private String postContent;
	private String postDate;
	private int postCount;
	private String postStatus;
	private int postWriter;
	private String nickName;
}
