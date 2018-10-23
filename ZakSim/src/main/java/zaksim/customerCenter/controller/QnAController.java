package zaksim.customerCenter.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import zaksim.customerCenter.service.inter.QnACommentService;
import zaksim.customerCenter.service.inter.QnAFileService;
import zaksim.customerCenter.service.inter.QnAService;
import zaksim.dto.QnA;

/*
 * 작성일 : 2018.10.18
 * 작성자 : 권미현
 */
/**
 * QnA 관련 Controller
 */
@Controller
public class QnAController {

	@Autowired QnAService qnaService;
	@Autowired QnACommentService qnaCommentService;
	@Autowired QnAFileService qnafileService;
	
	// Q&A 리스트 조회
	@RequestMapping(value="/zaksim/customerCenter/QnA/list", method=RequestMethod.GET)
	public void qnaList(Model model,
			@RequestParam(defaultValue="1") int curPage,
			@RequestParam(defaultValue="10") int listCount,
			@RequestParam(defaultValue="10") int pageCount) {
		
	}
	
	// Q&A 상세보기
	@RequestMapping(value="/zaksim/customerCenter/QnA/view", method=RequestMethod.GET)
	public String qnaView(Model model, @RequestParam int qnaIdx) {
		return "zaksim/customerCenter/QnA/view";
	}
	
	// Q&A 작성
	@RequestMapping(value="/zaksim/customerCenter/QnA/write", method=RequestMethod.GET)
	public void qnaWritePage() {
		
	}
	@RequestMapping(value="/zaksim/customerCenter/QnA/write", method=RequestMethod.POST)
	public String qnaWrite(QnA qnaDto) {
		return "redirect:/zaksim/customerCenter/QnA/list";
	}
	

	// Q&A 수정
	@RequestMapping(value="/zaksim/customerCenter/QnA/update", method=RequestMethod.GET)
	public void qnaUpdatePage(Model model, @RequestParam int qnaIdx) {
		
	}
	@RequestMapping(value="/zaksim/customerCenter/QnA/update", method=RequestMethod.POST)
	public String qnaUpdate(QnA qnaDto) {
		return "redirect:/zaksim/customerCenter/QnA/list";
	}
	
	// Q&A 삭제
	@RequestMapping(value="/zaksim/customerCenter/QnA/delete", method=RequestMethod.POST)
	public String qnaDelete(@RequestParam int qnaIdx) {
		return "redirect:/zaksim/customerCenter/QnA/list";
	}
	
}
