package zaksim.challenge.controller;


import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import zaksim.challenge.service.ChallengeInfoService;
import zaksim.dto.Board;
import zaksim.dto.Challenge;
import zaksim.mypage.service.MypageService;

@Controller
@RequestMapping(value="/zaksim/challenge")
public class ChallengeInfo {

private static final Logger logger = LoggerFactory.getLogger(DoChallenge.class);
	
	@Autowired ChallengeInfoService chalinfosv;
	@Autowired MypageService mysv;
	
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
		
		
// 인증률 구하기
		Challenge rate =mysv.viewRate(chal.getIdx());
		
		logger.info(rate.toString());
		
		model.addAttribute("rate", rate);
	}
	
	// 캘린더 연동 이미지 뷰어 - ajax 처리
	@RequestMapping(value="/challengeInfo", method=RequestMethod.POST)
	public Map<String,String> challengeInfoPost(String date, HttpSession session){
		
//		캘린더에서 선택된 날짜
		System.out.println(date);
//		 2018/11/17
		
//		로그인 세션 idx
		int idx=(int)session.getAttribute("login_idx");
		Map<String, String> info = new HashMap<>();
		
		
		info.put("day", date);
		info.put("idx", String.valueOf(idx));
		
		
		// 날짜, 회원 idx로 인증글 정보 가져오기
		Board citation=chalinfosv.dayCitation(info);
		
		System.out.println(citation.getIdx());
		
		// 도전 정보가 일을때만 실행
		if(citation.getTitle()!=null) {
		System.out.println( "조건문 실행됨");
			// 맵에 값 넣기
		info.put("title", citation.getTitle());		// 도전명
		info.put("content", citation.getContent()); // 내용
		info.put("image", citation.getImage());		// 이미지 경로
		info.put("open", String.valueOf(citation.getOpen()));	// 공개, 비공개
		
		info.put("result","success");
		logger.info(info.toString());
		
		return info;
		}else{
			
//			도전 정도 없으면 null
			info.put("result","fail");
			return info;
		}
		
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
