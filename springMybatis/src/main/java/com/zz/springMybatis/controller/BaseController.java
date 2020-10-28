package com.zz.springMybatis.controller;

import java.io.UnsupportedEncodingException;
import java.lang.reflect.Method;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class BaseController extends HttpServlet{
	
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request,HttpServletResponse response) throws UnsupportedEncodingException {
		
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=utf-8");
		
		//获得要执行的方法名
		String act = request.getParameter("act");
		
		//如果用户没有提供方法名
		if(act == null || act.equals("")) {
			//默认方法
			act = "excute";
		}
		
		//根据方法名获得方法信息
		Method method;
	}

}
