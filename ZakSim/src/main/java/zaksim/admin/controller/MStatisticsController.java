package zaksim.admin.controller;

import java.util.ArrayList;
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
import zaksim.dao.ZakSimMemberDao;
import zaksim.dto.MStatistics;
import zaksim.dto.MemberCount;
import zaksim.dto.Visits;
import zaksim.dto.ZakSimMember;
import zaksim.util.ExcelWriter;

@Controller
@RequestMapping(value="/zaksim/admin")
public class MStatisticsController {
	
	private static final Logger logger = LoggerFactory.getLogger(MStatisticsController.class);
	
	@Autowired MStatisticsService mStatisticsrService;
	@Autowired ZakSimMemberDao zDao;


	
	@RequestMapping(value = "/mStatistics", method = RequestMethod.GET)
	public void mStatisticsForm() {
	}
	
	@RequestMapping(value="/mStatistics/changePeriod", method = RequestMethod.POST, produces="application/json; charset=utf-8")
	@ResponseBody
	public Map<String, Object> changePeriod(String startDate, String endDate) {
		
		HashMap<String, Object> map = new HashMap<>();
		
		int joinNum = mStatisticsrService.viewJoinNum(startDate, endDate);
		List<MemberCount> memberCount = mStatisticsrService.viewMemberNum(startDate, endDate);
		List<Visits> visits = mStatisticsrService.viewVisitsNum(startDate, endDate);
		List<MStatistics> detailList = mStatisticsrService.viewDetailList(startDate, endDate);
		
		map.put("joinNum", joinNum);
		map.put("memberCount", memberCount);
		map.put("visits", visits);
		map.put("detailList", detailList);
		
		return map;
	}
	
	@RequestMapping(value="/mStatistics/downloadExcel", method = RequestMethod.POST, produces="application/json; charset=utf-8")
	@ResponseBody
	public Map<String, String> downloadExcel(HttpServletResponse response, String startDate, String endDate) {
		
	    Map<String, String> map = new HashMap<>();

	    List<MStatistics> detailList = mStatisticsrService.viewDetailList(startDate, endDate);
	    
	    ExcelWriter excelWriter = new ExcelWriter();
	    excelWriter.memberExcelDown(response, detailList);
	    
	    map.put("result", "success");
	    
	    return map;
	}
	

}
