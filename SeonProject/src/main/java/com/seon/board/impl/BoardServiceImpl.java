package com.seon.board.impl;

import java.util.List;

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

	@Override
	public List<BoardVO> selectBoardList(BoardVO boardVO) throws Exception {
		return boardDAO.selectBoardList(boardVO);
	}

	@Override
	public BoardVO selectBoard(BoardVO boardVO) throws Exception {
		return boardDAO.selectBoard(boardVO);
	}

	@Override
	public void deleteBoard(BoardVO boardVO) throws Exception {
		boardDAO.deleteBoard(boardVO);
		
	}

	@Override
	public void updateBoard(BoardVO boardVO) throws Exception {
		boardDAO.updateBoard(boardVO);
		
	}
	
	

}
