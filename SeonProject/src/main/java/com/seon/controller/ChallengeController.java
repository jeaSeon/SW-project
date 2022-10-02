package com.seon.controller;

import java.time.LocalDate;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.seon.board.service.BoardVO;
import com.seon.challenge.service.ChallengeService;
import com.seon.challenge.service.ChallengeVO;
import com.seon.members.service.MembersVO;

@Controller
public class ChallengeController {

	@Resource(name="challengeService")
	private ChallengeService challengeService;
	
	@RequestMapping(value="infoChallenge.do")
	public String infoChallenge( BoardVO boardVO, ChallengeVO challengeVO,
			HttpSession session, HttpServletRequest request, Model model) throws Exception {
		//System.out.println("challengeVO는?"+challengeVO);
		
		
		MembersVO sessionMember=null;
		session=request.getSession();
		sessionMember = (MembersVO) session.getAttribute("SessionMember");
		
		challengeVO.setMemberId(sessionMember.getMemberId());
		
		//System.out.println("challengeVO는?"+challengeVO);
		int result=challengeService.countBoard(challengeVO);
		
		System.out.println("몇개니 너?"+ result);
		LocalDate now=LocalDate.now();
		
		if(result == 0) {
			model.addAttribute("board",challengeService.selectBoard(boardVO));
			model.addAttribute("sessionMember",sessionMember);
			model.addAttribute("now",now);
			
			return "/challenge/infoChallenge";
			
		}else {
			return "/error";
		}
		
		
	}
	
	
	
	
	
	@RequestMapping(value="insertChallenge.do")
	public String insertChallenge(MembersVO membersVO, BoardVO boardVO, ChallengeVO challengeVO,
			HttpSession session, HttpServletRequest request, Model model) throws Exception {
		System.out.println("넘버 넘어왔냐?"+challengeVO.toString());
		
		

		MembersVO sessionMember=null;
		session=request.getSession();
		sessionMember = (MembersVO) session.getAttribute("SessionMember");
		
		System.out.println("세션 값 : "+sessionMember.toString());
		
		challengeVO.setMemberId(sessionMember.getMemberId());
		challengeService.insertChallenge(challengeVO);
		System.out.println("인설트했다잉?"+challengeVO);
		
		int a=challengeService.numBoard(challengeVO);
		System.out.println("몇명 신청했어?"+a);
		
		boardVO.setPCount(a);
		System.out.println("보드정보 갖고와"+boardVO.toString());
		challengeService.PcountBoardUpdate(boardVO);
		
		
		
		model.addAttribute("challengeVO",challengeVO);
		return "/challenge/challengeSuccess";
		
	}
	
	
	//등록성공
	@RequestMapping(value="ChallengeSuccess.do")
	public String ChallengeSuccess(MembersVO membersVO, BoardVO boardVO, ChallengeVO challengeVO,
			HttpSession session, HttpServletRequest request, Model model) {
		
		MembersVO sessionMember=null;
		session=request.getSession();
		sessionMember = (MembersVO) session.getAttribute("SessionMember");
		
		System.out.println("등록등록:"+ boardVO.toString());
		
		model.addAttribute("sessionMember",sessionMember);
		
		
		return "/challenge/challengeSuccess";
	}
	
	
	//내가 신청한 챌린지 확인
	@RequestMapping(value="selectChallenge.do")
	public String selectChallenge(MembersVO membersVO, BoardVO boardVO, ChallengeVO challengeVO,
			HttpSession session, HttpServletRequest request, Model model) throws Exception {
		MembersVO sessionMember=null;
		session=request.getSession();
		sessionMember = (MembersVO) session.getAttribute("SessionMember");
		
		List<BoardVO> selectChallengeList=challengeService.selectChallenge(sessionMember.getMemberId());
		
		System.out.println("신청내역 내와봐"+selectChallengeList);
		model.addAttribute("sessionMember",sessionMember);
		model.addAttribute("selectChallengeList",selectChallengeList);
		
		
		return "/challenge/selectChallenge";
	}
}
