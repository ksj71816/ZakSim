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
import org.springframework.web.bind.annotation.ResponseBody;

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
		
		
		
//도전 시작일, 현재일 비교 
		
		Date startDate = chal.getStartDate();	//도전 시작일
		
		// 현재 날짜
		Date nowDate = new Date();
		System.out.println(nowDate);

		// long type으로 비교
		long diff = nowDate.getTime() - startDate.getTime();
		System.out.println("날짜 비교 long타입 : "+diff);
		
		// 비교후 날짜 차이 환산
		long diffDays = diff / (24 * 60 * 60 * 1000);
		System.out.println("날짜 차이 : " + diffDays);
		
		// 날짜 차이 결과
		int resultDate = (int)diffDays;
		System.out.println("최종결과 : "+resultDate);


		
// 도전 경과 날짜 판별		// 차이에+1 = 도전일 경과 차수
		if(resultDate>=0) {
			resultDate+=1;
			model.addAttribute("byDay", resultDate );	
			model.addAttribute("byDayResult", "go");
		}else{
			model.addAttribute("byDayResult", "ready");
		}
	
	
	
//도전 중도포기, 취소 판별
		// 도전 시작 경과일이 3일 이내일 경우
		if(resultDate<4) {
			model.addAttribute("status", "halt");
		
		// 3일이 지났을 경우
		}else {
			model.addAttribute("status", "done");
		}
		
		
// 인증률 구하기
		Challenge rate =mysv.viewRate(chal.getIdx());
		
		logger.info(rate.toString());
		
		model.addAttribute("rate", rate);


		
// 당일 인증 판별
		int chalIdx=chal.getIdx();	// 도전 idx
//		logger.info("도전 idx"+chal.getIdx());
		
		//인증 날짜
		Board citnew=chalinfosv.getNewCitation(chalIdx);
		logger.info("최신 인증 정보:"+citnew);
		System.out.println(citnew);
//		Date daaa = new Date();
//		long dodo=50483300;
//		daaa.setTime(dodo);
		
		Date writeDate= new Date();
		int citDate= -1;	// 기본값=1 (0=도전인증했을대,-값=대기중일때, +값=도전인증 안했을대)
		
		//인증 정보가 있을때
		if (citnew!=null){
			
			//board 테이블에서 최근 인증 날짜 가져오기
			writeDate=citnew.getWritten_date();
		
		// 날짜 비교 서비스
		citDate=chalinfosv.dateColculation(writeDate);

		//		System.out.println(citDate);
	
		}
		// 인증날짜와 현재시각 비교가 0일때
		if(citDate==0) {	

			// 인증 했을때
			model.addAttribute("setcit", "stop");
			System.out.println("인증 비교 0"+citDate);
			
		}else if(citDate>0) {
			// 도전 대기중 
			model.addAttribute("setcit", "wait");
			System.out.println("인증 비교 w"+citDate);
		}else {
			
			// 인증 안했을때
			model.addAttribute("setcit", "do");
			System.out.println("인증 비교 d"+citDate);
		}

		

	}

	
	
	
	
	
	// 캘린더 연동 이미지 뷰어 - ajax 처리
	@RequestMapping(value="/challengeInfo", method=RequestMethod.POST)
	@ResponseBody
	public Map<String,String> challengeInfoPost(String date, HttpSession session){
		
//		캘린더에서 선택된 날짜
//		System.out.println(date);
//		 2018/11/17
		
//		로그인 세션 idx
		int idx=(int)session.getAttribute("login_idx");
		Map<String, String> infomap = new HashMap<>();
		
		
		infomap.put("day", date);
		infomap.put("idx", String.valueOf(idx));
		
		
		// 날짜, 회원 idx로 인증글 정보 가져오기
		Board citation=chalinfosv.dayCitation(infomap);
		

		// 도전 정보가 일을때만 실행
		if(citation!=null) {
		System.out.println( "조건문 실행됨");
			// 맵에 값 넣기
		infomap.put("title", citation.getTitle());		// 도전명
		infomap.put("content", citation.getContent()); // 내용
		infomap.put("image", citation.getImage());		// 이미지 경로
		infomap.put("open", String.valueOf(citation.getOpen()));	// 공개, 비공개
		
		infomap.put("result","success");
		logger.info(infomap.toString());
		
		return infomap;
		}else{
			
//			도전 정도 없으면 null
			infomap.put("result","fail");
			logger.info(infomap.toString());
			return infomap;
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
