package zaksim.community.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import zaksim.dto.Board;
import zaksim.dto.Comment;

public interface CommunityBoardService {

	// 게시글 불러오기
	public List<Board> informationBoard(int group_idx) ;
	
	// 게시글 수정
	public void updateBoard(Board board);
	
	// 게시글 삭제
	public void deleteBoard(Board board);
	
	// 게시글 작성
	public void insertBoard(Board board);

	// 댓글 리스트
	public List<Comment> viewBoardComment(int parseInt);
}
