package zaksim.challenge.controller;


import java.util.Date;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import zaksim.challenge.service.ChallengeInfoService;
import zaksim.dto.Challenge;

@Controller
@RequestMapping(value="/zaksim/challenge")
public class ChallengeInfo {

	private static final Logger logger = LoggerFactory.getLogger(DoChallenge.class);
	
	@Autowired ChallengeInfoService chalinfosv;
	
	@RequestMapping(value="/challengeInfo", method=RequestMethod.GET)
	public void challengeInfoGet(Model model, HttpSession session) {
		
		Challenge chal = new Challenge();
		
		// memberidx 세션에서 가져오기 
		int idx = (int) session.getAttribute("login_idx");
		
		logger.info("memberIdx : " + idx);
				
//도전 정보 가져오기
		chal=chalinfosv.getChallengeInfo(idx);
		
		model.addAttribute("info",chal);
		
		logger.info("chalInfo model: "+model);
		
		
		
//도전 시작일, 현재일 비교 서비스 
		Date startDate = chal.getStartDate();	
		int colDate=chalinfosv.dateColculation(startDate);
		
		System.out.println(colDate);
		
		// 도전 시작 경과일이 3일 이내일 경우
		if(colDate<4) {
			model.addAttribute("status", "halt");
		
		// 3일이 지났을 경우
		}else {
			model.addAttribute("status", "done");
		}
		
		
//유저 정보 가져오기 (프로필)
		
	
		
		//
		
	}
	
	
	// 도전 포기 : 도전 시작후 3일 이후 취소
	@RequestMapping(value="/discard", method=RequestMethod.GET)
	public String discard(HttpSession session, Model model) {
		
		Challenge chal = new Challenge();
		
		// memberidx 세션에서 가져오기 
		int idx = (int) session.getAttribute("login_idx");
				
		logger.info("memberIdx : " + idx);
						
		//도전 정보 가져오기
		chal=chalinfosv.getChallengeInfo(idx);
		
		
//		model.addAttribute("info",chal);		
//		logger.info("chalInfo model: "+model);
		
		
		// 도전상태, 달성 결과 변경
		
		//도전 상태 ex) ing/done/half(중도포기)
//		private String status;
		chal.setStatus("done");
		
		//달성 결과 ex) success/fail
//		private String result;
		chal.setResult("fail");
		
		//도전 포기 서비스 전달
		chalinfosv.discardChallenge(chal);
		
		
		return "redirect:/zaksim/main/home";
	}
	
	
	
	//도전 중도 취소  : 도전 시작후 3일 이내 취소
	@RequestMapping(value="/cancel", method=RequestMethod.GET)
	public String cancel(HttpSession session, Model model) { 
		
		
		Challenge chal = new Challenge();
		
		// memberidx 세션에서 가져오기 
		int idx = (int) session.getAttribute("login_idx");
				
		logger.info("memberIdx : " + idx);
						
		//도전 정보 가져오기
		chal=chalinfosv.getChallengeInfo(idx);
		
		
//		model.addAttribute("info",chal);		
//		logger.info("chalInfo model: "+model);
		
		
		// 도전상태, 달성 결과 변경
		
		//도전 상태 ex) ing/done/halt(중도포기)
//		private String status;
		chal.setStatus("halt");
		
		//달성 결과 ex) success/fail
//		private String result;
		chal.setResult("fail");
		
		//도전 포기 서비스 전달
		chalinfosv.discardChallenge(chal);
		
		
		
		return "redirect:/zaksim/main/home";
	}
	
	
	
	
}
