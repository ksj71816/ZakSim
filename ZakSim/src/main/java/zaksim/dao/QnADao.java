package zaksim.dao;

import java.util.List;
import java.util.Map;

import zaksim.dto.QnA;
import zaksim.dto.QnAComment;
import zaksim.util.Paging;

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
	public List<QnA> qnaList(Paging paging);
	/**
	 * Q&A 리스트 조회 - 페이징 dao
	 * @return int
	 */
	public int countAll();
	/**
	 * Q&A 리스트 조회 - 답변 dao
	 * @return List<QnA>
	 */
	public List<QnA> qnaListDepth();
	
    /* ************ 내 문의보기 ************ */
	/**
	 * Q&A 리스트 조회 dao - 내 문의보기
	 * @return List<QnA>
	 */
	public List<QnA> qnaMyList(Map<String, Object> map);
	/**
	 * Q&A 리스트 조회 - 페이징 dao - 내 문의보기
	 * @return int
	 */
	public int countMyAll(int memberIdx);
	/**
	 * Q&A 리스트 조회 - 답변 dao - 내 문의보기
	 * @return List<QnA>
	 */
	public List<QnA> qnaMyListDepth(int memberIdx);
	/* ************ 내 문의보기 ************ */
	
	/**
	 * Q&A 상세보기 dao
	 * @param int qnaidx
	 * @return QnA
	 */
	public QnA qnaView(int qnaIdx);
	/**
	 * Q&A 상세보기 - 조회수 증가 dao
	 * @param int qnaidx
	 */
	public void qnaViewRead(int qnaIdx);
	
	/**
	 * Q&A 작성 dao
	 * @param QnA qnaDto
	 */
	public void qnaWrite(QnA qnaDto);
	/**
	 * Q&A 작성 - 답변 완료 dao
	 * @param int upperIdx
	 */
	public void qnaStatus(int upperIdx);
	
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
