package com.petcab.work.call.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class DriverMessage {
	private int callNo;
	
	private int dUserNo;
	
	private String carNo;
}
