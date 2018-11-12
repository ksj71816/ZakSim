package zaksim.community.service;

import java.util.List;

import zaksim.dto.Board;

public interface CommunityBoardService {

	// 게시글 불러오기
	public List<Board> informationBoard(int group_idx) ;
	
	// 게시글 작성
	public Board insertBoard(Board board);
	
	// 게시글 수정
	public void updateBoard(Board board);
	
	// 게시글 삭제
	public void deleteBoard(Board board);
	
}
