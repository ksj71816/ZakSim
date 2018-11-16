package zaksim.customerCenter.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import zaksim.dao.QnACommentDao;
import zaksim.dao.QnADao;
import zaksim.dto.QnA;
import zaksim.dto.QnAComment;
import zaksim.util.Paging;

/*
 * 작성일 : 2018.10.18
 * 작성자 : 권미현
 */
/**
 * QnA 관련 서비스
 */
@Service
public class QnAServiceImpl implements QnAService {
	
	@Autowired QnADao qnaDao;
	@Autowired QnACommentDao qCommentDao;

	@Override
	public List<QnA> qnaList(Paging paging) {
		return qnaDao.qnaList(paging);
	}

	@Override
	public Paging getPaging(int curPage, int listCount, int pageCount) {
		int totalCount = qnaDao.countAll();
		
		Paging paging = new Paging(totalCount, curPage, listCount, pageCount);
		
		return paging;
	}
	
	@Override
	public List<QnA> qnaListDepth() {
		return qnaDao.qnaListDepth();
	}
	
	@Override
	public List<QnA> qnaMyList(Map<String, Object> map) {
		return qnaDao.qnaMyList(map);
	}

	@Override
	public Paging getMyPaging(int curPage, int listCount, int pageCount, int memberIdx) {
		int totalMyCount = qnaDao.countMyAll(memberIdx);
		
		Paging paging = new Paging(totalMyCount, curPage, listCount, pageCount);
		
		return paging;
	}

	@Override
	public List<QnA> qnaMyListDepth(int memberIdx) {
		return qnaDao.qnaMyListDepth(memberIdx);
	}

	@Override
	public QnA qnaView(int qnaIdx) {
		return qnaDao.qnaView(qnaIdx);
	}
	
	@Override
	public void qnaViewRead(int qnaIdx) {
		qnaDao.qnaViewRead(qnaIdx);
	}

	@Override
	public void qnaWrite(QnA qnaDto) {
		qnaDao.qnaWrite(qnaDto);
	}
	
	@Override
	public void qnaStatus(int upperIdx) {
		qnaDao.qnaStatus(upperIdx);
	}

	@Override
	public void qnaUpdate(QnA qnaDto) {
		qnaDao.qnaUpdate(qnaDto);
	}

	@Override
	public void qnaDelete(int qnaIdx) {
		qnaDao.qnaDelete(qnaIdx);
	}

	@Override
	public List<QnAComment> viewComment(int qnaIdx) {
		return qCommentDao.selectComment(qnaIdx);
	}
}
