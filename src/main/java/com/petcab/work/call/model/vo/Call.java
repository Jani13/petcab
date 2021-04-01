package com.petcab.work.call.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Call {
	private int callNo;
	
	private Date time;
	
	private String from_where;
	
	private String to_where;
	
	private String withOwner;
	
	private String toDriver;
	
	private String status;
	
	private int callType;
	
	private int userNo;
	
	private String animalNoA;
	
	private String animalNoB;
	
	private String animalNoC;
}
