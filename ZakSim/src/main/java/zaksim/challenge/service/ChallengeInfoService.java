package zaksim.challenge.service;

import java.util.Date;

import zaksim.dto.Challenge;

public interface ChallengeInfoService {

	
	//도전 정보 가져오기(도전명, 시작일, 종료일, 도전금액, 결제방법)
	public Challenge getChallengeInfo(int memberIdx);
	
	//도전 포기
	public void discardChallenge(Challenge chal);
	
	// 도전 시작일과 현재날짜 계산 (날짜 비교)
	public int dateColculation(Date nDate);
	
}
