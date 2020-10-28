package cn.etu.mydisk.user.web.servlet;

import cn.etu.mydisk.domain.File;
import cn.etu.mydisk.domain.User;
import cn.etu.mydisk.exception.FileException;
import cn.etu.mydisk.fileTypes.fileTypesConstants;
import cn.etu.mydisk.pager.PageBean;
import cn.etu.mydisk.service.impl.FileServiceImpl;
import cn.etu.mydisk.utils.FileUtil;
import cn.hj.commons.CommonUtils;
import cn.hj.servlet.BaseServlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.List;
import java.util.Properties;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class FileServlet
 */
@WebServlet(name="FileServlet",urlPatterns="/FileServlet")
public class FileServlet extends BaseServlet {
	private static final long serialVersionUID = 1L;
	private FileServiceImpl fileService = new FileServiceImpl();
	private Properties props = new Properties();

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

	// 加载用户某个文件夹下的所有文件和文件夹
	public String loadAll(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String method = request.getParameter("method");
		request.setAttribute("method", method);
		// 获取当前文件夹的fid
		String fid = request.getParameter("fid");
		// 获取用户
		User user = (User) request.getSession().getAttribute("session_user");
		String uid = user.getUid();
		// 获得查询的页码
		int pageCode = getPageCode(request);
		// 获得url
		String url = getUrl(request);
		// 获得当前文件夹
		File currentFile = fileService.findByFid(fid);
		// 如果当前文件夹的父文件夹不是home文件夹并且当前文件夹不是home文件夹，获取该用户home文件夹到当前文件夹的路径list
		List<File> pathList = new ArrayList<File>();
		if (currentFile.getParent().getFid() != null
				&& !currentFile.getParent().getFid().equals(user.getHome().getFid())) {
			pathList = getPathList(currentFile, user.getHome().getFid(), pathList);
			Collections.reverse(pathList);
		}
		// 获得该文件夹下的所有文件和文件夹
		PageBean<File> pb = fileService.findAll(uid, fid, pageCode);
		pb.setUrl(url);

		request.setAttribute("currentFile", currentFile);
		request.setAttribute("pathList", pathList);
		request.setAttribute("pb", pb);
		return "f:/jsps/user/list.jsp";
	}

	// home文件夹到当前文件夹的路径list
	private List<File> getPathList(File currentFile, String homeid, List<File> pathList) {

		if (currentFile.getParent().getFid().equals(homeid)) {
			pathList.add(fileService.findByFid(currentFile.getParent().getFid()));
			return pathList;
		} else {
			File parent = fileService.findByFid(currentFile.getParent().getFid());
			pathList.add(parent);
			return getPathList(parent, homeid, pathList);
		}
	}

	// 加载用户文件中所有的文档类文件
	public String loadDoc(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String method = request.getParameter("method");
		request.setAttribute("method", method);
		// 获取用户的uid
		User user = (User) request.getSession().getAttribute("session_user");
		String uid = user.getUid();
		// 获得查询的页码
		int pageCode = getPageCode(request);
		// 获得url
		String url = getUrl(request);
		// 获得该用户所有的文档类文件
		String doc = fileTypesConstants.DOC;
		PageBean<File> pb = fileService.findByType(uid, doc, pageCode);
		pb.setUrl(url);
		request.setAttribute("pb", pb);
		return "f:/jsps/user/list.jsp";
	}

	// 加载用户文件中所有的图片类文件
	public String loadImg(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String method = request.getParameter("method");
		request.setAttribute("method", method);
		// 获取用户的uid
		User user = (User) request.getSession().getAttribute("session_user");
		String uid = user.getUid();
		// 获得查询的页码
		int pageCode = getPageCode(request);
		// 获得url
		String url = getUrl(request);
		// 获得该用户所有的文档类文件
		String doc = fileTypesConstants.IMG;
		PageBean<File> pb = fileService.findByType(uid, doc, pageCode);
		pb.setUrl(url);
		request.setAttribute("pb", pb);
		return "f:/jsps/user/list.jsp";
	}

	// 加载用户文件中所有的音频类文件
	public String loadMusic(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String method = request.getParameter("method");
		request.setAttribute("method", method);
		// 获取用户的uid
		User user = (User) request.getSession().getAttribute("session_user");
		String uid = user.getUid();
		// 获得查询的页码
		int pageCode = getPageCode(request);
		// 获得url
		String url = getUrl(request);
		// 获得该用户所有的文档类文件
		String doc = fileTypesConstants.MUSIC;
		PageBean<File> pb = fileService.findByType(uid, doc, pageCode);
		pb.setUrl(url);
		request.setAttribute("pb", pb);
		return "f:/jsps/user/list.jsp";
	}

	// 加载用户文件中所有的视频类文件
	public String loadVedio(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String method = request.getParameter("method");
		request.setAttribute("method", method);
		// 获取用户的uid
		User user = (User) request.getSession().getAttribute("session_user");
		String uid = user.getUid();
		// 获得查询的页码
		int pageCode = getPageCode(request);
		// 获得url
		String url = getUrl(request);
		// 获得该用户所有的文档类文件
		String doc = fileTypesConstants.VEDIO;
		PageBean<File> pb = fileService.findByType(uid, doc, pageCode);
		pb.setUrl(url);
		request.setAttribute("pb", pb);
		return "f:/jsps/user/list.jsp";
	}

	// 加载用户文件中除文档、音频、视频、图片以外的其他文件
	public String loadOther(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String method = request.getParameter("method");
		request.setAttribute("method", method);
		// 获取用户的uid
		User user = (User) request.getSession().getAttribute("session_user");
		String uid = user.getUid();
		// 获得查询的页码
		int pageCode = getPageCode(request);
		// 获得url
		String url = getUrl(request);
		// 获得该用户所有的文档类文件
		String other = fileTypesConstants.OTHER;
		PageBean<File> pb = fileService.findOther(uid, other, pageCode);
		pb.setUrl(url);
		request.setAttribute("pb", pb);
		return "f:/jsps/user/list.jsp";
	}

	// 加载用户已删除的文件和文件夹
	public String loadRecycled(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String method = request.getParameter("method");
		request.setAttribute("method", method);
		// 获取用户的uid
		User user = (User) request.getSession().getAttribute("session_user");
		String uid = user.getUid();
		// 获得查询的页码
		int pageCode = getPageCode(request);
		// 获得url
		String url = getUrl(request);

		PageBean<File> pb = fileService.findRecycled(uid, pageCode);
		pb.setUrl(url);
		request.setAttribute("pb", pb);
		return "f:/jsps/user/list.jsp";
	}

	// 批量删除文件或文件夹
	public String batchDelete(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String fids = request.getParameter("fids");
		// 首先把fids转换成数组
		Object[] fidsArray = fids.split(",");
		fileService.batchDelete(fidsArray);
		return "a:success";
	}

	// 批量恢复文件或文件夹
	public String batchRecover(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String fids = request.getParameter("fids");
		// 首先把fids转换成数组
		Object[] fidsArray = fids.split(",");
		fileService.batchRecover(fidsArray);
		return "a:success";
	}

	// 创建新文件夹
	public String makeDir(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String fid = request.getParameter("fid");
		String fname = request.getParameter("fname");
		File parent = fileService.findByFid(fid);
		// 校验文件夹名称是否是空
		if (fname == null || fname.trim().equals("")) {
			return "a:文件名不能为空！";
		}

		// 读取配置文件，找到文件存放位置
		try {
			props.load(this.getClass().getClassLoader().getResourceAsStream("myDiskConfig.properties"));
		} catch (IOException e) {
			throw new RuntimeException(e);
		}
		// 服务器保存文件的根目录
		String rootPath = props.getProperty("rootUrl");
		// 创建文件夹
		String savePath = rootPath + parent.getFileurl();
		try {
			fname = FileUtil.createDir(fname, savePath);
		} catch (FileException e) {
			return "a:" + e.getMessage();
		}
		// 封装file数据
		File file = new File();
		file.setFname(fname);
		file.setFid(CommonUtils.uuid());
		file.setCreatetime(new Date());
		file.setFolder(true);
		file.setUser((User) request.getSession().getAttribute("session_user"));
		file.setFileurl(parent.getFileurl() + "/" + fname);
		file.setParent(parent);
		fileService.addFile(file);

		return "a:success";
	}

	// 修改文件名
	public String rename(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String fid = request.getParameter("fid");
		String fname = request.getParameter("fname");
		File oldFile = fileService.findByFid(fid);
		// 读取配置文件
		try {
			props.load(this.getClass().getClassLoader().getResourceAsStream("myDiskConfig.properties"));
		} catch (IOException e) {
			throw new RuntimeException(e);
		}
		// 找到服务器保存文件的根目录
		String rootPath = props.getProperty("rootUrl");
		try {
			// 修改硬盘上的文件名，因为可能会重名，会对重名文件添加后缀，得到修改后的新文件名
			String newName = FileUtil.FixFileName(rootPath + oldFile.getFileurl(), fname);
			// 改名后的新fileUrl
			String newFileUrl = oldFile.getFileurl().substring(0, oldFile.getFileurl().lastIndexOf("/")) + "/"
					+ newName;
			// 修改数据库中的新文件名和新fileUrl
			fileService.rename(oldFile, newName, newFileUrl);
			return "a:success";
		} catch (FileException e) {
			return "a:" + e.getMessage();
		}
	}

	// 彻底删除回收站文件
	public String clean(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String fids = request.getParameter("fids");

		// 读取配置文件
		try {
			props.load(this.getClass().getClassLoader().getResourceAsStream("myDiskConfig.properties"));
		} catch (IOException e) {
			throw new RuntimeException(e);
		}
		// 找到服务器保存文件的根目录
		String rootPath = props.getProperty("rootUrl");
		// 首先把fids转换成数组
		Object[] fidsArray = fids.split(",");
		fileService.clean(fidsArray, rootPath);
		return "a:success";
	}

}
