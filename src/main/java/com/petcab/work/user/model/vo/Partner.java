package com.petcab.work.user.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Partner {
	private String partnerName;
	
	private String partnerType;
	
	private String location;
	
	private String phone;
	
	private String openTime;
	
	private String imageOri;
	
	private String imageRe;
	
	private String about;
	
	private String status;
}
