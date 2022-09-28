package com.seon.board.service;

import java.util.List;

public interface BoardDAO {
	
	void insertBoard(BoardVO boardVO) throws Exception;
	
	List<BoardVO> selectBoardList(BoardVO boardVO) throws Exception;

}
