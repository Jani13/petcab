package com.petcab.work.common.util;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Search extends PageInfo{
	
	public Search(int currentPage, int pageLimit, int listCount, int listLimit) {
		super(currentPage, pageLimit, listCount, listLimit);
		// TODO Auto-generated constructor stub
	}

	private String searchType;
	
	private String keyword;
	
	private String searchType2;
	
}
