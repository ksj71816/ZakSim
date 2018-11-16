package zaksim.customerCenter.service;

import java.util.List;
import java.util.Map;

import zaksim.dto.QnA;
import zaksim.dto.QnAComment;
import zaksim.dto.ZakSimMember;
import zaksim.util.Paging;

/*
 * 작성일 : 2018.10.18
 * 작성자 : 권미현
 */
/**
 * Q&A 관련 서비스 Interface
 */
public interface QnAService {
	
	/**
	 * Q&A 리스트 조회 service
	 * @return List<QnA>
	 */
	public List<QnA> qnaList(Paging paging);
	/**
	 * Q&A 리스트 조회 - 페이징 service
	 * @return Paging
	 */
	public Paging getPaging(int curPage, int listCount, int pageCount);
	/**
	 * Q&A 리스트 조회 - 답변 service
	 * @return List<QnA>
	 */
	public List<QnA> qnaListDepth();
	
    /* ************ 내 문의보기 ************ */
	/**
	 * Q&A 리스트 조회 service - 내 문의보기
	 * @return List<QnA>
	 */
	public List<QnA> qnaMyList(Map<String, Object> map);
	/**
	 * Q&A 리스트 조회 - 페이징 service - 내 문의보기
	 * @return Paging
	 */
	public Paging getMyPaging(int curPage, int listCount, int pageCount, int memberIdx);
	/**
	 * Q&A 리스트 조회 - 답변 service - 내 문의보기
	 * @return List<QnA>
	 */
	public List<QnA> qnaMyListDepth(int memberIdx);
	/* ************ 내 문의보기 ************ */
	
	/**
	 * Q&A 상세보기 service
	 * @param int qnaIdx
	 * @return QnA
	 */
	public QnA qnaView(int qnaIdx);
	/**
	 * Q&A 상세보기 - 조회수 증가 service
	 * @param int qnaIdx
	 */
	public void qnaViewRead(int qnaIdx);
	
	/**
	 * Q&A 작성 service
	 * @param QnA qnaDto
	 */
	public void qnaWrite(QnA qnaDto);
	/**
	 * Q&A 작성 - Q&A 인덱스 service
	 * @return int
	 */
	public int getQnAIdx();
	/**
	 * Q&A 작성 - 답변 완료 service
	 * @param int upperIdx
	 */
	public void qnaStatus(int upperIdx);
	
	/**
	 * Q&A 수정 service
	 * @param QnA qnaDto
	 */
	public void qnaUpdate(QnA qnaDto);
	
	/**
	 * Q&A 삭제 service
	 * @param int qnaIdx
	 */
	public void qnaDelete(int qnaIdx);
	
	// 댓글 가져오기
	public List<QnAComment> viewComment(int qnaIdx);
	
	// 모든 멤버 정보 가져오기
	public List<ZakSimMember> getAllMember();
	
}
