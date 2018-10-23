package zaksim.customerCenter.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/*
 * 작성일 : 2018.10.18
 * 작성자 : 권미현
 */
/**
 * 고객센터 - 이용안내 Controller
 */
@Controller
public class GuidanceController {

	// 이용안내 view
	@RequestMapping(value="/zaksim/customerCenter/guidance/view", method=RequestMethod.GET)
	public void guidance() {
		
	}
	
}
