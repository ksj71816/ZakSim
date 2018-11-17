package zaksim.community.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import zaksim.community.service.CommunityBoardService;
import zaksim.dto.Board;


@Controller 
@RequestMapping(value="/zaksim/community")
public class CommmunityBoardController {

	private static final Logger logger = LoggerFactory.getLogger(CommunityMainController.class);
		@Autowired CommunityBoardService communityBoardService;
	
	// 게시물 등록 POST
	@RequestMapping(value="/enrollBoard", method=RequestMethod.POST)
	public String writeBoard(Board board, MultipartFile imgFile, HttpSession session) {
		
		System.out.println("------------------------------");
		System.out.println(imgFile);
		
		int login_idx = (Integer)session.getAttribute("login_idx");
		
		board.setWriter_idx(login_idx);
		System.out.println(board);
		
		//1. 보드 DB에 등록 
		//3 파일 업로드 
		communityBoardService.insertBoard(board, imgFile);

		return "zaksim/community/enrollCommunity?idx=" + board.getGroup_idx();
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
