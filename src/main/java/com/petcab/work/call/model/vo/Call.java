package com.petcab.work.call.model.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Component
public class Call {
	private int callNo;
		
	private String pickupTime;
	
//	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd HH a z")
//	@Temporal(TemporalType.DATE)
//	private Date pickupTime;
	
	private String fromWhere;
	
	private String toWhere;
	
	private String withOwner;
	
	private String toDriver;
	
	private String status;
	
	private int callType;
	
	private int userNo;
	
	private String animalNoA;
	
	private String animalNoB;
	
	private String animalNoC;
	
	private String merchantUid;
}
