package zaksim.challenge.service;

import java.util.List;

import zaksim.dto.Board;
import zaksim.util.Paging;

public interface ChallengersService {

	// 전체 도전 인증글 조회
	public List<Board> getCitationList();
	
	// 인증글 전체 페이징 토탈 카운트
	public int citationTotalCnt();
	
	// 페이징해서 리스트 가져오기
	public List<Board> pagingCitationList(Paging paging);
	
}
