package zaksim.main.service;

import zaksim.dto.Board;
import zaksim.dto.Challenge;
import zaksim.dto.CommunityGroup;
import zaksim.dto.ZakSimMember;

public interface MainService {

	
	// 도전 정보 가져오기
	public Challenge chalInfo(ZakSimMember member);
	
	
	// 인기 그룹 가져오기
	public CommunityGroup groupRank();
	
	// 최신 인증글 가져오기
	public Board citations();
}
