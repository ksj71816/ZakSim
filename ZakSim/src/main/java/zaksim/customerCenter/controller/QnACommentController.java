package zaksim.customerCenter.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import zaksim.customerCenter.service.QnACommentService;
import zaksim.customerCenter.service.QnAService;
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
	@Autowired QnAService qnaService;
	
	// Q&A depth 0 댓글 작성
	@RequestMapping(value="/zaksim/customerCenter/QnA/comment_list", method=RequestMethod.POST)
	public String viewQnaComment(int qnaIdx, Model model) {

		List<QnAComment> commentList = qnaService.viewComment(qnaIdx);
		
		model.addAttribute("commentList", commentList);
		
		return "/zaksim/customerCenter/QnA/recommend";
		
	}

	// Q&A depth 0 댓글 작성
	@RequestMapping(value="/zaksim/customerCenter/QnA/comment_write", method=RequestMethod.POST)
	public void qnaCommentWrite(QnAComment qnaCommentDto, HttpSession session) {

		qnaCommentDto.setWriterIdx((Integer)session.getAttribute("login_idx"));
		
		qnaCommentService.qnaCommentWrite(qnaCommentDto);
		
//		return "/zaksim/customerCenter/QnA/view?qnaIdx=" + qnaCommentDto.getQnaIdx();

	}
	
	// Q&A 대댓글 작성
	@RequestMapping(value="/zaksim/customerCenter/QnA/re_comment_write", method=RequestMethod.POST)
	public String qnaReCommentWrite(QnAComment qnaCommentDto, HttpSession session) {

		qnaCommentDto.setWriterIdx((Integer)session.getAttribute("login_idx"));
		
		System.out.println("controller Comment : " + qnaCommentDto);
		
//		qnaCommentService.qnaReCommentWrite(qnaCommentDto);
		
		return "/zaksim/customerCenter/QnA/comment_list?qnaIdx=" + qnaCommentDto.getQnaIdx();

	}
	
	// Q&A 댓글 수정
	@RequestMapping(value="/zaksim/customerCenter/QnA/comment_update", method=RequestMethod.POST)
	public void qnaCommentUpdate(QnAComment qnaCommentDto, HttpServletResponse response) {
		
	}

	// Q&A 댓글 삭제
	@RequestMapping(value="/zaksim/customerCenter/QnA/comment_delete", method=RequestMethod.POST, produces="application/json; charset=utf-8")
	@ResponseBody
	public Map<String, String> qnaCommentDelete(@RequestParam int order) {
		
		System.out.println("order : " + order);
		
		Map<String, String> map = new HashMap<>();
		
		return map;
	}
	
}
