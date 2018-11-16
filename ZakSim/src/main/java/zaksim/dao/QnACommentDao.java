package zaksim.dao;

import java.util.List;

import zaksim.dto.QnAComment;

/*
 * 작성일 : 2018.10.18
 * 작성자 : 권미현
 */
/**
 * Q&A 댓글 관련 DAO Interface
 */
public interface QnACommentDao {

	/**
	 * Q&A 댓글 리스트 조회 dao
	 * @param int qnaIdx
	 * @return List<QnAComment>
	 */
	public List<QnAComment> qnaCommentList(int qnaIdx);
	
	/**
	 * Q&A 댓글 작성 dao
	 * @param QnAComment qnaCommentDto
	 */
	public void qnaCommentWrite(QnAComment qnaCommentDto);

	/**
	 * Q&A 댓글 수정 dao
	 * @param QnAComment qnaCommentDto
	 */
	public void qnaCommentUpdate(QnAComment qnaCommentDto);
	
	/**
	 * Q&A 댓글 삭제 dao
	 * @param QnAComment qnaCommentDto
	 */
	public void qnaCommentDelete(int qnaCommentIdx);

	// 댓글 가져오기
	public List<QnAComment> selectComment(int qnaIdx);

	// 대댓글 작성
	public void qnaReCommentWrite(QnAComment qnaCommentDto);

	// 상위 댓글 order 가져오기
	public int selectUpperOrder(QnAComment qnaCommentDto);

	// 대댓글 작성시 order 수정
	public void updateOrder(int order);
	
}
