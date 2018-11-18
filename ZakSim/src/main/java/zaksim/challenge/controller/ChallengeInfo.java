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
		
		Challenge chal = new Challenge();	//도전정보 dto
		
		// memberidx 세션에서 가져오기 
		int idx = (int) session.getAttribute("login_idx");
		
//		logger.info("memberIdx : " + idx);
				
//도전 정보 가져오기
		chal=chalinfosv.getChallengeInfo(idx);
		
		model.addAttribute("info",chal);
		
//		logger.info("chalInfo model: "+model);
		
		
		
//도전 시작일, 현재일 비교  (도전 취소, 도전 중도포기)
		
		Date startDate = chal.getStartDate();	//도전 시작일
		
		Date nowDate = new Date();				// 현재 날짜

//		System.out.println(nowDate);

		// long type으로 비교
		long diff = nowDate.getTime() - startDate.getTime();
//		System.out.println("날짜 비교 long타입 : "+diff);
		
		// 비교후 날짜 차이 환산
		long diffDays = diff / (24 * 60 * 60 * 1000);
//		System.out.println("날짜 차이 : " + diffDays);
		
		// 날짜 차이 결과
		int resultDate = (int)diffDays;
//		System.out.println("최종결과 : "+resultDate);


		
// 도전 경과 날짜 계산		// 차이에+1 = 도전일 경과 차수
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
		
//-------------------------------------------------------		
		
		
// 인증률 구하기
		Challenge rate =mysv.viewRate(chal.getIdx());
		
//		logger.info(rate.toString());
		
		model.addAttribute("rate", rate);


//-------------------------------------------------------------
		
		
// 인증 페이지 접근 판별 (대기중,당일인증o,당일인증x,최초인증)
		
		int chalIdx=chal.getIdx();	// 도전 idx

		//최근 인증 날짜
		Board citnew=chalinfosv.getNewCitation(chalIdx);

//		System.out.println(citnew);

		
		Date writeDate= new Date();// 날짜 비교 서비스 매개변수
		
		int citDate=0;	// 인증값 (0=당일인증,  0> 미인증)	// 비교값= 최근 인증날짜
		int chalDate=0; // 도전시작값 (0<= 도전자, 0> 대기자) // 비교값= 도전 시작날짜
		
		// 도전자 or 대기자 판별
		//인증 정보가 있을때 =board가 null이 아닐때		//null이면 에러
		if (citnew!=null){
			
//			System.out.println("인증 정보 있음");
			
			//board 테이블에서 최근 인증 날짜 가져오기
			writeDate=citnew.getWritten_date();
		
			// 날짜 비교 서비스 - 현재날짜와 최근 인증 날짜 비교
			citDate=chalinfosv.dateColculation(writeDate);

			//당일 인증자 or 미인증자 판별
			if(citDate==0) {		//당일 인증자
			
//				System.out.println("당일 인증자");
			
				// 도전자- 당일인증자 (인증 페이지 접근x)
				model.addAttribute("setcit", "stop");
//				System.out.println("인증 비교 0 : "+citDate);
				
			}else if(citDate>0) {	//당일 미인증자
			
//				System.out.println("당일 미인증자");
			
				// 도전자-미인증자,최초인증자 (인증 페이지 접근ok)
				model.addAttribute("setcit", "do");
//				System.out.println("인증 비교 + : "+citDate);
			}
				
				
				
		}else {		// 도전대기자 or 최초 인증자
//			
//			System.out.println("인증 정보 없음");
//			
//			
//			System.out.println("도전 시작일 : "+startDate);
			
			
			// 날짜 비교 - 현재 날짜와 도전 시작일 비교 ( 0> : 대기자, 0=< 최초인증자)
			chalDate=chalinfosv.dateColculation(startDate);
			
			if(chalDate>=0) {
			
//				System.out.println("도전 대기자");
			
				// 도전 대기자 (인증 페이지 접근x)
				model.addAttribute("setcit", "do");
				
			}else{
				
//				System.out.println("최초 인증 대상자");
				
				// 도전자-미인증자,최초인증자 (인증 페이지 접근ok)
				model.addAttribute("setcit", "do");
//				System.out.println("인증 비교 + : "+citDate);
			}
			
			
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
		infomap.put("image", citation.getStoredName());		// 이미지 경로
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
