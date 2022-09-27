package com.seon.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.seon.board.service.BoardVO;
import com.seon.members.service.MembersVO;

@Controller
public class BoardController {
	
	@RequestMapping(value = "/board.do", method = RequestMethod.GET)
	public String board(HttpSession session, HttpServletRequest request, Model model) {
		String memberId=null;
		session=request.getSession();
		memberId=(String) session.getAttribute("SessionMemberId");
		
		model.addAttribute("memberId",memberId);
		return "/board/board";
	}
	
	@RequestMapping(value="/boardWrite.do", method=RequestMethod.GET)
	public String boardWrite(HttpSession session, HttpServletRequest request, Model model) {
		String memberId=null;
		session=request.getSession();
		memberId=(String) session.getAttribute("SessionMemberId");
		
		model.addAttribute("memberId",memberId);
		
		return "/board/boardWrite";
	}
	
	@RequestMapping(value="upload_ok.do", method=RequestMethod.POST)
	public String upload(@RequestParam("file") MultipartFile file, MembersVO membersVO, BoardVO boardVO,
						HttpSession session, HttpServletRequest request) {
		return 
	}
	
	

}
