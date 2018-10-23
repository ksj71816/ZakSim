package zaksim.customerCenter.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import zaksim.customerCenter.service.inter.QnACommentService;
import zaksim.dao.inter.QnACommentDao;
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
		// TODO Auto-generated method stub
		
	}

	@Override
	public void qnaCommentUpdate(QnAComment qnaCommentDto) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void qnaCommentDelete(int qnaCommentIdx) {
		// TODO Auto-generated method stub
		
	}

}
