package zaksim.challenge.service;

import org.springframework.web.multipart.MultipartFile;

import zaksim.dto.Board;

public interface CitationService {

	
	// 인증글 이미지 가져오기 - 멀티파트
	public String getImagePath( MultipartFile file);
	
	// board 테이블 idx 시퀀스 가져오기
	public int getSeqNextval();
	
	// 인증글 등록하기
	public void setCitation(Board citation);
	
}
