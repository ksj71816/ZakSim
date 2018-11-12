package zaksim.admin.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import zaksim.dao.ChallengeDao;
import zaksim.dto.CStatistics;

@Service
public class CStatisticsServiceImpl implements CStatisticsService {
	
	@Autowired ChallengeDao challengeDao;

	
	@Override
	public CStatistics viewCertificationRate(String startDate, String endDate) {
		Map<String, String> param = new HashMap<>();
		param.put("startDate", startDate);
		param.put("endDate", endDate);
		return challengeDao.selectCertificationRate(param);
	}

	@Override
	public List<CStatistics> viewChallengeNum(String startDate, String endDate) {
		Map<String, String> param = new HashMap<>();
		param.put("startDate", startDate);
		param.put("endDate", endDate);
		return challengeDao.selectChallengeNum(param);
	}

	@Override
	public List<Integer> viewAverageChallengeMoney(int period) {
		// TODO Auto-generated method stub
		challengeDao.selectAverageChallengeMony(period);
		return null;
	}

	@Override
	public List<Integer> viewMemberNum(int period) {
		// TODO Auto-generated method stub
//		challengeDao.selectMemberNum(period);
		return null;
	}

	@Override
	public List<CStatistics> viewDetailList(String startDate, String endDate) {
		Map<String, String> param = new HashMap<>();
		param.put("startDate", startDate);
		param.put("endDate", endDate);
		return challengeDao.selectCStatisticsDetailData(param);
	}


}
