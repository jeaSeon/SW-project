package com.seon.board.service;

import java.util.Date;


import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@Data
public class BoardVO {
	private int boardNo;
	private String title;
	private String content;
	private Date wdate;
	private String boardType;
	
	//검색기능
	private String searchCondition;
	private String searchKeyword;
	
	
	private String memberId;
	private String memberNickname;
	
	
	private String boardPicturePath;
	private String plantType;
	private String endDate;
	
	private int pCount;
	
	//페이징
	private int viewPage = 1;
	private int startIndex = 0;
	private int endIndex = 10;
	
	private int pageList = 5;
	private int firstPage = 0;
	private int lastPage = 0;

}
