package com.sbs.dan.at.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

@Component("needToLogoutInterceptor")
public class NeedToLogoutInterceptor implements HandlerInterceptor {
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		boolean isLogined = (boolean) request.getAttribute("isLogined");
		
		boolean isAjax = (boolean) request.getAttribute("isAjax");
		
		if (isLogined) {
			if (isAjax == false) {
				response.setContentType("text/html; charset=UTF-8");
				response.getWriter().append("<script>");
				response.getWriter().append("location.replace('/usr/home/main');");
				response.getWriter().append("</script>");
			} else {
				response.setContentType("application/json; charset=UTF-8");
				response.getWriter().append("{\"resultCode\":\"F-A\",\"msg\":\"로그아웃 상태에서 이요해주세요.\"}");
			}
			return false;
		}
		return HandlerInterceptor.super.preHandle(request, response, handler);
	}
	
}