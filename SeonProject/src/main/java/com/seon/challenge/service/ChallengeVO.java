package com.seon.challenge.service;

import java.util.Date;


import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@Data
public class ChallengeVO {
	private int challengeNo;
	private String boardNo;
	private String memberId;
	private Date cwdate;
	
}
