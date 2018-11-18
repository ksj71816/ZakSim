package zaksim.interceptor;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;


public class AdminInterceptor extends HandlerInterceptorAdapter{
	
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		 System.out.println("--------------------------------------accessdenied");
		 System.out.println(request.getSession().getAttribute("login_idx"));
		 if(request.getSession().getAttribute("login_idx") == null || 
				 (Integer)request.getSession().getAttribute("login_idx") != 1) {
			 response.sendRedirect("/zaksim/login/login");
			 return false;
		 } else {
			 System.out.println("------------------------------------login");
			 return true;
		 }
		 
		 
	}
}
