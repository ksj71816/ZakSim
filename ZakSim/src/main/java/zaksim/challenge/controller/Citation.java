package zaksim.challenge.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import zaksim.challenge.service.ChallengeInfoService;
import zaksim.dto.Challenge;

@Controller
@RequestMapping(value="/zaksim/challenge")
public class Citation {

	private static final Logger logger = LoggerFactory.getLogger(DoChallenge.class);
	
	@Autowired ChallengeInfoService chalinfosv;
	
	
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
	
	@ResponseBody
	@RequestMapping(value="/citation", method=RequestMethod.POST)
	public String citationPost(Model model, @RequestBody Map<String, Object> citation) {
		
		logger.info("citationPOST 활성화");
		logger.info(model.toString());
		logger.info(citation.toString());
		
		
		
		return "redirect:/zaksim/challenge/challengeInfo";
	}
	
	
	
	
	

	
	
	
	
	
	
	
	
}
