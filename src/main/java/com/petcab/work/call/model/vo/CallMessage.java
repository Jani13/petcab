package com.petcab.work.call.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class CallMessage {
	private String senderSessionId;
	
	private int callNo; // message
	
	private int dUserNo; // message
	
	private String carNo; // message
}
