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

import zaksim.admin.service.PStatisticsService;
import zaksim.dto.CStatistics;
import zaksim.dto.PStatistics;
import zaksim.util.ExcelWriter;

@Controller
@RequestMapping(value="/zaksim/admin")
public class PStatisticsController {
	
private static final Logger logger = LoggerFactory.getLogger(PStatisticsController.class);
	
	@Autowired PStatisticsService pStatisticsrService;
	
	ExcelWriter excelWriter;
	
	
	@RequestMapping(value = "/pStatistics", method = RequestMethod.GET)
	public void pStatisticsForm() {
	}
	
	@RequestMapping(value="/pStatistics/changePeriod", method = RequestMethod.POST, produces="application/json; charset=utf-8")
	@ResponseBody
	public Map<String, Object> changePeriod(String startDate, String endDate) {
		HashMap<String, Object> map = new HashMap<>();
		
		PStatistics rate = pStatisticsrService.viewSuccessRate(startDate, endDate);
		List<PStatistics> moneyList = pStatisticsrService.viewChallengeMoney(startDate, endDate);
		List<PStatistics> detailList = pStatisticsrService.viewDetailList(startDate, endDate);
		
		
		map.put("rate", rate);
		map.put("moneyList", moneyList);
		map.put("detailList", detailList);
		
		return map;
	}
	
	@RequestMapping(value="/pStatistics/downloadExcel", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, String> downloadExcel(HttpServletResponse response, String startDate, String endDate) {
		
	    Map<String, String> map = new HashMap<>();

	    List<PStatistics> detailList = pStatisticsrService.viewDetailList(startDate, endDate);
	    
	    ExcelWriter excelWriter = new ExcelWriter();
	    excelWriter.profitsExcelDown(response, detailList);
	    
	    map.put("result", "success");
	    
	    return map;
	}

}
