package cn.etu.mydisk.admin.web.servlet;

import cn.etu.mydisk.domain.User;
import cn.etu.mydisk.exception.UserException;
import cn.etu.mydisk.service.impl.FileServiceImpl;
import cn.etu.mydisk.service.impl.UserServiceImpl;
import cn.hj.commons.CommonUtils;
import cn.hj.servlet.BaseServlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class UserServlet
 */
@WebServlet("/admin/AdminServlet")
public class AdminServlet extends BaseServlet {
	private static final long serialVersionUID = 1L;
	private UserServiceImpl userService = new UserServiceImpl();
	private FileServiceImpl fileService = new FileServiceImpl();

	//admin概览：用户数，文件总数，文件总大小
	public String overView(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int userCount = userService.findCount();
		int fileCount = fileService.fileCount();
		String allFileSize = fileService.allFileSize();
		int recycledCount = fileService.recycledCount();
		String recycledTotalSize = fileService.recycledTotalSize();
		request.setAttribute("userCount", userCount);
		request.setAttribute("fileCount", fileCount);
		request.setAttribute("allFileSize", allFileSize);
		request.setAttribute("recycledCount", recycledCount);
		request.setAttribute("recycledTotalSize", recycledTotalSize);
		
		
		return "f:/jsps/admin/adminoverview.jsp";
	}
	
}
