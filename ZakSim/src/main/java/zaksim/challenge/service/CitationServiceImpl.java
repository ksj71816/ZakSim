package zaksim.challenge.service;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import zaksim.dao.BoardDao;
import zaksim.dto.Board;

@Service
public class CitationServiceImpl implements CitationService {

	@Autowired ServletContext context;
	@Autowired BoardDao boardDao;

	// 인증글 이미지 멀티파트 경로 가져오기
	@Override
	public String getImagePath( MultipartFile file) {

		Board board = new Board();
		String img = null;
		if(file.getOriginalFilename()== null || file.getOriginalFilename().equals("")) {
			board.setImage("/resources/upload/citation/sample.png");
		} else {
			String path = "/resources/upload/citation/";
			String realpath = context.getRealPath(path);
			String uid = UUID.randomUUID().toString().split("-")[4];
			String stored = uid+"_"+file.getOriginalFilename();
			File dest = new File(realpath, stored);
			try {
				file.transferTo(dest);
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}			
			img = path+stored;
		}
		
		return img;
	}


	
	// board 테이블 idx 시퀀스 가져오기 
	@Override
	public int getSeqNextval() {
		
		return boardDao.selectSeq();
	}


	
	// 인증글 등록하기
	@Override
	public void setCitation(Board citation) {
		
		boardDao.insertCitation(citation);
	}

	
	
}
