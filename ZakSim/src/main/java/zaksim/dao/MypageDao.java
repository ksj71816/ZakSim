package zaksim.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import zaksim.dto.Board;
import zaksim.dto.Challenge;
import zaksim.dto.CommunityGroup;
import zaksim.dto.PStatistics;
import zaksim.dto.QnA;
import zaksim.dto.ZakSimMember;

public interface MypageDao {

	// 유저 정보 로드
	public ZakSimMember memberInfo(int idx);
	
	// 유저 정보 수정
	public int updateMember(HashMap<String, Object> params);
	
	// 유저 탈퇴
	public int deleteMember(String id);
	
	// 유저가 참여한 그룹 로드
	public List<CommunityGroup> memberGroup(Map<String, String> param);
	
	// 유저 개인도전 리스트 로드
	public List<Challenge> memberChallenge(Map<String, String> param);

	// 도전 차트
	public PStatistics selectChalData(int idx);

	// 최근 문의 내역
	public List<QnA> selectQnaList(int idx);

	// 최신 인증글
	public List<Board> selectBoard(int idx);
	
	// 가입한 그룹
	public List<CommunityGroup> selectCommunityGroup(int idx);

	// 현재 진행중인 도전
	public Challenge selectChallenge(int idx);

	// 도전 인증률 계산
	public Challenge selectChallengeRate(int challengeIdx);
	
}
