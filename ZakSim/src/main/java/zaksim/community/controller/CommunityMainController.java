package zaksim.community.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
import zaksim.community.service.CommunitySearchService;
import zaksim.dto.CommunityGroup;
import zaksim.dto.GroupLike;
import zaksim.util.Paging;

// 커뮤니티 메인 화면
@Controller
@RequestMapping(value="/zaksim/community")
public class CommunityMainController {

	private static final Logger logger = LoggerFactory.getLogger(CommunityMainController.class);
	@Autowired CommunityListService communityListService;
	@Autowired CommunitySearchService  communitySearchService;

	
	// 메인 화면 GET
	@RequestMapping(value="/communityMain", method=RequestMethod.GET)
	public void commnunityMain(Model model, HttpSession session ) {
		int idx=0;
		if(session.getAttribute("login_idx") != null ) {
			idx =(Integer)session.getAttribute("login_idx");
		}
		if(idx!=0) {	// 로그인 했을 때
			// 가입한 그룹

			model.addAttribute("joinedGroupList", communityListService.joinedGroupList(idx));
			
		}	// 로그인 안했을 때
		

			// 인기있는 그룹
			model.addAttribute("popularGroupList", communityListService.popularGroupList());
			// 새로운 그룹
			model.addAttribute("newGroupList", communityListService.newGroupList());
			// 카테고리 그룹
			model.addAttribute("categoryList", communityListService.categoryList());
			// 키워드 리스트
			model.addAttribute("keywordList", communityListService.keywordList());
			// 그룹 멤버 여주 확인용 리스트
			model.addAttribute("groupMemberExist", communityListService.existMember(idx));
	}

	
	
	
	// 검색 POST ( 검색결과 return )
	@RequestMapping(value="/searchCommunity", method=RequestMethod.POST)
	public String searchCommunityProcess(Model model, String selectSearch, String searchContent, HttpSession session,
			@RequestParam(defaultValue="1", required=false)int curPage) {
		
		
//		int idx=0;
//		if(session.getAttribute("login_idx") != null ) {
//			idx =(Integer)session.getAttribute("login_idx");
//		}
//	   
//	   String temp = request.getParameter("category_idx");
//	   int idx2 = Integer.parseInt(temp);
//	   
//	   int totalCount = communityListService.categoryTotalCount(idx2);
//	   
//	   Paging paging = new Paging(totalCount, curPage, 3);
//	   
//	   Map<String, Object> map = new HashMap<>();
//	   
//
//	   
//	   
//	   map.put("paging",paging);
//	   map.put("idx",idx2);
//	   
//	   List<CommunityGroup> cList = communityListService.categoryPage(map);
//	   
//
//		// 키워드 리스트
//	   model.addAttribute("category", cList);
//		//
//		model.addAttribute("groupMemberExist", communityListService.existMember(idx));
//	   
//		model.addAttribute("keywordList", communityListService.keywordList());
//	   
//		
//		model.addAttribute("map", map);
		
		int idx=0;
		if(session.getAttribute("login_idx") != null ) {
			idx =(Integer)session.getAttribute("login_idx");
		}


		if(selectSearch.equals("communutyName")) {
			
			int totalCount = communitySearchService.titleTotalCount(searchContent);
			
			
			logger.info("총 갯수  !!!!!!!!!!!!! : " +totalCount);
			
			Paging paging = new Paging(totalCount, curPage, 6);
			
			Map<String, Object> map = new HashMap<>();
			
			map.put("paging", paging);
			map.put("searchContent", searchContent);
			map.put("selectSearch", selectSearch);
			
			List<CommunityGroup> cList = communitySearchService.titlePage(map);
			
			System.out.println("목록 리스트 !! : "+ cList);
			
			model.addAttribute("searchGroup", cList);
//			model.addAttribute("searchGroup", communitySearchService.searchGroup(searchContent));
			model.addAttribute("keywordList", communityListService.keywordList());
			model.addAttribute("selectSearch", selectSearch);
			model.addAttribute("searchContent", searchContent);
			//
			model.addAttribute("groupMemberExist", communityListService.existMember(idx));
			model.addAttribute("map", map);

		} else if(selectSearch.equals("communutyCategory")) {
			model.addAttribute("searchCategoryGroup", communitySearchService.searchCategoryGroup(searchContent));
			model.addAttribute("keywordList", communityListService.keywordList());
			model.addAttribute("selectSearch", selectSearch);
			model.addAttribute("searchContent", searchContent);

		} else {
			model.addAttribute("searchKeywordGroup", communitySearchService.searchKeywordGroup(searchContent));
			model.addAttribute("keywordList", communityListService.keywordList());
			model.addAttribute("selectSearch", selectSearch);
			model.addAttribute("searchContent", searchContent);
		}
		
		return "/zaksim/community/searchCommunity";

	}
	
	// 검색된 화면  GET
	@RequestMapping(value="/searchCommunity", method=RequestMethod.GET)
	public String searchCommnunity(Model model, String selectSearch, String searchContent, HttpSession session,
			@RequestParam(defaultValue="1", required=false)int curPage) { 

		int idx=0;
		if(session.getAttribute("login_idx") != null ) {
			idx =(Integer)session.getAttribute("login_idx");
		}
	
	
		
		System.out.println("DNSAJDNAKJDAJKDAJSKDN : "+ selectSearch);
//		if(selectSearch.equals("communutyName")) {		
			int totalCount = communitySearchService.titleTotalCount(searchContent);		
			Paging paging = new Paging(totalCount, curPage, 15);	
			Map<String, Object> map = new HashMap<>();	
			map.put("paging", paging);
			map.put("searchContent", searchContent);	
			map.put("selectSearch", selectSearch);
			List<CommunityGroup> cList = communitySearchService.titlePage(map);	
			model.addAttribute("searchGroup", cList);
			model.addAttribute("keywordList", communityListService.keywordList());
			model.addAttribute("selectSearch", selectSearch);
			model.addAttribute("searchContent", searchContent);
			//
			model.addAttribute("groupMemberExist", communityListService.existMember(idx));
			model.addAttribute("map", map);
	
//		} else if(selectSearch.equals("communutyCategory")) {
//			int totalCount = communitySearchService.categoryTotalCount(searchContent);
//			Paging paging = new Paging(totalCount, curPage, 15);
//			Map<String, Object> map = new HashMap<>();
//			map.put("paging", paging);
//			map.put("serchContent", searchContent);
//			List<CommunityGroup> cList = communitySearchService.categoryPage(map);
//			model.addAttribute("searchCategoryGroup", communitySearchService.searchCategoryGroup(searchContent));
//			model.addAttribute("keywordList", communityListService.keywordList());
//			model.addAttribute("selectSearch", selectSearch);
//			model.addAttribute("searchContent", searchContent);
//	
//		} else {
//			model.addAttribute("searchKeywordGroup", communitySearchService.searchKeywordGroup(searchContent));
//			model.addAttribute("keywordList", communityListService.keywordList());
//			model.addAttribute("selectSearch", selectSearch);
//			model.addAttribute("searchContent", searchContent);
//		}
		
		return "/zaksim/community/searchCommunity";
//	}

	}
}
