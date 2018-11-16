package zaksim.community.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import zaksim.dto.Board;


@Controller 
@RequestMapping(value="/zaksim/community")
public class CommmunityBoardController {

	private static final Logger logger = LoggerFactory.getLogger(CommunityMainController.class);
//		@Autowired CommunityBoardServiceImpl communityBoardServiceImpl;
	
	// 게시물 등록 POST
	@RequestMapping(value="/writeBoard", method=RequestMethod.POST)
	public ModelAndView writeBoard(Board board) {
		ModelAndView modelAndView = new ModelAndView();
		return modelAndView;
	}
	
	// 게시글 삭제 POST
	@RequestMapping(value="/deleteBoard", method=RequestMethod.POST)
	public ModelAndView deleteBoard(Board board) {
		ModelAndView modelAndView = new ModelAndView();
		return modelAndView;
	}
	
	// 게시글 삭제 POST
	@RequestMapping(value="/updateBoard", method=RequestMethod.POST)
	public ModelAndView updateBoard(Board board) {
		ModelAndView modelAndView = new ModelAndView();
		return modelAndView;
	}
	
	
}
