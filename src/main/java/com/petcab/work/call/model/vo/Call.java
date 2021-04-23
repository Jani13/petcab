package com.petcab.work.call.model.vo;

import java.util.List;

import com.petcab.work.user.model.vo.Dog;
import com.petcab.work.user.model.vo.Driver;
import com.petcab.work.user.model.vo.Partner;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Call {
	private int callNo;
		
	private String pickupTime;

	private String fromWhere;
	
	private String toWhere;
	
	private String withOwner;
	
	private String toDriver;
	
	private String status;
	
	private String callType;
		
	private List<Dog> dogs;
	
	private String merchantUid;
	
	private Driver driver;

	private int rowNum;
	
	private int paidAmount;
	
	private Dog dog;
	
	private Partner partner;
}
