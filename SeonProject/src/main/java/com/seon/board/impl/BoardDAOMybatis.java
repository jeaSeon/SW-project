package com.seon.board.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.seon.board.service.BoardDAO;
import com.seon.board.service.BoardVO;

import egovframework.rte.psl.dataaccess.EgovAbstractMapper;

@Repository("boardDAOMybatis")
public class BoardDAOMybatis extends EgovAbstractMapper implements BoardDAO{
	
	//글 삽입
	@Override
	public void insertBoard(BoardVO boardVO) throws Exception {
		insert("insertBoard",boardVO);
		
	}

	//전체글 조회
	@Override
	public List<BoardVO> selectBoardList(BoardVO boardVO) throws Exception {
		return selectList("selectBoardList", boardVO);
	}

	//글 1개 조회
	@Override
	public BoardVO selectBoard(BoardVO boardVO) throws Exception {
		return (BoardVO) selectOne("selectBoard",boardVO);
	}

	//글 삭제
	@Override
	public void deleteBoard(BoardVO boardVO) throws Exception {
		delete("deleteBoard", boardVO);
		
	}

	@Override
	public void updateBoard(BoardVO boardVO) throws Exception {
		update("updateBoard",boardVO);
		
	}

	@Override
	public int totalBoard(BoardVO boardVO) throws Exception {
		int result=selectOne("totalBoard",boardVO);
		return result;
	}


	
	

}
