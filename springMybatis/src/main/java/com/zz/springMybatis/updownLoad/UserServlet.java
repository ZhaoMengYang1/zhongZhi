package com.zz.springMybatis.updownLoad;

import java.io.IOException;
import java.util.List;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;

import com.alibaba.fastjson.JSON;
import com.zz.springMybatis.controller.BaseController;
import com.zz.springMybatis.controller.CtxUtil;
import com.zz.springMybatis.entitys.UploadContent;
import com.zz.springMybatis.mappers.UploadContentMapper;

//@WebServlet("/UserServlet")
@WebServlet(name="UserServlet", urlPatterns="/jquery/test1")
public class UserServlet extends HttpServlet {
	
	
	UploadContentMapper upContent;
	
	public void init() {
		upContent = CtxUtil.getBean(UploadContentMapper.class);
	}
	public void  doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		System.out.println("UserServlet================================");
		System.out.println("WebServlet(urlPatterns=)");
		response.setContentType("text/html;charset=utf-8");
		
		List<UploadContent>contentList = upContent.getAllContent();
		String allContent = JSON.toJSONString(contentList);
		System.out.println("返回json数据"+allContent);
		response.getWriter().write(allContent);
		
		System.out.println("返回Json数据");
	}
	
	
	
	public void doGet(HttpServletRequest request,HttpServletResponse response) throws IOException {
		System.out.println("get请求");
		doPost(request,response);
	}
	
}
