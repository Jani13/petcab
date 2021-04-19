package com.petcab.work.payment.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Payment {
	private String merchantUid;
	
	private String impUid;
	
	private String name;

	private String buyerName;
	
	private int paidAmount;

	private String applyNum;

	private String status;

	private String payMethod;

	private String pgProvider;
	
	private String pgTid;
	
	private int paidAt;
	
	private String receiptUrl;
	
	private int userNo;
}
