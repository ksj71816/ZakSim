package zaksim.interceptor;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import zaksim.dao.CommunityListDAO;

public class CommunityInterceptor extends HandlerInterceptorAdapter {
	@Autowired CommunityListDAO cd;
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		Map<String,Integer> map = new HashMap<String,Integer>();
		map.put("memberIdx", (int)request.getSession().getAttribute("login_idx"));
		map.put("groupIdx", Integer.parseInt(request.getParameter("idx")));
		int result = cd.isCommunityMember(map);
		if(result > 0) {
			return true;
		}else {
			return false;
		}
	}
}
