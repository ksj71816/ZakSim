package zaksim.dao;

import java.util.List;
import java.util.Map;

import zaksim.dto.CStatistics;
import zaksim.dto.Challenge;
import zaksim.dto.PStatistics;
import zaksim.dto.Payment;

public interface ChallengeDao {

	
	// 기간 별 인증률
	CStatistics selectCertificationRate(Map<String, String> param);

	// 기간 별 신청 도전 수
	List<CStatistics> selectChallengeNum(Map<String, String> param);

	// 누적 도전금
	List<PStatistics> selectChallengeMony(Map<String, String> param);

	// 기간 별 도전 성공률
	PStatistics selectSuccessNum(Map<String, String> param);

	// 기간 별 평균 도전금
	void selectAverageChallengeMony(int period);

	// 기간 별 종료 도전 수
	void selectEndNum(int period);
	
	// 도전 통계 상세 리스트
	List<CStatistics> selectCStatisticsDetailData(Map<String, String> param);

	// 기부현황 통계 상세 리스트
	List<PStatistics> selectPStatisticsDetailData(Map<String, String> param);
	
//--------------------Do Challenge-------------------------------
	
	// 도전하기 시퀀스 select
	public int selectSeq();
	
	// 도전하기 insert
	public void insertChallenge(Challenge chal);
	
	// 결제정보 insert
	public void insertPayment(Payment pay);
	
	// 도전 정보 select
	public Challenge selectChallenge(int memberIdx);

//------------------ChallengeInfo-------------------------------
	// 도전 상태 수정
	public void updateChallenge(Challenge chal);
	
}
