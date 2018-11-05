package zaksim.main.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import zaksim.dto.ZakSimMember;

@Controller
@RequestMapping(value="/zaksim/main")
public class MainController {

	private static final Logger logger = LoggerFactory.getLogger(MainController.class);
	
	@RequestMapping(value="/home", method=RequestMethod.GET)
	public void main() {
		
		ZakSimMember member=new ZakSimMember();
		
		
		
		
	}
}
