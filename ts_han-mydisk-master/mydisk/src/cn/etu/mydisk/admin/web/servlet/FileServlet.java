package cn.etu.mydisk.admin.web.servlet;


import cn.etu.mydisk.service.impl.FileServiceImpl;
import cn.hj.servlet.BaseServlet;
import javax.servlet.annotation.WebServlet;

/**
 * Servlet implementation class FileServlet
 */
@WebServlet("/admin/FileServlet")
public class FileServlet extends BaseServlet {
	private static final long serialVersionUID = 1L;
	private FileServiceImpl fileService = new FileServiceImpl();
	
	
	public String findAllDir() {

		
		return null;
	}
	
	
}
