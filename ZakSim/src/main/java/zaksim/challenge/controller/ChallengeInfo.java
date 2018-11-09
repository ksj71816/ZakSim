package zaksim.challenge.controller;

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
		
		
		//유저 정보 가져오기 (프로필)
		
		//
		
	}
	
	
}
