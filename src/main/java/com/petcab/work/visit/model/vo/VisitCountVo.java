package com.petcab.work.visit.model.vo;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class VisitCountVo {
	private int visitId;
	
	private String visitIp;
	
	@JsonFormat(pattern = "yyyy/MM/dd")
	private int visitTime;

}
