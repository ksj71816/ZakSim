package zaksim.customerCenter.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import zaksim.dao.QnACommentDao;
import zaksim.dto.QnAComment;

/*
 * 작성일 : 2018.10.18
 * 작성자 : 권미현
 */
/**
 * QnA 댓글 관련 서비스
 */
@Service
public class QnACommentServiceImpl implements QnACommentService {
	
	@Autowired QnACommentDao qnaCommentDao;

	@Override
	public List<QnAComment> qnaCommentList(int qnaIdx) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void qnaCommentWrite(QnAComment qnaCommentDto) {
		qnaCommentDao.qnaCommentWrite(qnaCommentDto);
	}

	@Override
	public void qnaCommentUpdate(QnAComment qnaCommentDto) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void qnaCommentDelete(int qnaCommentIdx) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void qnaReCommentWrite(QnAComment qnaCommentDto) {
		
		// 바로 아래 depth 0의 order 가져오기
		int order = qnaCommentDao.selectUpperOrder(qnaCommentDto);
		
		if(order != 0) {	// 마지막 댓글에 대댓을 다는 경우 외에 order 업데이트
			// 아래 순서 업데이트
			qnaCommentDao.updateOrder(order);			
		}
		// 대댓글 insert
		qnaCommentDto.setOrder(order);
		qnaCommentDao.qnaReCommentWrite(qnaCommentDto);
	}

}
