package com.petcab.work.visit.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class VisitCountVo {
	private int visitId;
	
	private String visitIp;
	
	private int visitTime;

}
