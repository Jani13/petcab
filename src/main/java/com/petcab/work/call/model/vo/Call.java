package com.petcab.work.call.model.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

import com.petcab.work.user.model.vo.Driver;

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

	private String fromWhere;
	
	private String toWhere;
	
	private String withOwner;
	
	private String toDriver;
	
	private String status;
	
	private String callType;
	
//	private int dUserNo;
	
	private String animalNoA;
	
	private String animalNoB;
	
	private String animalNoC;
	
	private String merchantUid;
	
	// class
//	private EmgCall emgCall;
	
	// class
	private Driver driver;
}
