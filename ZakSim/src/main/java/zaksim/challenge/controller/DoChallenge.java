package zaksim.challenge.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import zaksim.challenge.service.DoChallengeService;
import zaksim.dto.Challenge;
import zaksim.dto.Payment;
import zaksim.dto.ZakSimMember;

@Controller
@RequestMapping(value="/zaksim/challenge")
public class DoChallenge {

	private static final Logger logger = LoggerFactory.getLogger(DoChallenge.class);
	
	@Autowired DoChallengeService dochalsv;
	
	// 도전하기 - view 띄우기
	@RequestMapping(value="/doChallenge", method=RequestMethod.GET)
	public void doChallengeGet(Model model,HttpSession session) {
		
		
		ZakSimMember user = new ZakSimMember();
	
		String id = (String) session.getAttribute("login_id");
		
		user.setId( id);
		
		// 유저 조회
		user=dochalsv.userInfo(user);
		
		
		
		model.addAttribute("user",user);
	
		
		logger.info("유저 모델 : "+model);
		
		
		
	}

	
	// 도전금 결제 - 도전정보 전달
	@RequestMapping(value="/priceChallenge", method=RequestMethod.GET)
	public String priceChallengeGet(Model model,Challenge chal) {
		
		
		logger.info("price Get 활성화");
		logger.info("도전정보 : "+chal);
		
		//form에서 입력받은 도전명,시작일,종료일 정보 전달
		model.addAttribute("info", chal);

		
		return "/zaksim/challenge/include/priceInclude";
	}
	
	
	
	// 도전 정보 DB 전송
	@RequestMapping(value="/priceChallenge", method=RequestMethod.POST)
	public String priceChallengePost(Model model, Payment payment, String title, String startDate, String endDate
			, String name, String email, String phone , HttpSession session
			) {
		//객체 생성
		DoChallenge dc = new DoChallenge();
		
		// 도전 객체
		Challenge chal =  new Challenge();
		// 결제 객체 = 매개변수로 받아옴!
		// 유저 객체
		ZakSimMember user = new ZakSimMember();
		
		//테스트
		logger.info("price POST 활성화");
		System.out.println("도전 정보 : " + title + ", " + startDate + ", " + endDate);
		System.out.println("payment :" + payment);
		System.out.println("회원 정보 : " + name + ", " + email + ", " + phone);
		logger.info("pricePost Model: " + model);
		
		
	// 도전 시작, 종료일 String->Date 타입 parse
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		
		try {
			Date sDate = format.parse(startDate);
			Date eDate = format.parse(endDate);
			
			System.out.println(sDate);
			System.out.println(eDate);
			
			
			
		} catch (ParseException e) {
			System.out.println("priceChallengePost: Date parse 실패!");
			e.printStackTrace();
		}
	
	// 유저 정보 조회  (memberIdx 가져오기)
		String id = (String) session.getAttribute("login_id");
		user.setId( id);
		// 유저 조회 서비스 요청
		user=dochalsv.userInfo(user);
	
		// idx값 가져오기
		int useridx=user.getIdx();
		
		
		// 도전 정보 값 객체에 넣기
		chal.setMemberIdx(useridx);	// 유저 idx
		try {
			
			chal.setStartDate(format.parse(startDate));	//도전 시작일
			chal.setEndDate(format.parse(endDate));		//도전 종료일
		} catch (ParseException e) {
			
			e.printStackTrace();
		}
		chal.setMoney(payment.getPrice()); // 도전금
		chal.setTitle(title);	//도전명
		chal.setStatus("ing");	//도전 상태  ing(시작)/done(종료)/halt(포기)
		
		
		
		
		/* 값 확인 > 서비스 전달 > challenge_seq.nextval 값 받기 > challenge 객체에 set idx 
		 * 
		 * > challenge 매개변수로 daoImpl 로 전달해서 insert
		 * 
		 * > payment 객체에 set challenge idx > Payment daoImpl로 전달해서 insert > 확인
		 * */
		
		// 시퀀스 값 받기
		int seq=dochalsv.getSeqNextval();	
//		System.out.println(seq); //테스트-완
		chal.setIdx(seq); // 도전 idx
		payment.setChallengeIdx(seq); // 결제 idx
		
		logger.info("도전 데이터"+chal);// 테스트 -완
		logger.info("결제 데이터"+payment);
		
		
		// 도전 insert
		dochalsv.setCahllengeInfo(chal);
		
		// 결제 insert
		dochalsv.setPayment(payment);
		
		
		return dc.endChallengeGet();
	}
	

	
	// 도전 안내사항
	@RequestMapping(value="/endChallenge", method=RequestMethod.GET)
	public String endChallengeGet() {
		
		
		return "/zaksim/challenge/include/endInclude";
	}
	
	

	
}
