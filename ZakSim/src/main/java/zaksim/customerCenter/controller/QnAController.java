package zaksim.customerCenter.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import zaksim.customerCenter.service.QnACommentService;
import zaksim.customerCenter.service.QnAFileService;
import zaksim.customerCenter.service.QnAService;
import zaksim.dto.QnA;
import zaksim.dto.QnAComment;
import zaksim.dto.QnAFile;
import zaksim.dto.ZakSimMember;
import zaksim.util.Paging;

/*
 * 작성일 : 2018.10.18
 * 작성자 : 권미현
 */
/**
 * QnA 관련 Controller
 */
@Controller
public class QnAController {

	private static final Logger logger = LoggerFactory.getLogger(QnAController.class);
	
	@Autowired QnAService qnaService;
	@Autowired QnACommentService qnaCommentService;
	@Autowired QnAFileService qnafileService;
	
	// Q&A 리스트 조회
	@RequestMapping(value="/zaksim/customerCenter/QnA/list", method=RequestMethod.GET)
	public void qnaList(Model model, HttpSession session,
			@RequestParam(defaultValue="1") int curPage,
			@RequestParam(defaultValue="10") int listCount,
			@RequestParam(defaultValue="10") int pageCount) {
		logger.info("현재 페이지 : " + curPage);
		logger.info("한 화면의 총 페이지 : " + pageCount);
		
		Paging paging = qnaService.getPaging(curPage, listCount, pageCount);
		List<QnA> list = qnaService.qnaList(paging);
		List<QnA> listDepth = qnaService.qnaListDepth();

		// Q&A 리스트
/*		logger.info("Q&A 리스트");
		for(QnA qna : list) {
			logger.info(qna.toString());
		}*/
		// Q&A 답변 리스트
/*		logger.info("Q&A 답변 리스트");
		for(QnA qnaDepth : listDepth) {
			logger.info(qnaDepth.toString());
		}*/
		session.setAttribute("curPage", curPage);
		logger.info("[QnAController] curPage session : " + session.getAttribute("curPage"));
		
		model.addAttribute("paging", paging);
		model.addAttribute("qnaList", list);
		model.addAttribute("listDepth", listDepth);
	}
	
	// Q&A 리스트 조회 - 내 문의보기
	@RequestMapping(value="/zaksim/customerCenter/QnA/myList", method=RequestMethod.GET)
	public void qnaMyList(Model model, HttpSession session,
			@RequestParam(defaultValue="1") int curPage,
			@RequestParam(defaultValue="10") int listCount,
			@RequestParam(defaultValue="10") int pageCount,
			@RequestParam int memberIdx) {
		logger.info("현재 페이지 : " + curPage);
		logger.info("한 화면의 총 페이지 : " + pageCount);
		logger.info("memberIdx : " + memberIdx);
		
		Paging paging = qnaService.getMyPaging(curPage, listCount, pageCount, memberIdx);
		
		Map<String, Object> map = new HashMap<>(); // 페이징이랑 멤버 인덱스 넣을 맵
		map.put("paging", paging);
		map.put("memberIdx", memberIdx);
		
		List<QnA> list = qnaService.qnaMyList(map);
		List<QnA> listDepth = qnaService.qnaMyListDepth(memberIdx);
		
		// Q&A 리스트 - 내 문의보기
		logger.info("Q&A 리스트 - 내 문의보기");
		for(QnA qna : list) {
			logger.info(qna.toString());
		}
		// Q&A 답변 리스트
		logger.info("Q&A 답변 리스트 - 내 문의보기");
		for(QnA qnaDepth : listDepth) {
			logger.info(qnaDepth.toString());
		}

		session.setAttribute("curPage", curPage);
		logger.info("[QnAController] curPage session : " + session.getAttribute("curPage"));
		
		model.addAttribute("paging", paging);
		model.addAttribute("qnaList", list);
		model.addAttribute("listDepth", listDepth);
	}
	
	// Q&A 상세보기
	@RequestMapping(value="/zaksim/customerCenter/QnA/view", method=RequestMethod.GET)
	public String qnaView(Model model, @RequestParam int qnaIdx) {
		
		qnaService.qnaViewRead(qnaIdx);
		QnA qna = qnaService.qnaView(qnaIdx);
		List<QnAFile> fileList = qnafileService.qnaFileList(qnaIdx);
		List<QnAComment> commentList = qnaService.viewComment(qnaIdx);
		
		model.addAttribute("view", qna);
		model.addAttribute("fileList", fileList);
		model.addAttribute("commentList", commentList);
		
		return "zaksim/customerCenter/QnA/view";
	}
	
	// Q&A 작성
	@RequestMapping(value="/zaksim/customerCenter/QnA/write", method=RequestMethod.GET)
	public void qnaWritePage(Model model, @RequestParam(defaultValue="0") int upperIdx) {
		
		model.addAttribute("upperIdx", upperIdx);
		
	}
	@RequestMapping(value="/zaksim/customerCenter/QnA/write", method=RequestMethod.POST)
	public String qnaWrite(HttpSession session, QnA qnaDto, MultipartFile file, @RequestParam(defaultValue="0") int upperIdx) {
		
		int qnaIdx = qnaService.getQnAIdx(); // 문의글 인덱스 미리 할당(파일 때문에...)
		
		qnaDto.setIdx(qnaIdx);
		
		if (qnaDto.getSecret() == null) {
			qnaDto.setSecret("public");
		}
		qnaDto.setWriterIdx((int) session.getAttribute("login_idx"));
		
		logger.info("[QnAController] upperIdx : " + upperIdx);
		if (upperIdx != 0) {
			// 답변 글일 경우
			qnaDto.setSecret(qnaService.qnaView(upperIdx).getSecret()); // 공개여부는 문의글과 같게 함.
			qnaDto.setStatus("complete");
			qnaDto.setUpperIdx(upperIdx);
			
			qnaService.qnaStatus(upperIdx);
			
		} else {
			qnaDto.setStatus("ready");
		}
		logger.info("[QnAController] 작성한 문의글(혹은 답변) : " + qnaDto.toString());
		qnaService.qnaWrite(qnaDto);
		
		// ----- 파일 첨부 -----
		logger.info("[QnAController] file : " + file.getOriginalFilename());
		if (file != null && file.getOriginalFilename() != null) { // 파일이 있을 경우
		QnAFile qnaFile = qnafileService.getFilePath(file); // 파일 설정
			// 업로드할 파일이 있을 경우
			qnaFile.setQnaIdx(qnaIdx); // 문의글 인덱스 저장

			logger.info("[QnAController] 작성한 문의글(혹은 답변)의 파일 : " + qnaFile.toString());
			qnafileService.qnaFileUpload(qnaFile); // 파일 업로드
		}
		// -----------------
		
		return "redirect:/zaksim/customerCenter/QnA/list";
	}
	

	// Q&A 수정
	@RequestMapping(value="/zaksim/customerCenter/QnA/update", method=RequestMethod.GET)
	public void qnaUpdatePage(Model model, @RequestParam int qnaIdx) {
		QnA dto = qnaService.qnaView(qnaIdx);
		List<QnAFile> fileList = qnafileService.qnaFileList(qnaIdx);
		
		model.addAttribute("old", dto);
		model.addAttribute("old_fileList", fileList);
		
	}
	@RequestMapping(value="/zaksim/customerCenter/QnA/update", method=RequestMethod.POST)
	public String qnaUpdate(QnA qnaDto, MultipartFile file) {
		
//		logger.info("[QnAController] 수정한 문의글(혹은 답변) : " + qnaDto.toString());
//		
//		qnaService.qnaUpdate(qnaDto);
		
		
		// ----- 파일 첨부 -----
		logger.info("[QnAController] file : " + file.getOriginalFilename());
		if (file != null) {
			if (file.getOriginalFilename() != null && file.getOriginalFilename() != "") {
				// 파일이 있을 경우
				List<QnAFile> fileList = qnafileService.qnaFileList(qnaDto.getIdx());
				QnAFile qnaFile = qnafileService.getFilePath(file); // 파일 설정
				
				for (QnAFile fileIdx : fileList) {
					qnaFile.setIdx(fileIdx.getIdx()); // 원래 파일 인덱스(파일 덮어씌우기 위함)
				}
				qnaFile.setQnaIdx(qnaDto.getIdx());

				logger.info("[QnAController] 수정한 문의글(혹은 답변)의 파일 : " + qnaFile.toString());

				qnafileService.qnaFileUpload(qnaFile);
			}
		}
		// -----------------
		
		return "redirect:/zaksim/customerCenter/QnA/list";
	}
	
	// Q&A 삭제
	@RequestMapping(value="/zaksim/customerCenter/QnA/delete")
	public String qnaDelete(@RequestParam int qnaIdx) {
		
		logger.info("[QnAController] 삭제할 문의글(혹은 답변) 인덱스 : " + qnaIdx);
		qnaService.qnaDelete(qnaIdx);
		
		return "redirect:/zaksim/customerCenter/QnA/list";
	}
	
	// Q&A 첨부파일 다운로드
	@RequestMapping(value="/zaksim/customerCenter/QnA/download")
	public ModelAndView qnaDownload(ModelAndView m, @RequestParam int qnaIdx) {
		
		System.out.println(qnaIdx);
		
		QnAFile downfile = qnaService.download(qnaIdx);
		
		System.out.println(downfile);
		
		m.setViewName("download");
		m.addObject("downFile", downfile);
		
		return m;
	}
	
}
