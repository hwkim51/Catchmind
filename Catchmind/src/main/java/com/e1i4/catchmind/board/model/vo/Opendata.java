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
public class Opendata {
	
	private String img;
	private String title;
	private String addr;
	private int startDate;
	private String endDate;
	private String contentid;
	public Opendata(int startDate, String contentid) {
		super();
		this.startDate = startDate;
		this.contentid = contentid;
	}
	
	
}
