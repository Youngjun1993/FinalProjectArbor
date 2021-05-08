package com.arbor.home.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class Logininterceptor_Admin extends HandlerInterceptorAdapter {

	// HandlerInterceptorAdapter 를 상속받아 Interceptor 클래스를 생성한 후 메소드 오버라이딩
	// 컨트롤러가 호출되기전에 먼저 실행되는 메소드
	public boolean preHandle(HttpServletRequest req, HttpServletResponse res,
			Object Handler) throws Exception {
		/*관리자 로그인 아닌 경우 home으로 넘겨버리도록 interceptor 만들었음*/
		
		// 로그인 정보 구하기
		String userid = (String) req.getSession().getAttribute("logId");
		try {
			if(!userid.equals("admin")) {
				if(isAjaxRequest(req)) {
					res.sendError(400);
					return false;
				} else {
					// 홈으로 반환
					res.sendRedirect(req.getContextPath()+"/");
					return false; // false로 반환하면 -> 새로운 컨트롤러로 넘어감!
				}
			}
		} catch(Exception e) {
			e.printStackTrace();
			return false;
		}
		return true; // true를 리턴하면 -> 가던길 계속 감!!!
		
	}
	
	private boolean isAjaxRequest(HttpServletRequest req) {
		if("true".equals(req.getHeader("AJAX"))) {
			return true;
		} else {
			return false;
		}
	}

}
