package zaksim.challenge.service;

import zaksim.dto.Challenge;
import zaksim.dto.ZakSimMember;

public interface ChallengeInfoService {

	
	//도전 정보 가져오기(도전명, 시작일, 종료일, 도전금액, 결제방법)
	public Challenge getChallengeInfo(int memberIdx);
	
	
	
}
