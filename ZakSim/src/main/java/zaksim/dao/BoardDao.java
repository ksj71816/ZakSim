package zaksim.dao;

import java.util.List;

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
	
	public List<Board> selectPagingCitation(Paging paging);
	
}
