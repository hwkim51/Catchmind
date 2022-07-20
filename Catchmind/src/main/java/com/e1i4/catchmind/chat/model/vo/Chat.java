package com.e1i4.catchmind.chat.model.vo;

import java.io.Serializable;
import java.sql.Date;

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
public class Chat implements Serializable{
	private int roomNo;
	private String writer;
	private String chatContent;
	private String chatTime;
}