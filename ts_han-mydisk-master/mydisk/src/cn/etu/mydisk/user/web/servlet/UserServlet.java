package cn.etu.mydisk.user.web.servlet;

import cn.etu.mydisk.domain.User;
import cn.etu.mydisk.exception.UserException;
import cn.etu.mydisk.service.impl.UserServiceImpl;
import cn.hj.commons.CommonUtils;
//import cn.hj.servlet.BaseServlet;
import cn.hj.servlet.BaseServlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class UserServlet
 */
@WebServlet(name="UserServlet", urlPatterns="/UserServlet")
public class UserServlet extends BaseServlet {
	private static final long serialVersionUID = 1L;
	private UserServiceImpl userService = new UserServiceImpl();

	//登陆
	public String login(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		User form = CommonUtils.toBean(request.getParameterMap(), User.class);
		Boolean b = form.loginValidate();

		if (!b) {
			request.setAttribute("form", form);
			return "f:/jsps/login.jsp";
		}
		
		try {
			User user = userService.login(form);
			request.getSession().setAttribute("session_user", user);
			
			if (user.getAdmin()) {

				return "r:/jsps/admin/adminmain.jsp";
			}
			return "r:/jsps/user/main.jsp";
		} catch (UserException e) {
			request.setAttribute("msg", e.getMessage());
			request.setAttribute("form", form);
			return "f:/jsps/login.jsp";
		}
	}

	//退出登陆
	public String logout(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.getSession().invalidate();
		return "f:/jsps/login.jsp";
	}
	
	//修改密码
	public String changePassword(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		User user = (User) request.getSession().getAttribute("session_user");
		User form = CommonUtils.toBean(request.getParameterMap(), User.class);

		//校验旧密码输入是否正确
		if (!CommonUtils.md5(request.getParameter("oldPwd")).equals(user.getPassword())) {
			request.setAttribute("msg", "原密码输入错误，请重新输入！");
			request.setAttribute("form", form);

			return "a:oldPwdError";
		}
		//校验新密码
		Boolean b = form.pwdValidate();
		if (!b) {
			request.setAttribute("form", form);
			return "a:newPwdError";
		}
		//校验通过，对新密码加密后调用service修改密码
		userService.changePassword(user.getUid(), CommonUtils.md5(form.getPassword()));
		//修改完毕后，销毁session，重新登陆
		request.getSession().invalidate();
		return "a:success";
	}

	
	
	
	
	
}
