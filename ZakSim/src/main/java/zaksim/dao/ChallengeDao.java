package zaksim.dao;

import java.util.Map;

import zaksim.dto.Challenge;
import zaksim.dto.Payment;

public interface ChallengeDao {

	
	// 기간 별 인증률
	void selectCertificationRate(int period);

	// 기간 별 신청 도전 수
	void selectChallengeNum(int period);

	// 누적 도전금
	void selectChallengeMony(int period);

	// 회원 수
//	void selectMemberNum(int period);

	// 기간 별 도전 성공률
	void selectSuccessNum(int period);

	// 기간 별 평균 도전금
	void selectAverageChallengeMony(int period);

	// 기간 별 종료 도전 수
	void selectEndNum(int period);
	
	
//--------------------Do Challenge-------------------------------
	
	// 도전하기 시퀀스 select
	public int selectSeq();
	
	// 도전하기 insert
	public void insertChallenge(Challenge chal);
	
	// 결제정보 insert
	public void insertPayment(Payment pay);
	
	// 도전 정보 select
	public Challenge selectChallenge(int memberIdx);
	
}
