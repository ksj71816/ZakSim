package zaksim.dao;

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
	public int updateMember(ZakSimMember member);
	
	// 유저 탈퇴
	public int deleteMember(int idx);
	
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

	// 비밀번호 확인
	public int selectPw(ZakSimMember member);

	// 지난 도전들
	public List<Challenge> selectEndChal(int idx);

	// 탈퇴 시 개설 그룹 인덱스 반환
	public List<CommunityGroup> selectCommunityGroupMember(int idx);

	// 탈퇴 시 그룹 장 양도
	public void updateGroupMember(CommunityGroup g);

	// 그룹의 멤버 수 반환
	public int checkAnotherMember(CommunityGroup g);

	// 그룹 삭제
	public void deleteCommunityGroup(CommunityGroup g);

	// 나의 인증글 모아보기
	public List<Board> selectMyBoard(int idx);

	// 과거 도전 정보
	public Challenge selectEndChallengeInfo(int endChalIdx);

	// 과거 도전 인증글
	public List<Board> selectEndChalBoard(int endChalIdx);
	
}
