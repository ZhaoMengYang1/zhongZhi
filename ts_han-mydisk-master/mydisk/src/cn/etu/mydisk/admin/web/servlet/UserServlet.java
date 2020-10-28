package cn.etu.mydisk.admin.web.servlet;

import cn.etu.mydisk.domain.File;
import cn.etu.mydisk.domain.User;
import cn.etu.mydisk.exception.UserException;
import cn.etu.mydisk.pager.PageBean;
import cn.etu.mydisk.service.impl.FileServiceImpl;
import cn.etu.mydisk.service.impl.UserServiceImpl;
import cn.hj.commons.CommonUtils;
import cn.hj.servlet.BaseServlet;

import java.io.IOException;
import java.util.Date;
import java.util.Properties;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class UserServlet
 */
@WebServlet("/admin/UserServlet")
public class UserServlet extends BaseServlet {
	private static final long serialVersionUID = 1L;
	private UserServiceImpl userService = new UserServiceImpl();
	private FileServiceImpl fileService = new FileServiceImpl();

	// 获取页面要访问的页码，如果页面没有发送页码，默认为第一页
	private int getPageCode(HttpServletRequest request) {
		int pageCode = 1;
		String param = request.getParameter("pageCode");
		if (param != null && !param.trim().isEmpty()) {
			pageCode = Integer.parseInt(param);
		}
		return pageCode;
	}

	// 截取url，页面中的分页导航中要使用他作为超链接目标
	private String getUrl(HttpServletRequest request) {
		// /myDisk/Servlet method=findAll&id=xxx&pageCode=xx
		String url = request.getRequestURI() + "?" + request.getQueryString();
		// 如果url中存在pageCode参数，截取掉，如果不存在就不截取
		int index = url.lastIndexOf("&pageCode");
		if (index != -1) {
			url = url.substring(0, index);
		}
		return url;
	}

	// 添加用户
	public String addUser(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// 封装表单数据
		User form = CommonUtils.toBean(request.getParameterMap(), User.class);
		// 校验表单数据是否合法
		Boolean b = form.addValidate();
		if (!b) {
			request.setAttribute("form", form);
			return "f:/jsps/admin/adduser.jsp";
		}

		// 如果校验通过，补全用户信息，调用service方法添加用户
		form.setUid(CommonUtils.uuid());
		form.setPassword(CommonUtils.md5(form.getPassword()));
		form.setCreateTime(new Date());
		// 为用户创建根文件夹
		File file = new File();
		file.setFid(CommonUtils.uuid());// 设置主键
		file.setFname(form.getUname());// 文件名和用户名相同
		file.setCreatetime(new Date());
		file.setFolder(true);
		file.setUser(form);
		form.setHome(file);

		// 在硬盘创建根文件夹：读取配置文件，找到文件存放位置
		Properties props = new Properties();
		try {
			props.load(this.getClass().getClassLoader().getResourceAsStream("myDiskConfig.properties"));
		} catch (IOException e) {
			throw new RuntimeException(e);
		}
		// 服务器保存文件的根目录
		String rootPath = props.getProperty("rootUrl");
		// 创建文件夹
		//String savePath = rootPath + "/" + file.getFname();
		java.io.File folder = new java.io.File(rootPath, file.getFname());
		//如果文件存放的路径不存在，则创建之
		if (!folder.getParentFile().exists()) {
			folder.getParentFile().mkdirs();
		}
		//如果文件存放的路径下有重名文件夹，则在文件夹名后面添加后缀
		for (int i = 1; folder.exists() && folder.isDirectory() && i < Integer.MAX_VALUE; i++) {
			file.setFname(file.getFname() + "(" + i +")");
			folder = new java.io.File(rootPath, file.getFname());
		}
		folder.mkdir();
		
		if (!folder.exists() && folder.isDirectory()) {
			folder.mkdirs();
		}
		file.setFileurl("/" + file.getFname());

		try {
			userService.add(form);
			fileService.createFolder(file);
		} catch (UserException e) {
			request.setAttribute("msg", e.getMessage());
			request.setAttribute("form", form);
			return "f:/jsps/admin/adduser.jsp";
		}

		request.setAttribute("msg", "添加成功");
		return findAll(request, response);
	}

	// 查询所有用户
	public String findAll(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 获得查询的页码
		int pageCode = getPageCode(request);
		// 获得url
		String url = getUrl(request);
		PageBean<User> pageBean = userService.findAll(pageCode);
		pageBean.setUrl(url);
		request.setAttribute("pb", pageBean);
		return "f:/jsps/admin/usermgr.jsp";
	}

	// 删除用户
	public String batchDelete(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String uids = request.getParameter("uids");
		userService.batchDelete(uids);

		return findAll(request, response);
	}

	// 重置用户密码为1
	public String resetPassword(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String uid = request.getParameter("uid");
		String password = CommonUtils.md5("1");
		userService.changePassword(uid, password);

		return findAll(request, response);
	}

	// 修改密码
	public String changePassword(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		User user = (User) request.getSession().getAttribute("session_user");
		User form = CommonUtils.toBean(request.getParameterMap(), User.class);

		// 校验旧密码输入是否正确
		if (!CommonUtils.md5(request.getParameter("oldPwd")).equals(user.getPassword())) {
			request.setAttribute("msg", "原密码输入错误，请重新输入！");
			request.setAttribute("form", form);

			return "a:oldPwdError";
		}
		// 校验新密码
		Boolean b = form.pwdValidate();
		if (!b) {
			request.setAttribute("form", form);
			return "a:newPwdError";
		}
		// 校验通过，对新密码加密后调用service修改密码
		userService.changePassword(user.getUid(), CommonUtils.md5(form.getPassword()));
		// 修改完毕后，销毁session，重新登陆
		request.getSession().invalidate();
		return "a:success";
	}

	// 锁定和解锁
	public String lock(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uid = request.getParameter("uid");
		String flag = request.getParameter("lock");
		userService.lock(uid, flag);
		return findAll(request, response);
	}

	// 按用户名模糊搜索
	public String search(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// 获得查询的页码
		int pageCode = getPageCode(request);
		String uname = request.getParameter("uname");
		// 获得url
		String url = getUrl(request);
		PageBean<User> pageBean = userService.findByUname(uname, pageCode);
		pageBean.setUrl(url);
		request.setAttribute("pb", pageBean);
		return "f:/jsps/admin/usermgr.jsp";
	}

}
