package zaksim.dao;

import java.util.List;
import java.util.Map;

import zaksim.dto.Board;
import zaksim.util.Paging;

public interface BoardDao {

	// Board 시퀀스 select
	public int selectSeq();
	
	// 인증글 insert
	public void insertCitation(Board citation);
	
	// 개인 도전 전체 인증글  select
	public List<Board> selectTotalCitation();
	
	// 인증글 페이징 처리 - 토탈카운트 조회
	public int cntTotal();
	
	// 인증글 페이징 리스트 select
	public List<Board> selectPagingCitation(Paging paging);
	
	// 인증글 삭제
	public void deleteCitation(int idx);
	
	// 캘린더 클릭시 정보 select
	public Board selectCitation(Map info);
	
	// 최근 인증 정보 select
	public Board selectNewInfo(int idx);
	
}
