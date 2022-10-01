package com.seon.challenge.service;

import com.seon.board.service.BoardVO;

public interface ChallengeService {

	
	void insertChallenge(ChallengeVO challengeVO) throws Exception;
	
	BoardVO selectBoard(BoardVO boardVO) throws Exception;
	
	int countBoard(ChallengeVO challengeVO) throws Exception;
	
	int numBoard(ChallengeVO challengeVO) throws Exception;
	
	void PcountBoardUpdate(BoardVO boardVO) throws Exception;
}
