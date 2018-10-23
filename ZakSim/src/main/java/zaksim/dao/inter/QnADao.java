package zaksim.dao.inter;

import java.util.List;

import zaksim.dto.QnA;

/*
 * 작성일 : 2018.10.18
 * 작성자 : 권미현
 */
/**
 * Q&A 관련 DAO Interface
 */
public interface QnADao {

	/**
	 * Q&A 리스트 조회 dao
	 * @return List<QnA>
	 */
	public List<QnA> qnaList();
	/**
	 * Q&A 리스트 조회 - 페이징 dao
	 * @return int
	 */
	public int countAll();
	
	/**
	 * Q&A 상세보기 dao
	 * @param int qnaidx
	 * @return QnA
	 */
	public QnA qnaView(int qnaIdx);
	
	/**
	 * Q&A 작성 dao
	 * @param QnA qnaDto
	 */
	public void qnaWrite(QnA qnaDto);
	
	/**
	 * Q&A 수정 dao
	 * @param QnA qnaDto
	 */
	public void qnaUpdate(QnA qnaDto);
	
	/**
	 * Q&A 삭제 dao
	 * @param int qnaidx
	 */
	public void qnaDelete(int qnaIdx);
	
}
