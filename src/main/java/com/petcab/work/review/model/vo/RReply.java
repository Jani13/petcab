package com.petcab.work.review.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class RReply {
	private int replyNo;
	
	private int groupNo;
	
	private int groupSeq;
	
	private int depth;
	
	private String content;
	
	private Date postDate;
	
	private Date editDate;
	
	private String status;
	
	private int userNo;
	
	private int reviewNo;
	
}
