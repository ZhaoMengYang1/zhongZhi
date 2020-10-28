package cn.etu.mydisk.test;

import cn.hj.servlet.BaseServlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class TestServlet2
 */
@WebServlet("/TestServlet2")
public class TestServlet2 extends BaseServlet {
	private static final long serialVersionUID = 1L;

	public String resetPassword(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
System.out.println("servlet run");		
		String uid = request.getParameter("uid");
		System.out.println(uid);
		response.getWriter().write("成功");
		return null;
	}
}
