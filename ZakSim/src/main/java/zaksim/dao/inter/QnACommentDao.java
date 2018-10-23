package zaksim.dao.inter;

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
	
}
