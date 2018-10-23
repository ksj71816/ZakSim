package zaksim.customerCenter.controller;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import zaksim.customerCenter.service.inter.QnACommentService;
import zaksim.dto.QnAComment;

/*
 * 작성일 : 2018.10.18
 * 작성자 : 권미현
 */
/**
 * QnA 댓글 관련 Controller
 */
@Controller
public class QnACommentController {
	
	@Autowired QnACommentService qnaCommentService;

	// Q&A 댓글 작성
	@RequestMapping(value="/zaksim/customerCenter/QnA/comment_write", method=RequestMethod.POST)
	public void qnaCommentWrite(QnAComment qnaCommentDto, HttpServletResponse response) {
		
	}
	
	// Q&A 댓글 수정
	@RequestMapping(value="/zaksim/customerCenter/QnA/comment_update", method=RequestMethod.POST)
	public void qnaCommentUpdate(QnAComment qnaCommentDto, HttpServletResponse response) {
		
	}

	// Q&A 댓글 삭제
	@RequestMapping(value="/zaksim/customerCenter/QnA/comment_delete", method=RequestMethod.POST)
	public void qnaCommentDelete(@RequestParam int qnaCommentIdx, HttpServletResponse response) {
		
	}
	
}
