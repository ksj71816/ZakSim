package zaksim.admin.service;

import java.util.List;

import zaksim.dto.CStatistics;

public interface CStatisticsService {
	
	// 인증률 가져오기
	public CStatistics viewCertificationRate(String startDate, String endDate);
	
	// 도전수 정보 가져오기
	public List<CStatistics> viewChallengeNum(String startDate, String endDate);
	
	// 도전금 평균 정보 가져오기
	public List<Integer> viewAverageChallengeMoney(int period);

	// 회원수 정보 가져오기
	// MStatistics 메소드 사용?
	public List<Integer> viewMemberNum(int period);
	
	// 상세 리스트 가져오기
	public List<CStatistics> viewDetailList(String startDate, String endDate);
}
