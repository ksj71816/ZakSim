package zaksim.admin.controller;

import java.util.HashMap;
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

import zaksim.admin.service.PStatisticsService;
import zaksim.util.ExcelWriter;

@Controller
@RequestMapping(value="/zaksim/admin")
public class PStatisticsController {
	
private static final Logger logger = LoggerFactory.getLogger(PStatisticsController.class);
	
	@Autowired PStatisticsService pStatisticsrService;
	
	ExcelWriter excelWriter;
	
	// 화면 연결
	// 기간 변경
	// 엑셀 다운
	
	
	@RequestMapping(value = "/pStatistics", method = RequestMethod.GET)
	public void pStatisticsForm(Model model) {
		// 화면 연결
		// memberService.당일 가입 수 가져오기();
		// memberService.최근 일주일간? 회원수 추이 가져오기();
		// memberService.최근 일주일간 방문수 추이 가져오기();
		// memberService.상세 통계자료 가져오기();
		// 모델에 값 넣기
	}
	
	@RequestMapping(value="/pStatistics/changePeriod", method = RequestMethod.POST, produces="application/json; charset=utf-8")
	@ResponseBody
	public Map<String, String> changePeriod(int period) {
		
		// 화면 연결
		// memberService.기간 가입 수 가져오기();
		// memberService.기간 회원수 추이 가져오기();
		// memberService.기간 방문수 추이 가져오기();
		// memberService.상세 통계자료 가져오기();
		
		HashMap<String, String> map = new HashMap<>();
		
		return map;
	}
	
	@RequestMapping(value="/pStatistics/downloadExcel", method = RequestMethod.POST)
	@ResponseBody
	public void downloadExcel(HttpServletResponse response) {
		
		// ExcelWriter.파일 생성();
		// 서비스.파일 다운로드();
	}

}
