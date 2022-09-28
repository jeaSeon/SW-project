package com.seon.controller;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.seon.board.service.BoardService;
import com.seon.board.service.BoardVO;
import com.seon.members.service.MembersVO;

@Controller
public class BoardController {
	
	@Resource(name="boardService")
	private BoardService boardService;
	
	//글 조회
	@RequestMapping(value = "/boardlist.do", method = RequestMethod.GET)
	public String board(HttpSession session, HttpServletRequest request, Model model) {
		String memberId=null;
		session=request.getSession();
		memberId=(String) session.getAttribute("SessionMemberId");
		
		model.addAttribute("memberId",memberId);
		return "/board/boardlist";
	}
	
	@RequestMapping(value="/boardWrite.do", method=RequestMethod.GET)
	public String boardWrite(HttpSession session, HttpServletRequest request, Model model) {
		String memberId=null;
		session=request.getSession();
		memberId=(String) session.getAttribute("SessionMemberId");
		
		model.addAttribute("memberId",memberId);
		
		return "/board/boardWrite";
	}
	
	//게시글 작성
	@RequestMapping(value="upload_ok.do", method=RequestMethod.POST)
	public String upload(@RequestParam("file") MultipartFile file, MembersVO membersVO, BoardVO boardVO,
						HttpSession session, HttpServletRequest request, Model model) throws Exception {
		
		System.out.println("-------->"+ boardVO.toString());
		
		String data="";
		

		session=request.getSession();
		String memberId=(String) session.getAttribute("SessionMemberId");
		String memberNickname = (String) session.getAttribute("SessionMemberNickname");
		System.out.println("-------->"+ memberId + ":" + memberNickname);
		
		String fileRealName=file.getOriginalFilename();	//파일명 얻는 메소드
		long size=file.getSize(); // 파일 사이즈
		
		System.out.println("파일명 : " + fileRealName);
		System.out.println("용량크기(byte) : " + size);
		//서버에 저장할 파일이름 : ~ .jsp이런식으로 확장자명 구함.
		
		//확장자 구하기.
		String fileExtension="";
		
		if(fileRealName!="") {
			fileExtension=fileRealName.substring(fileRealName.lastIndexOf("."), fileRealName.length());
		}
		
		//파일 저장되는 경로
		String uploadFolder="C:\\picture";
		
		//랜덤이름 : 파일 이름 중복을 막기 위해.
		UUID uuid=UUID.randomUUID();
		System.out.println("--------> uuid : " + uuid);
		String[] uuids=uuid.toString().split("-");
		
		String uniqueName=uuids[0];
		System.out.println("--------> 생성문자열 : " + uniqueName);
		System.out.println("--------> 확장자명 : " + fileExtension);
		//uniqueName : 랜덤파일생성명 / fileExtension : 확장자명
		
		boardVO.setMemberId(memberId);
		boardVO.setMemberNickname(memberNickname);
		boardVO.setBoardType("Challenge");
		boardVO.setBoardPicturePath(uniqueName+fileExtension);
		boardService.insertBoard(boardVO);
		
		
		File saveFile = new File(uploadFolder+"\\"+uniqueName+fileExtension);
		
		try {
			file.transferTo(saveFile);
		}catch(IllegalStateException e) {
			e.printStackTrace();
		}catch(IOException e) {
			e.printStackTrace();
		}
		
		
		//세션
		model.addAttribute("memberId",memberId);
		return "board/boardlist";
	}
	
	

}
