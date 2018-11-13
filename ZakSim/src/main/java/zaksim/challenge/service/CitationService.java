package zaksim.challenge.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import zaksim.dto.Board;

public interface CitationService {

	
	// 인증글 이미지 가져오기 - 멀티파트
	public Board getProfilePath(HttpServletRequest request, HttpServletResponse response);
	
	
}
