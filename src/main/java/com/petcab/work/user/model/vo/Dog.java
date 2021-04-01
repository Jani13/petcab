package com.petcab.work.user.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Dog {
	private String animalNo;
	
	private int userNo;
	
	private String dogName;
	
	private String dogType;

	private int age;

	private String vacc;

	private String disorder;

	private String other;

	private String imageOri;
	
	private String imageRe;
	
	private Date enrollDate;
	
	private Date modifyDate;
	
	private String status;
}
