package com.petcab.work.user.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class User {
	private int userNo;
	
	private String userName;
	
	private String userId;
	
	private String userPwd;
	
	private int postCode;
	
	private String address;
	
	private String phone;
	
	private String status;
	
	private String userType;
	
}
