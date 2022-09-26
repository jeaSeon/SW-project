package com.seon.members.service;

public interface MembersService {

	int memberId_check(String memberId) throws Exception;

	int memberNickname_check(String memberNickname) throws Exception;

	void signUpMember(MembersVO membersVo) throws Exception;

	int loginMember(MembersVO membersVo) throws Exception;

	MembersVO selectMember(String memberId) throws Exception;

}
