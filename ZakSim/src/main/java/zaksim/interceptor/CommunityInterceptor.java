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
		
		if((boolean)request.getSession().getAttribute("login")) {	// 로그인 했을 경우

			Map<String,Integer> map = new HashMap<String,Integer>();
			map.put("memberIdx", (int)request.getSession().getAttribute("login_idx"));
			map.put("groupIdx", Integer.parseInt(request.getParameter("idx")));
			
			int result = cd.isCommunityMember(map);
			
			if(result > 0) {	// 참여멤버라면
				return true;
			}else {
				return false;
			}
		} else {	// 로그인 안 했을 경우
			return false;
		}
	}
}
