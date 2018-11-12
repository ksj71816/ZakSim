package zaksim.admin.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import zaksim.dao.ChallengeDao;
import zaksim.dao.ProfitDao;
import zaksim.dao.ZakSimMemberDao;
import zaksim.dto.PStatistics;

@Service
public class PStatisticsServiceImpl implements PStatisticsService{
	
	@Autowired ChallengeDao challengeDao;
	@Autowired ProfitDao profitDao;
	@Autowired ZakSimMemberDao zakSimMemberDao;
	

	@Override
	public PStatistics viewSuccessRate(String startDate, String endDate) {
		Map<String, String> param = new HashMap<>();
		param.put("startDate", startDate);
		param.put("endDate", endDate);
		return challengeDao.selectSuccessNum(param);
	}

	@Override
	public List<PStatistics> viewChallengeMoney(String startDate, String endDate) {
		Map<String, String> param = new HashMap<>();
		param.put("startDate", startDate);
		param.put("endDate", endDate);
		return challengeDao.selectChallengeMony(param);
	}

	@Override
	public List<Integer> viewProfits(int period) {
		// TODO Auto-generated method stub
		profitDao.selectProfits(period);
		return null;
	}

	@Override
	public List<Integer> viewMemberNum(int period) {
		// TODO Auto-generated method stub
//		zakSimMemberDao.selectMemberNum(period);
		return null;
	}

	@Override
	public List<Integer> viewEndChallenge(int period) {
		// TODO Auto-generated method stub
		challengeDao.selectEndNum(period);
		return null;
	}

	@Override
	public List<PStatistics> viewDetailList(String startDate, String endDate) {
		Map<String, String> param = new HashMap<>();
		param.put("startDate", startDate);
		param.put("endDate", endDate);
		return challengeDao.selectPStatisticsDetailData(param);
	}

}
