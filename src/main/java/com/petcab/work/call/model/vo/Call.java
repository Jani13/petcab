package com.petcab.work.call.model.vo;

import java.util.List;

import com.petcab.work.user.model.vo.Dog;
import com.petcab.work.user.model.vo.Driver;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
//@Component
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
	
//	protected int callNo;
//	
//	protected String pickupTime;
//
//	protected String fromWhere;
//	
//	protected String toWhere;
//	
//	protected String withOwner;
//	
//	protected String toDriver;
//	
//	protected String status;
//	
//	protected String callType;
//		
//	protected List<Dog> dogs;
//	
//	protected String merchantUid;
//	
//	protected Driver driver;
}
