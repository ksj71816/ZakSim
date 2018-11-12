package zaksim.community.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import zaksim.dao.CommunityBoardDAO;
import zaksim.dto.Board;

@Service
public class CommunityBoardServiceImpl implements CommunityBoardService{

	@Autowired CommunityBoardDAO commentBoardDAO;
	
	// 게시글 불러오기
	public List<Board> informationBoard(int group_idx) {
		
		return commentBoardDAO.informationBoard(group_idx);
	}
	
	// 게시글 작성
	public Board insertBoard(Board board) {
		
		return commentBoardDAO.insertBoard(board);
	}
	
	// 게시글 수정
	public void updateBoard(Board board) {
		
		commentBoardDAO.updateBoard(board);
	}
	
	// 게시글 삭제
	public void deleteBoard(Board board) {
		
		commentBoardDAO.deleteBoard(board);
	}
	
}
