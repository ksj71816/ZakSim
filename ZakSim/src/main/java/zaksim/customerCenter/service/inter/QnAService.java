package zaksim.customerCenter.service.inter;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import zaksim.dao.inter.QnADao;
import zaksim.dto.QnA;
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
	 * @return List<QnA>
	 */
	public Paging getPaging(int curPage, int listCount, int pageCount);
	
	/**
	 * Q&A 상세보기 service
	 * @param int qnaIdx
	 * @return QnA
	 */
	public QnA qnaView(int qnaIdx);
	
	/**
	 * Q&A 작성 service
	 * @param QnA qnaDto
	 */
	public void qnaWrite(QnA qnaDto);
	
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
	
}
