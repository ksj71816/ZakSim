package zaksim.mypage.service;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import zaksim.dto.Challenge;
import zaksim.dto.CommunityGroup;
import zaksim.dto.ZakSimMember;


// 2018.10.30
public interface MypageService {

	// 유저 정보 로드
	public HashMap<String, Object> memberInfo(String id);
	
	// 유저 정보 수정
	public void updateMember(HashMap<String, Object> params);
	
	// 유저 탈퇴
	public void deleteMember(String id);
	
	// 유저가 참여한 그룹 로드
	public CommunityGroup memberGroup(CommunityGroup groupDto);
	
	// 유저 개인도전 리스트 로드
	public Challenge memberChallenge(Challenge challengeDto);
	
	
	
}
