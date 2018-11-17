package zaksim.community.service;

import java.util.List;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import zaksim.dao.CommunityBoardDAO;
import zaksim.dto.Board;
import zaksim.dto.Comment;

@Service
public class CommunityBoardServiceImpl implements CommunityBoardService{

	@Autowired CommunityBoardDAO communityBoardDAO;
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

//	/**
//	 * 파일 업로드 (글구 db에 저장된 값 업데이트)
//	 */
//	@Override
//	public void uploadFile(Board board, MultipartFile imgFile) {
//		String realpath = context.getRealPath("upload");
//		
//		String uid = UUID.randomUUID().toString().split("-")[4];
//		
//		System.out.println(uid);
//		
//		String stored = imgFile.getOriginalFilename()+"_"+uid;
//		
//		File dest = new File(realpath, stored);
//		
//		try {
//			imgFile.transferTo(dest);
//		} catch (IllegalStateException e) {
//			e.printStackTrace();
//		} catch (IOException e) {
//			e.printStackTrace();
//		}
//		
//		board.setImage(imgFile.getOriginalFilename());
//		board.setStoredName(stored);
//		
////		communityBoardDAO.updateBoard(board);
//		
//	}
	
}
