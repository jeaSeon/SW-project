package com.seon.board.service;

import java.util.List;

public interface BoardService {
	
	//글 삽입
	void insertBoard(BoardVO boardVO) throws Exception;
	
	//전체 글 조회
	List<BoardVO> selectBoardList(BoardVO boardVO) throws Exception;
	
	//글 1개 조회
	BoardVO selectBoard(BoardVO boardVO) throws Exception;

	//글 삭제
	void deleteBoard(BoardVO boardVO) throws Exception;
	
	//글 수정
	void updateBoard(BoardVO boardVO) throws Exception;
}
