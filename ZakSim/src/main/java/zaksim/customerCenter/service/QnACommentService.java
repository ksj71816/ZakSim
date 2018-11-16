package zaksim.customerCenter.service;

import java.util.List;

import zaksim.dto.QnAComment;

/*
 * 작성일 : 2018.10.18
 * 작성자 : 권미현
 */
/**
 * Q&A 댓글 관련 서비스 Interface
 */
public interface QnACommentService {

	/**
	 * Q&A 댓글 리스트 조회 service
	 * @param int qnaIdx
	 * @return List<QnAComment>
	 */
	public List<QnAComment> qnaCommentList(int qnaIdx);
	
	/**
	 * Q&A 댓글 작성 service
	 * @param QnAComment qnaCommentDto
	 */
	public void qnaCommentWrite(QnAComment qnaCommentDto);

	/**
	 * Q&A 댓글 수정 service
	 * @param QnAComment qnaCommentDto
	 */
	public void qnaCommentUpdate(QnAComment qnaCommentDto);
	
	/**
	 * Q&A 댓글 삭제 service
	 * @param QnAComment qnaCommentDto
	 */
	public void qnaCommentDelete(int qnaCommentIdx);

	// 대댓글 작성
	public void qnaReCommentWrite(QnAComment qnaCommentDto);
	
}
