package zaksim.community.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import zaksim.community.service.CommunityListService;
import zaksim.dto.CommunityGroup;
import zaksim.dto.GroupLike;
import zaksim.util.Paging;

// 커뮤니티 분류 화면
@Controller
@RequestMapping(value="/zaksim/community")
public class CommunityClassificationController {

	private static final Logger logger = LoggerFactory.getLogger(CommunityMainController.class);
	@Autowired CommunityListService communityListService;
	
	// 가입한 커뮤니티 화면 GET
	@RequestMapping(value="/joinCommunity", method=RequestMethod.GET)
	public void joinCommunity(Model model, HttpSession session) {
		
		String idx = (String)session.getAttribute("login_idx").toString();
		
		
		
		// 가입한 그룹 리스트
		model.addAttribute("joinedGroupList", communityListService.joinedGroupList(Integer.parseInt(idx)));
		// 키워드 리스트
		model.addAttribute("keywordList", communityListService.keywordList());
		
	}
		
		
	// 인기있는 커뮤니티 화면 GET
	@RequestMapping(value="/popularCommunity", method=RequestMethod.GET)
	public void popularCommunity(Model model, HttpSession session, @RequestParam(defaultValue="1", required=false)int curPage) {
		
		int idx=0;
		if(session.getAttribute("login_idx") != null ) {
			idx =(Integer)session.getAttribute("login_idx");
		}
		
		// 키워드 리스트
		model.addAttribute("keywordList", communityListService.keywordList());
		// 카테고리 리스트
		model.addAttribute("categoryList", communityListService.categoryList2());
		//
		model.addAttribute("groupMemberExist", communityListService.existMember(idx));
		
		int totalCount = communityListService.popularCount();
		Paging paging = new Paging(totalCount, curPage, 15);
		
		List<GroupLike> cList = communityListService.popularPage(paging);
		
		// 인기있는 그룹
		model.addAttribute("popularGroupList", cList);
		model.addAttribute("paging", paging);
		
	}
	
	// 새로운 커뮤니티 화면 GET
	@RequestMapping(value="/newCommunity", method=RequestMethod.GET)
	public void newCommunity(Model model, HttpSession session, @RequestParam(defaultValue="1", required=false)int curPage) {

		
		int idx=0;
		if(session.getAttribute("login_idx") != null ) {
			idx =(Integer)session.getAttribute("login_idx");
		}
		
		// 새로운 그룹
//		model.addAttribute("newGroupList", communityListService.newGroupList());	
		// 키워드 리스트
		model.addAttribute("keywordList", communityListService.keywordList());
		//
		model.addAttribute("groupMemberExist", communityListService.existMember(idx));
		
		int totalCount = communityListService.popularCount();
		Paging paging = new Paging(totalCount, curPage, 15);
		
		List<GroupLike> cList = communityListService.newPage(paging);
		
		model.addAttribute("newGroupList", cList);
		model.addAttribute("paging", paging);
		
	}
	
	// 카테고리 화면 GET
	@RequestMapping(value="/categoryCommunity", method=RequestMethod.GET)
	public void category(Model model) {
		model.addAttribute("categoryList", communityListService.categoryList());
	}

//	int idx,
	// 카테고리 클릭 시 검색 화면 GET
   @RequestMapping(value="/clickCategoryCommunity", method=RequestMethod.GET)
	public void clickCategory(Model model,HttpSession session, HttpServletRequest request , @RequestParam(defaultValue="1", required=false)int curPage ) {
		
		int idx=0;
		if(session.getAttribute("login_idx") != null ) {
			idx =(Integer)session.getAttribute("login_idx");
		}
	   
	   String temp = request.getParameter("category_idx");
	   int idx2 = Integer.parseInt(temp);
	   
	   int totalCount = communityListService.categoryTotalCount(idx2);
	   
	   Paging paging = new Paging(totalCount, curPage, 15);
	   
	   Map<String, Object> map = new HashMap<>();
	   

	   
	   
	   map.put("paging",paging);
	   map.put("idx",idx2);
	   
	   List<CommunityGroup> cList = communityListService.categoryPage(map);
	   

		// 키워드 리스트
	   model.addAttribute("category", cList);
		//
		model.addAttribute("groupMemberExist", communityListService.existMember(idx));
	   
		model.addAttribute("keywordList", communityListService.keywordList());
	   
		
		model.addAttribute("map", map);
	   
	   
	}

	
}
