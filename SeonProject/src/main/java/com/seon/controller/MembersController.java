package com.seon.controller;

import javax.annotation.Resource;

import javax.servlet.http.HttpServletRequest;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.seon.members.service.MembersService;
import com.seon.members.service.MembersVO;




@Controller
public class MembersController {
	
	@Resource(name = "memberService")
	private MembersService service;
	
	@RequestMapping(value="/test.do")
	public String test() {
		return "index";
	}
	
	//회원가입 페이지로 이동
	@RequestMapping(value = "/signUp.do", method = RequestMethod.GET)
	public String signUp() {
		return "/member/signUp";
	}
	
	//아이디 중복 체크
	@ResponseBody
	@RequestMapping(value = "/memberId_check.do", method = RequestMethod.POST)
	public int memberId_check(@RequestParam(name = "memberId") String memberId) throws Exception {
		System.out.println("값 넘어왔니??? " + memberId);
		int result = service.memberId_check(memberId);
		return result;
	}
	
	//닉네임 중복 체크
	@ResponseBody
	@RequestMapping(value = "/memberNickname_check.do", method = RequestMethod.POST)
	public int memberNickname_check(@RequestParam(name = "memberNickname") String memberNickname) throws Exception {
		int result = service.memberNickname_check(memberNickname);
		return result;
	}
	
	//회원가입
	@ResponseBody
	@RequestMapping(value = "/signUpMember.do", method = RequestMethod.POST)
	public String joinMember(MembersVO membersVo) throws Exception {
		String data = "";
		int idresult = service.memberId_check(membersVo.getMemberId());
		int nickresult = service.memberNickname_check(membersVo.getMemberNickname());
		if (idresult == 1) {
			data = "id";
		} else if (nickresult == 1) {
			data = "nick";
		} else {
			service.signUpMember(membersVo);
			data = "ok";
		}
		return data;
	}
	
	
	//메인으로
	@RequestMapping(value="/main.do")
	public String main() {
		return "main";
	}
	
	//로그인 페이지로
	@RequestMapping(value = "/login.do", method = RequestMethod.GET)
	public String loginForm(HttpSession session, HttpServletRequest request) {
		return "/member/login";
	}
	
	//로그인
	@ResponseBody
	@RequestMapping(value = "/loginMember.do", method = RequestMethod.POST)
	public int loginMember(@RequestParam(name = "memberId") String memberId,
			@RequestParam(name = "memberPassword") String memberPassword, MembersVO membersVo, HttpSession session)
			throws Exception {
		membersVo.setMemberId(memberId);
		membersVo.setMemberPassword(memberPassword);
		int result = service.loginMember(membersVo);
		if (result == 1) {
			MembersVO memberSession = service.selectMember(memberId);
			/*
			String nickname = service.memberNickname(memberId);
			String grade = service.memberGrade(memberId);*/
			String nickname = memberSession.getMemberNickname();
			String grade = memberSession.getMemberGrade();
			
			session.setAttribute("SessionMemberId", membersVo.getMemberId());
			session.setAttribute("SessionMemberNickname", nickname);
			session.setAttribute("SessionMemberGrade", grade);
			session.setAttribute("SessionMember", memberSession);
			
			System.out.println("멤버세션~" + memberSession + "닉네임"+nickname +"등급"+grade);

		} else {
			System.out.println("로그인 실패");
		}
		return result;
	}
	
	
	@RequestMapping(value = "/logout.do", method = RequestMethod.GET)
	public String logout(HttpSession session) {
		session.removeAttribute("SessionMemberId");
		session.removeAttribute("SessionMemberNickname");
		session.removeAttribute("SessionMemberGrade");
		session.removeAttribute("SessionMember");
		
		return "main";
	}

}
