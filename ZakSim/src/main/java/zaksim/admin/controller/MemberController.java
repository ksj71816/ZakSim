package zaksim.admin.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import zaksim.admin.service.MemberService;
import zaksim.dto.Report;
import zaksim.dto.ZakSimMember;
import zaksim.util.Paging;

@Controller
@RequestMapping(value="/zaksim/admin")
public class MemberController {
	
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Autowired MemberService memberService;
	
	
	// 화면 연결
	@RequestMapping(value = "/member", method = RequestMethod.GET)
	public void memberForm(Model model) {
		
		int totalCount = memberService.getAdminTotalCount("", "전체 회원");
		Paging paging = new Paging(totalCount, 1, 10);
		
		List<ZakSimMember> mList = memberService.viewAdminList(paging, "전체 회원", "");
		
		model.addAttribute("mList", mList);
		model.addAttribute("paging", paging);
	}
	
	// 화면 연결 (아이디 검색, 카테고리 변경, 리스트 갯수 변경, 페이지 변경)
	@RequestMapping(value = "/memberTable", method = RequestMethod.GET)
	public void changeMemberTable(Model model, @RequestParam(defaultValue="1", required=false)int curPage,
					@RequestParam(defaultValue="10", required=false)String pageCount,
					@RequestParam(defaultValue="", required=false)String searchId,
					@RequestParam(defaultValue="전체 회원", required=false)String category) {
		
		int totalCount = memberService.getAdminTotalCount(searchId, category);
		Paging paging = new Paging(totalCount, curPage, Integer.parseInt(pageCount));
		
		List<ZakSimMember> mList = memberService.viewAdminList(paging, category, searchId);
		
		model.addAttribute("mList", mList);
		model.addAttribute("paging", paging);
	}
	
	// 신고 상세 모달
	@RequestMapping(value="/reportDetail", method = RequestMethod.GET, produces="application/json; charset=utf-8")
	@ResponseBody
	public Map<String, Object> reportDetail(ZakSimMember member) {
		
		// 신고 상세 가져오기
		HashMap<String, Object> map = new HashMap<>();
		
		List<Report> rList = memberService.viewReport(member);
		
		ZakSimMember memberData = memberService.getMemberData(member);
		
		map.put("rList", rList);
		map.put("memberData", memberData);
		
		return map;
	}
	
	// 계정 정지하기
	@RequestMapping(value="/suspend", method = RequestMethod.POST, produces="application/json; charset=utf-8")
	@ResponseBody
	public Map<String, String> suspend(String[] suspendIdx) {
		HashMap<String, String> map = new HashMap<>();
		
		System.out.println("suspendIdx : " + suspendIdx);
		
		return map;
	}
}
