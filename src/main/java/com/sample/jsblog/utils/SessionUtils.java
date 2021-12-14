package com.sample.jsblog.utils;

import javax.servlet.http.HttpSession;

import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

public class SessionUtils {
	
	/**
	 * 로그인 시도한 사용자의 새션객체를 생성해주는것
	 * @return 세션객체
	 */
	private static HttpSession getSession(boolean create) { 
		
	 ServletRequestAttributes attributes = (ServletRequestAttributes) RequestContextHolder.currentRequestAttributes(); 
	 return attributes.getRequest().getSession(create);
	}

	/**
	 * HttpSession 객체에 속성 추가 ,session에 넣을라고
	 * @param name 
	 * @param value
	 */
	public static void addAttribute(String name, Object value) { //세션추가
		getSession(true).setAttribute(name, value);
	}
	
	/**
	 *  HttpSession 객체에 지정된 속성이름으로 추가된 속성값 반환
	 * @param name
	 * @return
	 */
	 
	public static Object getAttribute(String name) {		//name에 해당되는걸가져오는것
		return getSession(true).getAttribute(name);
	}
	
	/**
	 *  지정된 Session 삭제
	 * @param name
	 */
	public static void removeAttribute(String name) { 	//name에 해당하는것 삭제
		 getSession(true).removeAttribute(name);
	}
	
	/**
	 * HttpSEssion 객체를 폐기
	 */
	public static void destroySession() {				//session자체를 삭제
		HttpSession session = getSession(false);
		if(session != null) {
			session.invalidate();
		}
	}
}
