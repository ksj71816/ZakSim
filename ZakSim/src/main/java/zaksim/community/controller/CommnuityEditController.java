package zaksim.community.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import zaksim.community.service.CommunityEditService;
import zaksim.community.service.CommunityListService;
import zaksim.dao.CommunityEditDAO;
import zaksim.dto.CommunityCategory;
import zaksim.dto.CommunityGroup;
import zaksim.dto.GroupKeyword;
import zaksim.dto.GroupLike;
import zaksim.dto.GroupMember;

// 커뮤니티 편집
@Controller
@RequestMapping(value="/zaksim/community")
public class CommnuityEditController {

	private static final Logger logger = LoggerFactory.getLogger(CommunityMainController.class);
	@Autowired CommunityListService communityListService; 
	@Autowired CommunityEditService communityEditService;
	@Autowired ServletContext context;

	// 커뮤니티 만들기 POST
	@RequestMapping(value="/createCommunity", method=RequestMethod.POST)
	public String createCommnunityProcess(CommunityGroup communityGroup, MultipartFile file, 
																GroupKeyword groupKeyword, HttpSession session) {
		
		if(file.getOriginalFilename()== null || file.getOriginalFilename().equals("")) {
			communityGroup.setImage("/resources/image/community/sample.png");
			communityGroup.setStoredName("/resources/image/community/sample.png");
		} else {
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
			communityGroup.setImage(file.getOriginalFilename());
			communityGroup.setStoredName("/resources/upload/community/"+stored);
		}

		// 회원 인덱스 가져오기
		String login_idx  = (String)session.getAttribute("login_idx").toString();
		
		// 카테고리 가져오기
		communityEditService.getCategoryIdx(communityGroup.getCategory_idx());

		communityGroup.setCategory_idx(communityEditService.getCategoryIdx(communityGroup.getCategory_idx()));
		communityGroup.setMember_idx(Integer.parseInt(login_idx));
		
		
		// 커뮤니티 그룹 생성	
		int group_idx = communityEditService.createGroup(communityGroup);
		
		System.out.println("커뮤니티 그룹 생성 : "+ communityGroup);
		
		// 키워드 가져오기
		String keyword1 = groupKeyword.getKeyword();
		
		// 커뮤니티그룹 인덱스 가져오기
		groupKeyword.setGroup_idx(group_idx);
		

		String[] keywordArray = keyword1.split("#");
		

		// 키워드 저장
		for(int i=1; i<keywordArray.length; i++) {
			groupKeyword.setKeyword(keywordArray[i]);
			communityEditService.createKeyword(groupKeyword);
		}
		
		// 그룹 맴버에 맴버 생성
		 GroupMember groupMember= new GroupMember();
		 
		 System.out.println("그룹 인덱스 : "+ communityGroup.getIdx());
		 System.out.println("회원 인덱스 : "+ login_idx);
		
		 groupMember.setGroup_idx(communityGroup.getIdx());
		groupMember.setMember_idx(Integer.parseInt(login_idx));
		
		
		communityEditService.addMember(groupMember);
		
		
		String result = "redirect:/zaksim/community/communityMain";
		return result;
	}

	
	
	// 커뮤니티 정보 수정 POST
	@RequestMapping(value="/updateCommunity", method=RequestMethod.POST)
	public String updateCommnunityProcess(CommunityGroup communityGroup, MultipartFile file, String keyword, 
			HttpSession session) {
	
		/*
		 *  키워드 수정
		 */
		
		// 1. 키워드 삭제
		communityEditService.deleteKeyword(communityGroup.getIdx());
		
		// 2. 입력받은 키워드 불러오기
		String[] keywordArray = keyword.split("#");
		GroupKeyword g = new GroupKeyword();

		// 3. 키워드 저장
		for(int i=1; i<keywordArray.length; i++) {
			g.setGroup_idx(communityGroup.getIdx());
			g.setKeyword(keywordArray[i]);
			communityEditService.createKeyword(g);
		}
		
		
		

		/*
		 * 커뮤니티 그룹 수정
		 */
		

		// 회원 인덱스 가져오기
		String login_idx  = (String)session.getAttribute("login_idx").toString();
		
//		communityGroup.setMember_idx(10);
		communityGroup.setIdx(communityGroup.getIdx());
		communityGroup.setMember_idx(Integer.parseInt(login_idx));
//		

		// 이미지 가져옴
		if(file.getOriginalFilename()== null || file.getOriginalFilename().equals("")) {
			communityGroup.setImage(communityGroup.getImage());
		} else {
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
			communityGroup.setImage("/resources/upload/community/"+stored);
		}
		
		
//		System.out.println("11111111111111111111111 : "+ communityGroup);

		
//		CommunityGroup [currval=0, idx=38, member_idx=0, category_idx=3, title=111, content=123, 
//		image=/resources/upload/community/088df4f6ef11_자물쇠.png, max=12, open_date=null, secret=1, 4
//		password=33, communityCategory=null]
		
		communityEditService.updateGroup(communityGroup);
		
		
		
		String result = "redirect:/zaksim/community/enrollCommunity?idx="+communityGroup.getIdx();
		return result;


	}
	
	// 커뮤니티 수정 비밀번호 일치여부
	@RequestMapping(value = "/confirmPassword", method = RequestMethod.POST)
	@ResponseBody
	public ModelAndView confirmPasswordProcess(HttpServletResponse response, HttpServletRequest request) {
		
		response.setContentType("application/json; charset=utf-8");
		
//		String idx = request.getParameter("idx");
		
//		System.out.println("인덱스!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! : "+idx);
		
		ModelAndView mav = new ModelAndView();
		
//		communityListService.info(idx);
		
		mav.setViewName("jsonView");
		mav.addObject("result", "ㅇㅇㅇㅇ");

		
		return mav;
	}

	
	// 커뮤니티 삭제 GET
	@RequestMapping(value="/deleteCommunity", method=RequestMethod.GET)
	public String deleteCommnunityProcess(String idx, HttpSession session) {
		
		int newIdx = Integer.parseInt(idx);
		
		// 그룹맴버 삭제
//		communityEditService.deleteGroupMember(newIdx);
		// 키워드 삭제
		communityEditService.deleteKeyword(newIdx);
		// 그룹 삭제
		communityEditService.deleteGroup(newIdx);

		return "redirect:/zaksim/community/communityMain";
		

	}
	
	
	// 커뮤니티 좋아요
	@RequestMapping(value ="/recommend", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, GroupLike> recommend(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		
		response.setContentType("application/json; charset=utf-8");
		
		Map<String, GroupLike> map = new HashMap<>();
		
		
		String temp1 = request.getParameter("idx");
		String temp2 = (String)session.getAttribute("login_idx").toString();
		
		
		int idx = Integer.parseInt(temp1);
		int login_idx =Integer.parseInt(temp2);
		
		GroupLike groupLike = new GroupLike();
		
		// 객체에 저장
		groupLike.setGroup_idx(idx);
		groupLike.setMember_idx(login_idx);
		
		// GroupLike Insert
		communityEditService.likeGroup(groupLike);
		
		// 좋아요 갯수
		map.put("groupLike", communityListService.groupLike(idx));
		
		
		return map;
		
	}
	
	// ㅋ ㅓ뮤니티 좋아요 취소
	@RequestMapping(value="/noRecommend", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, GroupLike> noRecommend(HttpServletRequest request, HttpServletResponse response, HttpSession session){
	
		
		response.setContentType("application/json; charset=utf-8");
		
		Map<String, GroupLike> map = new HashMap<>();
		
		String temp1 = request.getParameter("idx");
		String temp2 = (String)session.getAttribute("login_idx").toString();
		
		int idx = Integer.parseInt(temp1);
		int login_idx =Integer.parseInt(temp2);
		
		GroupLike groupLike = new GroupLike();
		
		// 객체에 저장
		groupLike.setGroup_idx(idx);
		groupLike.setMember_idx(login_idx);
		
		// GroupLike delete
		communityEditService.disLikeGroup(groupLike);
		

		// 좋아요 갯수
		map.put("groupLike", communityListService.groupLike(idx));
		
		
		
		// 
		
		
		return map;
	}
	
	
	
	
	// 커뮤니티 가입하기
	@RequestMapping(value="/join", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, String>  joinCommunity(HttpServletRequest  request, HttpServletResponse response, HttpSession session) {
		
		response.setContentType("application/json; charset=utf-8");
		
		Map<String, String> map = new HashMap<>();
		
		String temp1 = request.getParameter("idx");
		String temp2 = (String)session.getAttribute("login_idx").toString();
		
	
		
		
		int idx = Integer.parseInt(temp1);
		int login_idx =Integer.parseInt(temp2);
		
//		System.out.println("인덱스 : " + idx);
//		System.out.println("로그인 인덱스 : "+ login_idx);
		
		GroupMember groupMember = new GroupMember();
		
		groupMember.setGroup_idx(idx);
		groupMember.setMember_idx(login_idx);
		
		communityEditService.joinedMember(groupMember);
		
		
		map.put("success", "가입에 성공하였습니다.");
		
		
		
		return map;
	}
	
	// 비밀커뮤니티 가입처리
	@RequestMapping(value="/secretCommunityJoin", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, String> secretCommunityJoin(HttpServletRequest  request, HttpServletResponse response, HttpSession session){
		
		Map<String, String> map = new HashMap<>();
		
		response.setContentType("application/json; charset=utf-8");
		
		// 세션 및 파라미터 가져오기
		String temp1 = request.getParameter("idx");
		String temp2 = (String)session.getAttribute("login_idx").toString();
		String password = request.getParameter("password");
		
		int idx = Integer.parseInt(temp1);
		int login_idx =Integer.parseInt(temp2);
		
		// true false 확인
		CommunityGroup communityGroup = new CommunityGroup();
		communityGroup.setIdx(idx);
		communityGroup.setPassword(password);
		
		// true일때
		if(communityListService.secretCommunityJoin(communityGroup)) {
			
			// 그룹 맴버에 추가
			GroupMember groupMember= new GroupMember();
			groupMember.setGroup_idx(idx);
			groupMember.setMember_idx(login_idx);
			// Insert
			communityEditService.joinedMember(groupMember);
			
			map.put("result", "1");
			map.put("message", "성공하였습니다.");
			
		}
		
		// false 일 때
		else {
			
			map.put("result", "0");
			map.put("message", "비밀번호가 틀렸습니다.");
			
		}
		
		
		return map;
	}
}
