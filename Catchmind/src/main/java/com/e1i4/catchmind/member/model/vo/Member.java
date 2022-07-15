package com.e1i4.catchmind.member.model.vo;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor // 기본생성자 어노테이션
@AllArgsConstructor // 모든 필드를 매개변수로 갖는 생성자
@Setter
@Getter
@ToString
@Data
public class Member {

	private int userNo; //USER_NO	NUMBER
	private String userId; //USER_ID	VARCHAR2(15 BYTE)
	private String userPwd; //USER_PWD	VARCHAR2(20 BYTE)
	private String email; //EMAIL	VARCHAR2(40 BYTE)
	private String nickname; //NICKNAME	VARCHAR2(15 BYTE)
	private String userName; //USER_NAME	VARCHAR2(15 BYTE)
	private String birthDay; //BIRTHDAY	DATE
	private String mbti; //MBTI	VARCHAR2(4 BYTE)
	private String phone; //PHONE	VARCHAR2(20 BYTE)
	private int height; //HEIGHT	NUMBER
	private String gender; //GENDER	VARCHAR2(1 BYTE)
	private String profile; //PROFILE	VARCHAR2(50 BYTE)
	private String recentLogin; //RECENT_LOGIN	DATE
	private String recentLogout; //RECENT_LOGOUT	DATE
	private String partner; //PARTNER	NUMBER
	private int status; //STATUS	NUMBER
	private String pic; //PIC	VARCHAR2(100 BYTE)
	private int longitude; //LONGITUDE	NUMBER
	private int latitude; //LATITUDE	NUMBER
}
