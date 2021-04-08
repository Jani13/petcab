package com.petcab.work.user.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Driver {
	
	private int userNo;
	
	private String userName;
	
	private String carType;
	
	private String carNo;
	
	private String about;

	private String imageOri;
	
	private String imageRe;
	
	private String status;

	private Member member;
	
	private int rowNum;
}

