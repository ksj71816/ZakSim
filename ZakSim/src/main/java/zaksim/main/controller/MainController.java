package zaksim.main.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import zaksim.challenge.service.ChallengeInfoService;
import zaksim.challenge.service.ChallengersService;
import zaksim.community.service.CommunityListService;
import zaksim.dto.Board;
import zaksim.dto.Challenge;
import zaksim.dto.CommunityGroup;
import zaksim.dto.GroupKeyword;

@Controller
@RequestMapping(value="/zaksim/main")
public class MainController {

	private static final Logger logger = LoggerFactory.getLogger(MainController.class);
	
	@Autowired ChallengersService challssv;
	@Autowired ChallengeInfoService chalinfosv;
	@Autowired CommunityListService comssv;
	
	@RequestMapping(value="/home", method=RequestMethod.GET)
	public void main(Model model, HttpSession session) {
		
		// 도전 인증글 리스트 가져오기
		List<Board> citationList = new ArrayList<>();
		citationList=challssv.getCitationList();
		model.addAttribute("citation", citationList);

		// 인기 그룹 리스트 가져오기
		List<CommunityGroup> groupList = new ArrayList<>();
		groupList = comssv.popularGroupList();
		model.addAttribute("popularGroupList",groupList);
		
		// 키워드 리스트 가져오기
		List<GroupKeyword> keywordList = new ArrayList<>();
		keywordList = comssv.keywordList();
		model.addAttribute("keywordList",keywordList);
		
		
		//로그인이 아닐때
		 if(session.getAttribute("login")!=null) {
			 
			 Challenge chal = new Challenge();

				// memberidx 세션에서 가져오기 
				int idx = (int) session.getAttribute("login_idx");
				
				
				logger.info("memberIdx:"+idx);
						
				//도전 정보 가져오기
				chal = chalinfosv.getChallengeInfo(idx);
				
				logger.info("chal : "+chal);
				
				//도전 세션이 없고 도전 정보가 있을때
				if(session.getAttribute("status")==null && chal!=null) {
					
					//도전 상태 세션
					session.setAttribute("status", chal.getStatus());
					logger.info("도전 세션 발생 1번째 조건");

					
					// 도전 세션이 있고 도전 상태가 ing이 아닐때
				}else if(session.getAttribute("status")!=null && chal.getStatus()!="ing") {
					
					//도전 상태 세션
					session.setAttribute("status", chal.getStatus());
					logger.info("도전 세션 발생 2번재 조건");
					
					
				};
				
			
				model.addAttribute("info",chal);
				
				logger.info("chalInfo model: "+model);
		 }
		 
	}
	
	
	
	@RequestMapping(value="/notLogin", method=RequestMethod.GET)
	public void notLogin() {
		
		
	}
	
}
