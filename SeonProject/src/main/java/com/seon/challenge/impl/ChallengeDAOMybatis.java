package com.seon.challenge.impl;

import org.springframework.stereotype.Repository;

import com.seon.board.service.BoardVO;
import com.seon.challenge.service.ChallengeDAO;
import com.seon.challenge.service.ChallengeVO;

import egovframework.rte.psl.dataaccess.EgovAbstractMapper;

@Repository("challengeDAOMybatis")
public class ChallengeDAOMybatis extends EgovAbstractMapper implements ChallengeDAO{

	@Override
	public void insertChallenge(ChallengeVO challengeVO) throws Exception {
		insert("insertChallenge",challengeVO);
		
	}

	@Override
	public BoardVO selectBoard(BoardVO boardVO) throws Exception {
		return selectOne("infoBoard",boardVO);
	}

	@Override
	public int countBoard(ChallengeVO challengeVO) throws Exception {
		int result=selectOne("countBoard",challengeVO);
		return result;
	}

}
