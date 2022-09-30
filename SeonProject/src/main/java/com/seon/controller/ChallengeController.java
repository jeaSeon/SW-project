package com.seon.controller;

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
		
		if(result == 0) {
			model.addAttribute("board",challengeService.selectBoard(boardVO));
			model.addAttribute("sessionMember",sessionMember);
			
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
	
}
