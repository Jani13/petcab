package com.petcab.work.user.model.vo;

import java.sql.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

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
	
	@JsonFormat(pattern = "yyyy/MM/dd")
	private Date enrollDate;
	
	private Date modifyDate;
	
	private int rowNum;
	
	private Dog dog;
	
	private int count;
	
}
