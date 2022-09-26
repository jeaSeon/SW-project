package com.seon.members.impl;

import java.util.List;



import org.springframework.stereotype.Repository;

import com.seon.members.service.MembersDAO;
import com.seon.members.service.MembersVO;

import egovframework.rte.psl.dataaccess.EgovAbstractMapper;

@Repository("memberDAOMybatis")
public class MembersDAOMybatis extends EgovAbstractMapper implements MembersDAO {

	
	@Override
	public int memberId_check(String memberId) throws Exception {
		int result = selectOne("memberId_check", memberId);
		return result;
	}

	@Override
	public int memberNickname_check(String memberNickname) throws Exception {
		int result = selectOne("memberNickname_check", memberNickname);
		return result;
	}
	
	@Override
	public void signUpMember(MembersVO membersVo) throws Exception {
		insert("signUpMember", membersVo);
	}
	
	@Override
	public int loginMember(MembersVO membersVo) throws Exception {
		int result = selectOne("loginMember", membersVo);
		return result;
	}
	
	@Override
	public MembersVO selectMember(String memberId) throws Exception {		
		return selectOne("selectMember", memberId);
	}
	
}
