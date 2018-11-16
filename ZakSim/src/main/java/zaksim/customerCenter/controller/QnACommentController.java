package zaksim.customerCenter.controller;

import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import zaksim.customerCenter.service.QnACommentService;
import zaksim.customerCenter.service.QnAService;
import zaksim.dto.QnA;
import zaksim.dto.QnAComment;
import zaksim.dto.ZakSimMember;

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
	@Autowired QnAService qnaService;
	

	// Q&A depth 0 댓글 작성
	@RequestMapping(value="/zaksim/customerCenter/QnA/comment_write", method=RequestMethod.POST)
	public String qnaCommentWrite(QnAComment qnaCommentDto, HttpSession session, Model model) {
		
		System.out.println("controller Comment : " + qnaCommentDto);

		qnaCommentDto.setWriterIdx((Integer)session.getAttribute("login_idx"));
		
		qnaCommentService.qnaCommentWrite(qnaCommentDto);

		// 화면 연결
		QnA qna = qnaService.qnaView(qnaCommentDto.getQnaIdx());
		List<QnAComment> commentList = qnaService.viewComment(qnaCommentDto.getQnaIdx());
		
		model.addAttribute("view", qna);
		model.addAttribute("commentList", commentList);
		
		return "zaksim/customerCenter/QnA/recommend";
	}
	
	// Q&A 대댓글 작성
	@RequestMapping(value="/zaksim/customerCenter/QnA/re_comment_write", method=RequestMethod.POST)
	public String qnaReCommentWrite(QnAComment qnaCommentDto, HttpSession session, Model model) {

		qnaCommentDto.setWriterIdx((Integer)session.getAttribute("login_idx"));
		
		
		qnaCommentService.qnaReCommentWrite(qnaCommentDto);
		
		// 화면 연결
		QnA qna = qnaService.qnaView(qnaCommentDto.getQnaIdx());
		List<QnAComment> commentList = qnaService.viewComment(qnaCommentDto.getQnaIdx());
		
		model.addAttribute("view", qna);
		model.addAttribute("commentList", commentList);
		
		return "zaksim/customerCenter/QnA/recommend";

	}
	
	// Q&A 댓글 수정
	@RequestMapping(value="/zaksim/customerCenter/QnA/comment_update", method=RequestMethod.POST)
	public String qnaCommentUpdate(QnAComment qnaCommentDto, Model model) {
		
		qnaCommentService.qnaCommentUpdate(qnaCommentDto);
		
		// 화면 연결
		QnA qna = qnaService.qnaView(qnaCommentDto.getQnaIdx());
		List<QnAComment> commentList = qnaService.viewComment(qnaCommentDto.getQnaIdx());
		
		model.addAttribute("view", qna);
		model.addAttribute("commentList", commentList);
		
		return "zaksim/customerCenter/QnA/recommend";
	}

	// Q&A 댓글 삭제
	@RequestMapping(value="/zaksim/customerCenter/QnA/comment_delete", method=RequestMethod.POST)
	public String qnaCommentDelete(int qnaIdx, int order, Model model) {
		
		qnaCommentService.qnaCommentDelete(order);
		
		// 화면 연결
		QnA qna = qnaService.qnaView(qnaIdx);
		List<QnAComment> commentList = qnaService.viewComment(qnaIdx);
		
		model.addAttribute("view", qna);
		model.addAttribute("commentList", commentList);
		
		return "zaksim/customerCenter/QnA/recommend";
	}
	
}
