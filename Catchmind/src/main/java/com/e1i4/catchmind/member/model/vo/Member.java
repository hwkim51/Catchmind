package com.e1i4.catchmind.member.model.vo;

import java.sql.Date;

import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@Data
public class Member {
	private int userNo;
	private String userId;
	private String userPwd;
	private String email;
	private String nickname;
	private String userName;
	private Date birthday;
	private String mbti;
	private String phone;
	private double height;
	private String gender;
	private String profile;
	private Date recentLogin;
	private Date recentLogout;
	private String partner;
	private int status;
	private String pic;
	private double longitude;
	private double latitude;
	
}
