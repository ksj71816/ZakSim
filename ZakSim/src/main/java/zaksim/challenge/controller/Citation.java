package zaksim.challenge.controller;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import zaksim.challenge.service.ChallengeInfoService;
import zaksim.challenge.service.CitationService;
import zaksim.dto.Board;
import zaksim.dto.Challenge;

@Controller
@RequestMapping(value="/zaksim/challenge")
public class Citation {

	private static final Logger logger = LoggerFactory.getLogger(DoChallenge.class);
	
	@Autowired ChallengeInfoService chalinfosv;
	@Autowired CitationService citationsv;
	
	
	
	@RequestMapping(value="/citation", method=RequestMethod.GET)
	public void citationGet(Model model, HttpSession session) {
	
		Challenge chal = new Challenge();
		
		// memberidx 세션에서 가져오기 
		int idx = (int) session.getAttribute("login_idx");
		
		logger.info("memberIdx : " + idx);
				
		//도전 정보 가져오기
		chal=chalinfosv.getChallengeInfo(idx);
		
		model.addAttribute("info",chal);
		
		logger.info("chalInfo model: "+model);
		
		
		
		
	}
	
	/*@ResponseBody
	@RequestMapping(value="/citation", method=RequestMethod.POST)
	public String citationPost(Model model, @RequestBody Map<String, Object> citation, Board board,
			String image,String image2, String content) {
		
		logger.info("citationPOST 활성화");
		logger.info(model.toString());
		logger.info(board.toString());
		logger.info(citation.toString());
		System.out.println(image);
		System.out.println(image2);
		System.out.println(content);
		
		return "redirect:/zaksim/challenge/challengeInfo";
	}
	*/
	
	// 개인도전 인증 하기
	@RequestMapping(value="/citation", method=RequestMethod.POST)
	public String citationPost(Model model, Board board, HttpSession session, MultipartFile fileselect) {
		
		logger.info("citationPOST 활성화");
		logger.info(board.toString());
		logger.info(fileselect.toString());
		
		Board citation = new Board();
		
		System.out.println("==============================");
		System.out.println(board);
		
		// 멀티파트 이미지 파일 경로 처리
		citationsv.getImagePath(fileselect);
		logger.info("이미지 경로 확인 : "+citationsv.getImagePath(fileselect));
		
		citation.setImage(fileselect.getOriginalFilename());
		citation.setStoredName(citationsv.getImagePath(fileselect));
		
		// 인증 시퀀스 가져오기
		int idx=citationsv.getSeqNextval();
		System.out.println("idx : "+idx);
		
		citation.setIdx(idx);
		
		// 작성자 인덱스
		int writerIdx=(int)session.getAttribute("login_idx");
		System.out.println("작성자idx : "+writerIdx);
		
		citation.setWriter_idx(writerIdx);
		
		
		// 도전 정보 조회
		Challenge chal=chalinfosv.getChallengeInfo(writerIdx);
		logger.info(chal.toString());
		
		
		
		// 도전명
		String title=chal.getTitle();
		
		citation.setTitle(title);
		
		// 개인 도전 인덱스
		int challengeIdx=chal.getIdx();
		
		citation.setChallenge_idx(challengeIdx);
		
		
		// 작성일 = dao에서 sysdate 처리
		
		
		// 인증 텍스트
		String content = board.getContent();
		
		citation.setContent(content);
		
		// 공개 비공개 처리	// 공개 : 1 , 비공개 = 0
		int open = board.getOpen();
		System.out.println("공개 여부확인"+open);
		
		citation.setOpen(open);
		
		// 인증글 여부 : 1=인증글
		citation.setCertification(1);

		logger.info("인증글 : "+citation);
		
		// 조회수 : 최초등록 =0
		citation.setHit(0);
		
		// 등록 요청
		citationsv.setCitation(citation);
		
		
		
		return "/zaksim/challenge/result/citationSuccess";
	}
	
	
	

	
	@RequestMapping(value="/result/citationSuccess", method=RequestMethod.GET)
	public void citationSuccess() {
		
	}
	
	
	
	
	
}
