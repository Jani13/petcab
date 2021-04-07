package com.petcab.work.ques.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Ques {
	private int quesNo;
	
	private int userNo;
	
	private String userId;
	
	private String title;
	
	private String content;
	
	private Date postDate;
	
	private Date editDate;
	
	private int viewNo;
	
	private String quesType;
	
	private String quesPwd;
	
	private int groupNo;
	
	private int groupSeq;
	
	private int depth;
	
	private String status;
}
