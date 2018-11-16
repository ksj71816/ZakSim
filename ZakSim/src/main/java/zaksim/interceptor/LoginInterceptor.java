package zaksim.interceptor;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;


public class LoginInterceptor extends HandlerInterceptorAdapter{
	
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		 System.out.println("--------------------------------------accessdenied");
		 System.out.println(request.getSession().getAttribute("login"));
		 if(request.getSession().getAttribute("login") == null) {
			 response.sendRedirect("/zaksim/login/login");
			 return false;
		 }else {
			 return true;
		 }
		 
		 
	}
}
