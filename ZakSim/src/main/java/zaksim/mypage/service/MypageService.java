package zaksim.mypage.service;

import java.util.List;

import zaksim.dto.Board;
import zaksim.dto.Challenge;
import zaksim.dto.CommunityGroup;
import zaksim.dto.PStatistics;
import zaksim.dto.QnA;
import zaksim.dto.ZakSimMember;


public interface MypageService {

	// 유저 정보 로드
	public ZakSimMember memberInfo(int idx);
	
	// 유저 정보 수정
	public void updateMember(ZakSimMember member);
	
	// 유저 탈퇴
	public void deleteMember(int idx);
	
	// 유저가 참여한 그룹 로드
	public CommunityGroup memberGroup(CommunityGroup groupDto);
	
	// 유저 개인도전 리스트 로드
	public Challenge memberChallenge(Challenge challengeDto);

	// 도전 차트
	public PStatistics viewChalChart(int idx);

	// 최근 문의 내역 보기
	public List<QnA> viewQnaList(int idx);

	// 최신 인증글 보기
	public List<Board> viewBoard(int idx);

	// 가입한 그룹
	public List<CommunityGroup> viewGroup(int idx);

	// 현재 진행중인 도전
	public Challenge viewChallenge(int idx);

	// 인증률 계산
	public Challenge viewRate(int challengeIdx);

	// 비밀번호 확인
	public boolean checkPw(ZakSimMember member);

	// 지난 도전들
	public List<Challenge> viewEndChalList(int idx);
	
	// 탈퇴 시 개설 그룹 장 양도
	public void changeGroupMember(int idx);

	// 나의 인증글 모아보기
	public List<Board> viewMyBoard(int idx);

	// 과거 도전 정보
	public Challenge viewEndChallengeInfo(int endChalIdx);

	// 과거 도전 인증글
	public List<Board> viewMyPastChalBoard(int endChalIdx);

	// 진행중인 도전 갯수
	public int countIngChal(int idx);
	
	
	
}
