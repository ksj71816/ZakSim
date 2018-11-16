package zaksim.community.controller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

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
	@Autowired ServletContext context;

	// 게시물 등록 POST
	@RequestMapping(value="/enrollBoard", method=RequestMethod.POST)
	public String writeBoard(Board board, MultipartFile file, HttpSession session) {


		int login_idx = (Integer)session.getAttribute("login_idx");

			
		board.setWriter_idx(login_idx);


		String path = "/resources/upload/community/";
		String realpath = context.getRealPath(path);
		String uid = UUID.randomUUID().toString().split("-")[4];
		String stored = uid+"_"+file.getOriginalFilename();
		File dest = new File(realpath, stored);
		try {
			file.transferTo(dest);
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}			
		board.setImage("/resources/upload/community/"+stored);
		
		System.out.println("/resources/upload/community/"+stored);
		
		
		communityBoardService.insertBoard(board);

		//1. 보드 DB에 등록 
		//2 보드정보 가져옴
		//		Board bd = communityBoardService.insertBoard(board);

		//3 파일 업로드 
		//		communityBoardService.uploadFile(bd, imgFile);

		// 결과 map에 담아 리턴
		//		map.put("result", 1);

		return "redirect:/zaksim/community/enrollCommunity?idx="+board.getGroup_idx();
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
