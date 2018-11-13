package zaksim.mypage.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import zaksim.dao.MypageDao;
import zaksim.dto.Board;
import zaksim.dto.Challenge;
import zaksim.dto.CommunityGroup;
import zaksim.dto.PStatistics;
import zaksim.dto.QnA;
import zaksim.dto.ZakSimMember;

@Service
public class MypageServiceImpl implements MypageService {
	
	@Autowired MypageDao memberDao;

	// 유저 정보 로드
	@Override
	public ZakSimMember memberInfo(int idx) {
		return memberDao.memberInfo(idx);
	}
	
	// 유저 정보 수정
	@Override
	public void updateMember(ZakSimMember member) {
		memberDao.updateMember(member);
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
	public void deleteMember(int idx) {
		memberDao.deleteMember(idx);
	}

	@Override
	public PStatistics viewChalChart(int idx) {
		return memberDao.selectChalData(idx);
	}

	@Override
	public List<QnA> viewQnaList(int idx) {
		return memberDao.selectQnaList(idx);
	}

	@Override
	public List<Board> viewBoard(int idx) {
		return memberDao.selectBoard(idx);
	}

	@Override
	public List<CommunityGroup> viewGroup(int idx) {
		return memberDao.selectCommunityGroup(idx);
	}

	@Override
	public Challenge viewChallenge(int idx) {
		return memberDao.selectChallenge(idx);
	}

	@Override
	public Challenge viewRate(int challengeIdx) {
		return memberDao.selectChallengeRate(challengeIdx);
	}

	@Override
	public boolean checkPw(ZakSimMember member) {
		if(memberDao.selectPw(member) > 0) {
			return true;
		} else {
			return false;
		}
	}

	@Override
	public List<Challenge> viewEndChalList(int idx) {
		return memberDao.selectEndChal(idx);
	}

}
