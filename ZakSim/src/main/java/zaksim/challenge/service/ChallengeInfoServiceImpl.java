package zaksim.challenge.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import zaksim.dao.ChallengeDao;
import zaksim.dto.Challenge;

@Service
public class ChallengeInfoServiceImpl implements ChallengeInfoService {

	@Autowired ChallengeDao chalDao;
	
	@Override
	public Challenge getChallengeInfo(int memberIdx) {
	
		System.out.println("service : "+memberIdx);
		
		return chalDao.selectChallenge(memberIdx);
	}

}
