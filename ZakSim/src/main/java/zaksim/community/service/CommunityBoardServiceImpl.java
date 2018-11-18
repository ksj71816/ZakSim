package zaksim.community.service;

import java.util.List;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import zaksim.dao.CommunityBoardDAO;
import zaksim.dao.ReportDao;
import zaksim.dto.Board;
import zaksim.dto.Comment;
import zaksim.dto.Report;

@Service
public class CommunityBoardServiceImpl implements CommunityBoardService{

	@Autowired CommunityBoardDAO communityBoardDAO;
	@Autowired ReportDao reportDao;
	@Autowired ServletContext context;
	
	
	
	// 게시글 불러오기
	public List<Board> informationBoard(int group_idx) {
		
		return communityBoardDAO.informationBoard(group_idx);
	}
	
	// 게시글 작성
	public void insertBoard(Board board) {
		
		communityBoardDAO.insertBoard(board);
	}
	
	// 게시글 수정
	public void updateBoard(Board board) {
		
		communityBoardDAO.updateBoard(board);
	}
	
	// 게시글 삭제
	public void deleteBoard(Board board) {
		
		communityBoardDAO.deleteBoard(board);
	}

	@Override
	public List<Comment> viewBoardComment(int groupIdx) {
		return communityBoardDAO.selectBoardComment(groupIdx);
	}

	@Override
	public void report(Report report) {
		reportDao.insertReport(report);
	}
	
}
