package com.petcab.work.review.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Review {
	private int reviewNo;
	
	private String callType;
	
	private int groupNo;
	
	private String userId;
	
	private int groupSeq;
	
	private int depth;
	
	private String title;
	
	private String content;
	
	private int starNo;
	
	private Date postDate;
	
	private Date editDate;
	
	private int viewNo;
	
	private String status;
	
	private int userNo;
	
	private int callNo;
	
}
