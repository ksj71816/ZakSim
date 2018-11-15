package zaksim.challenge.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import zaksim.challenge.service.ChallengersService;
import zaksim.community.controller.CommunityMainController;
import zaksim.dto.Board;
import zaksim.util.Paging;

@Controller
@RequestMapping(value="/zaksim/challenge")
public class Challengers {

	private static final Logger logger = LoggerFactory.getLogger(CommunityMainController.class);
	
	@Autowired ChallengersService challssv;
	
	@RequestMapping(value="/challengers", method=RequestMethod.GET)
	public void challengersGet(Model model, HttpSession session, HttpServletRequest request) {
		
		List<Board> list = new ArrayList<>();
		
		// 도전 인증글 전체 가져오기
//		model.addAttribute("totalCitation", challssv.getCitationList());

//		logger.info("전체 도전 인증글 : "+model);
	
		
		
// 페이징 처리
// 준비물 : Paging dto, Paging jsp, Paging totalcount 쿼리(전체 DB cnt), Paging List쿼리 : curPage 매개변수 
		
		// 현재 페이지
		String param = request.getParameter("curPage");
		
		System.out.println("페이징 버튼 : "+param);
		
		// 페이지 카운트 변수
		int curPage = 0;
		
		// null이거나 공백이 아닐때
		if (param != null && !"".equals(param)) {
			curPage = Integer.parseInt(request.getParameter("curPage"));
		}
		
		System.out.println("페이지 카운트 : "+curPage);
		
		
			// 유저 리스트 카운트 값 가져오기
			int ttc = challssv.citationTotalCnt();
			
			//test - 완료
			System.out.println("데이터 토탈 카운트 : "+ttc);
			
		// Paging 계산하기 : 매개변수 3번재 숫자가 조회할 게시물 수
			Paging paging = new Paging(ttc, curPage, 20);
			
			System.out.println("Paging dto: "+paging);
			
			// 유저 리스트 불러오기
			list=challssv.pagingCitationList(paging);
	
			// model에 넣어 전달
			model.addAttribute("paging", paging);	// 페이징 처리된 DTO
			model.addAttribute("citation", list);	// 페이징 리스트
			
			logger.info("페이징  인증글 model : "+model);
		
			
		
		
	}
	
	
	@RequestMapping(value="/challengers", method=RequestMethod.POST)
	public void challengersPost() {
		
		
		
	}
	
}
