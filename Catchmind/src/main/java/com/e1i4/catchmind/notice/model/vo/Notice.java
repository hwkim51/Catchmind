package com.e1i4.catchmind.notice.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@NoArgsConstructor
public class Notice {

	private int noticeNo;
	private String noticeTitle;
	private String noticeContent;
	private String noticeDate;
	private int noticeCount;
	private String noticeStatus;
	// 공지사항 사진 1개 등록 -> Attach vo 클래스 대신 notice vo 클래스에 컬럼 추가하여 사용(7/12)
	private String originName; 
	private String changeName;
}
