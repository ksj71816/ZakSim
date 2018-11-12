package zaksim.community.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.servlet.ModelAndView;

import zaksim.dto.Board;


@Controller 
public class CommmunityBoardController {

	private static final Logger logger = LoggerFactory.getLogger(CommunityMainController.class);
//		@Autowired CommunityBoardServiceImpl communityBoardServiceImpl;
	
	// 게시물 등록 POST
	public ModelAndView enrollmentComment(Board board) {
		ModelAndView modelAndView = new ModelAndView();
		return modelAndView;
	}
	
	// 게시글 삭제 POST
	public ModelAndView deleteComment(Board board) {
		ModelAndView modelAndView = new ModelAndView();
		return modelAndView;
	}
	
}
