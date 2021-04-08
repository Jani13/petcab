package com.petcab.work.user.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Member {
	private int userNo;
	
	private String userName;
	
	private String userId;
	
	private String userPwd;
	
	private int postCode;
	
	private String address;
	
	private String phone;
	
	private String status;
	
	private String userType;
	
	private Date enrollDate;
	
	private Date modifyDate;
	
	private int rowNum;
	
}
