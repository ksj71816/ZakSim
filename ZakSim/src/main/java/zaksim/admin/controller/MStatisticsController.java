package zaksim.admin.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import zaksim.admin.service.MStatisticsService;
import zaksim.dto.MemberCount;
import zaksim.dto.Visits;
import zaksim.util.ExcelWriter;

@Controller
@RequestMapping(value="/zaksim/admin")
public class MStatisticsController {
	
	private static final Logger logger = LoggerFactory.getLogger(MStatisticsController.class);
	
	@Autowired MStatisticsService mStatisticsrService;
	ExcelWriter excelWriter;
	
	// 화면 연결
	// 기간 변경
	// 엑셀 다운
	
	
	@RequestMapping(value = "/mStatistics", method = RequestMethod.GET)
	public void mStatisticsForm(Model model) {
		int joinNum = mStatisticsrService.viewJoinNum("오늘");
		List<MemberCount> memberCount = mStatisticsrService.viewMemberNum("오늘");
		List<Visits> visits = mStatisticsrService.viewVisitsNum("오늘");
		
		model.addAttribute("joinNum", joinNum);
		model.addAttribute("memberCount", memberCount);
		model.addAttribute("visits", visits);
	}
	
	@RequestMapping(value="/mStatistics/changePeriod", method = RequestMethod.POST, produces="application/json; charset=utf-8")
	@ResponseBody
	public Map<String, Object> changePeriod(String period) {		
		HashMap<String, Object> map = new HashMap<>();
		
		int joinNum = mStatisticsrService.viewJoinNum(period);
		List<MemberCount> memberCount = mStatisticsrService.viewMemberNum(period);
		List<Visits> visits = mStatisticsrService.viewVisitsNum(period);
		
		map.put("joinNum", joinNum);
		map.put("memberCount", memberCount);
		map.put("visits", visits);
		
		return map;
	}
	
	@RequestMapping(value="/mStatistics/changePeriod2", method = RequestMethod.POST, produces="application/json; charset=utf-8")
	@ResponseBody
	public Map<String, Object> changePeriod2(String startDate, String endDate) {
		
		startDate += "-01";
		endDate += "-01";
		System.out.println(startDate + ", " + endDate);
		
		HashMap<String, Object> map = new HashMap<>();
		
		int joinNum = mStatisticsrService.viewJoinNum(startDate, endDate);
		List<MemberCount> memberCount = mStatisticsrService.viewMemberNum(startDate, endDate);
		List<Visits> visits = mStatisticsrService.viewVisitsNum(startDate, endDate);
		
		map.put("joinNum", joinNum);
		map.put("memberCount", memberCount);
		map.put("visits", visits);
		
		return map;
	}
	
	@RequestMapping(value="/mStatistics/downloadExcel", method = RequestMethod.POST)
	@ResponseBody
	public void downloadExcel(HttpServletResponse response) {
		
		// ExcelWriter.파일 생성();
		// 서비스.파일 다운로드();
	}
	

}
