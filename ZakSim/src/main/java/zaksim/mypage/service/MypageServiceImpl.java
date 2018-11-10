package zaksim.mypage.service;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import zaksim.dao.MypageDao;
import zaksim.dto.Challenge;
import zaksim.dto.CommunityGroup;
import zaksim.dto.ZakSimMember;

@Service
public class MypageServiceImpl implements MypageService {
	
	@Autowired MypageDao memberDao;

	// 유저 정보 로드
	@Override
	public HashMap<String, Object> memberInfo(String id) {
		
		return memberDao.memberInfo(id);
	}
	
	// 유저 정보 수정
	@Override
	public void updateMember(HashMap<String, Object> params) {
		System.out.println((String)params.get("ID"));
		
		HashMap<String, Object> record = memberDao.memberInfo((String)params.get("ID"));

		record.putAll(params);

		memberDao.updateMember(record);
	}
	
	// 유저가 참여한 그룹 로드
	@Override
	public CommunityGroup memberGroup(CommunityGroup groupDto) {
		
		return null;
	}
	
	// 유저 개인도전 리스트 로드
	@Override
	public Challenge memberChallenge(Challenge challengeDto) {
		
		return null;
	}
	
	// 유저 탈퇴
	@Override
	public void deleteMember(String password) {
		
		memberDao.deleteMember(password);
	}

}
