package zaksim.admin.service;

import java.util.List;

import zaksim.dto.PStatistics;

public interface PStatisticsService {
	
	// 도전 성공률 가져오기
	public PStatistics viewSuccessRate(String startDate, String endDate);
	
	// 누적 도전금 정보 가져오기
	public List<PStatistics> viewChallengeMoney(String startDate, String endDate);
	
	// 수수료 수익 정보 가져오기
	public List<Integer> viewProfits(int period);

	// 회원수 정보 가져오기
	// MStatistics 메소드 사용?
	public List<Integer> viewMemberNum(int period);
	
	// 종료 도전수 가져오기
	public List<Integer> viewEndChallenge(int period);

	// 기부현황 통계 상세 리스트
	public List<PStatistics> viewDetailList(String startDate, String endDate);

}
