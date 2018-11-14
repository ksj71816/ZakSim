package zaksim.dao;

import zaksim.dto.Board;

public interface BoardDao {

	// Board 시퀀스 select
	public int selectSeq();
	
	// 인증글 insert
	public void insertCitation(Board citation);
	
}
