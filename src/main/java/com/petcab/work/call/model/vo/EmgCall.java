package com.petcab.work.call.model.vo;

import org.springframework.stereotype.Component;

import com.petcab.work.user.model.vo.Partner;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Component
public class EmgCall extends Call {
	private int callNo;
	
	private String toPartner;
	
	private String toReject;
	
//	private int pUserNo;
	
	private Partner Partner;
}
