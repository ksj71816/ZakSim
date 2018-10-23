package zaksim.customerCenter.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import zaksim.customerCenter.service.inter.QnAService;
import zaksim.dao.inter.QnADao;
import zaksim.dto.QnA;
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

	@Override
	public List<QnA> qnaList(Paging paging) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Paging getPaging(int curPage, int listCount, int pageCount) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public QnA qnaView(int qnaIdx) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void qnaWrite(QnA qnaDto) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void qnaUpdate(QnA qnaDto) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void qnaDelete(int qnaIdx) {
		// TODO Auto-generated method stub
		
	}

}
