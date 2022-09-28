package com.seon.board.service;

import java.util.List;

public interface BoardService {
	
	//글 삽입
	void insertBoard(BoardVO boardVO) throws Exception;
	
	List<BoardVO> selectBoardList(BoardVO boardVO) throws Exception;

}
