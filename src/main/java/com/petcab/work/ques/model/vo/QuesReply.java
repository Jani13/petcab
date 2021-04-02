package com.petcab.work.ques.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class QuesReply {
	private int quesNo;
	
	private String content;
	
	private Date postDate;
	
	private Date editDate;
	
	private int userNo;
}
