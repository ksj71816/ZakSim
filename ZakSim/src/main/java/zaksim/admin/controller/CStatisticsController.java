package zaksim.admin.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import zaksim.admin.service.CStatisticsService;
import zaksim.dto.CStatistics;
import zaksim.dto.MStatistics;
import zaksim.util.ExcelWriter;

@Controller
@RequestMapping(value="/zaksim/admin")
public class CStatisticsController {
	
private static final Logger logger = LoggerFactory.getLogger(CStatisticsController.class);
	
	@Autowired CStatisticsService cStatisticsrService;
	
	ExcelWriter excelWriter;
	
	
	
	
	@RequestMapping(value = "/cStatistics", method = RequestMethod.GET)
	public void cStatisticsForm() {
	}
	
	@RequestMapping(value="/cStatistics/changePeriod", method = RequestMethod.POST, produces="application/json; charset=utf-8")
	@ResponseBody
	public Map<String, Object> changePeriod(String startDate, String endDate) {
		
		HashMap<String, Object> map = new HashMap<>();
		
		CStatistics rate = cStatisticsrService.viewCertificationRate(startDate, endDate);
		List<CStatistics> chalCount = cStatisticsrService.viewChallengeNum(startDate, endDate);
		List<CStatistics> detailList = cStatisticsrService.viewDetailList(startDate, endDate);
		
		
		map.put("rate", rate);
		map.put("chalCount", chalCount);
		map.put("detailList", detailList);
		
		return map;
	}
	
	@RequestMapping(value="/cStatistics/downloadExcel", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, String> downloadExcel(HttpServletResponse response, String startDate, String endDate) {
		
	    Map<String, String> map = new HashMap<>();

	    List<CStatistics> detailList = cStatisticsrService.viewDetailList(startDate, endDate);
	    
	    ExcelWriter excelWriter = new ExcelWriter();
	    excelWriter.challengeExcelDown(response, detailList);
	    
	    map.put("result", "success");
	    
	    return map;
	}

}
