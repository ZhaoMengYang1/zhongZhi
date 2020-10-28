package com.zz.springMybatis.controller;

import java.io.UnsupportedEncodingException;
import java.lang.reflect.Method;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.BeansException;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.stereotype.Component;

@Component
public class CtxUtil implements ApplicationContextAware {

	public static ApplicationContext ctx;

	@Override
	public void setApplicationContext(ApplicationContext applicationContext) throws BeansException {
		// TODO Auto-generated method stub
		ctx = applicationContext;
	}
	
	/*
	 * 根据类型获取bean
	 */
	public static<T>T getBean(Class<T> clazz){
		return ctx.getBean(clazz);
		
	}
	
	
	/*
	 * 根据名称获取bean
	 */
	public static Object getBean(String name) {
		return ctx.getBean(name);
	}
}
