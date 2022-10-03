package com.seon.challenge.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.seon.board.service.BoardVO;
import com.seon.challenge.service.ChallengeDAO;
import com.seon.challenge.service.ChallengeService;
import com.seon.challenge.service.ChallengeVO;

@Service("challengeService")
public class ChallengeServiceImpl implements ChallengeService{
	
	@Resource(name="challengeDAOMybatis")
	private ChallengeDAO challengeDAO;

	@Override
	public void insertChallenge(ChallengeVO challengeVO) throws Exception {
		challengeDAO.insertChallenge(challengeVO);
		
	}

	@Override
	public BoardVO selectBoard(BoardVO boardVO) throws Exception {
		return challengeDAO.selectBoard(boardVO);
	}

	@Override
	public int countBoard(ChallengeVO challengeVO) throws Exception {
		int result=challengeDAO.countBoard(challengeVO);
		return result;
	}

	@Override
	public int numBoard(ChallengeVO challengeVO) throws Exception {
		int result=challengeDAO.numBoard(challengeVO);
		return result;
	}

	@Override
	public void PcountBoardUpdate(BoardVO boardVO) throws Exception {
		challengeDAO.PcountBoardUpdate(boardVO);
		
	}

	@Override
	public List<BoardVO> selectChallenge(String string) throws Exception {
		return challengeDAO.selectChallenge(string);
	}

	@Override
	public void delChallenge(ChallengeVO challengeVO) throws Exception {
		challengeDAO.delChallenge(challengeVO);
		
	}
	
	

}
