package com.ifat.action;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.ServletResponseAware;
import org.apache.struts2.util.ServletContextAware;

import com.opensymphony.xwork2.ActionSupport;

public class SuperAction extends ActionSupport implements ServletRequestAware
						, ServletResponseAware, ServletContextAware {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	//请求对象。
	protected HttpServletRequest request;
	//响应对象。
	protected HttpServletResponse response;
	//会话对象。
	protected HttpSession session;
	//全局对象。
	protected ServletContext application;
	
	@Override
	public void setServletContext(ServletContext application) {
		this.application = application;
		
	}

	@Override
	public void setServletResponse(HttpServletResponse response) {
		this.response = response;
	}

	@Override
	public void setServletRequest(HttpServletRequest reqeust) {
		this.request = reqeust;
		this.session = reqeust.getSession();
	}

}