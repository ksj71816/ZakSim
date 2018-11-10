package zaksim.challenge.service;

import zaksim.dto.Challenge;
import zaksim.dto.Payment;
import zaksim.dto.ZakSimMember;

public interface DoChallengeService {

	//도전 정보 입력(도전명, 시작일, 종료일, 도전금액, 결제방법)
	public void setCahllengeInfo(Challenge chal);
	
	//회원 정보 가져오기(이름,이메일,연락처 )
	public ZakSimMember userInfo(ZakSimMember user);
	
	//결제정보 입력
	public void setPayment(Payment pay);
	
	// insert 매개변수 시퀀스 가져오기
	public int getSeqNextval();
	
	
}
