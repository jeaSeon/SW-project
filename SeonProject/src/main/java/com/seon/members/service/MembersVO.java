package com.seon.members.service;

import java.util.Date;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class MembersVO {
	private String memberId;
	private String memberPassword;
	private String memberName;
	private String memberNickname;
	private Date memberSignDate;
	private String memberGrade;
	private String memberEtc;	
	

	public MembersVO(String memberId, String memberPassword, String memberName,
			String memberNickname) {
		super();
		this.memberId = memberId;
		this.memberPassword = memberPassword;
		this.memberName = memberName;
		this.memberNickname = memberNickname;
	}

}

