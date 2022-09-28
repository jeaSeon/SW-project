package com.seon.board.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.seon.board.service.BoardDAO;
import com.seon.board.service.BoardService;
import com.seon.board.service.BoardVO;


@Service("boardService")
public class BoardServiceImpl implements BoardService{
	
	@Resource(name="boardDAOMybatis")
	private BoardDAO boardDAO;

	@Override
	public void insertBoard(BoardVO boardVO) throws Exception {
		boardDAO.insertBoard(boardVO);
		
	}
	
	

}
