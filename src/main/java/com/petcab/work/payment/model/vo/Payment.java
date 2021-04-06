package com.petcab.work.payment.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Payment {
	private String merchatuid;
	
	private String pg;
	
	private String payMethod;
	
	private String name;
	
	private int amount;
	
	private String impUid;
	
	private int paidAmount;
	
	private String applyNum;
	
	private String success;
	
	private String status;
	
	private String pgProvider;
	
	private String pgTid;
	
	private int paidAt;
	
	private String receipUrl;
	
	private String vbankNum;
	
	private String vbankName;
	
	private String vbankHolder;
	
	private int vbankDate;
	
	private int paymentDate;
}
