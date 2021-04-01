package com.petcab.work.user.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Driver {
	private String carType;
	
	private String carNo;
	
	private String about;
	
	private String imageOri;
	
	private String imageRe;
}
