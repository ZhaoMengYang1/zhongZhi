package cn.etu.mydisk.user.web.servlet;

import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import cn.etu.mydisk.domain.User;
import cn.etu.mydisk.service.impl.FileServiceImpl;
import cn.hj.commons.CommonUtils;

@WebServlet(name="UploadServlet",urlPatterns="/UploadServlet")
public class UploadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private FileServiceImpl fileService = new FileServiceImpl();

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		User user = (User) request.getSession().getAttribute("session_user");
		/*
		 * 1. commons-fileupload的上传三步
		 */
		// 创建工厂
		FileItemFactory factory = new DiskFileItemFactory();
		/*
		 * 2. 创建解析器对象
		 */
		ServletFileUpload sfu = new ServletFileUpload(factory);
		// sfu.setFileSizeMax(80 * 1024);//设置单个上传的文件上限为80KB
		/*
		 * 3. 解析request得到List<FileItem>
		 */
		List<FileItem> fileItemList = null;
		try {
			fileItemList = sfu.parseRequest(request);
		} catch (FileUploadException e) {
			// 如果出现这个异步，说明单个文件超出了大小限制
			throw new RuntimeException(e);
		}

		/*
		 * 4. 把上传的文件保存起来：获取文件保存的文件夹parent>获取文件保存的路径 > 获取文件名、文件大小、文件后缀名等信息
		 * 检查保存的文件夹下是否有同名文件，如果有，给文件名加上后缀
		 */
		String parentId = null;
		
		for (FileItem fileItem : fileItemList) {
			if (fileItem.isFormField()) {
				parentId = fileItem.getString("UTF-8");
			} else {
				// 获取文件名、大小、后缀名等信息并设置给file对象
				String filename = fileItem.getName();
				// 截取文件名，因为部分浏览器上传的绝对路径
				int index = filename.lastIndexOf("\\");
				if (index != -1) {
					filename = filename.substring(index + 1);
				}
				//获取后缀名
				String fileExt = null;
				int index2 = filename.lastIndexOf(".");
				if (index2 != -1) {
					fileExt = filename.substring(index2 + 1);
				}
				//获取文件大小
				long size = fileItem.getSize();
				
				/*
				 * 保存文件： 1. 获取文件要保存的路径
				 */
				//读取配置文件，找到文件存放位置
				Properties props = new Properties();
				try {
					props.load(this.getClass().getClassLoader().getResourceAsStream("myDiskConfig.properties"));
				} catch (IOException e) {
					throw new RuntimeException(e);
				}
				/*
				 * 文件保存的路径为服务器保存文件的根目录加上文件的父文件夹的路径
				 */
				//服务器保存文件的根目录
				String rootPath = props.getProperty("rootUrl");
				cn.etu.mydisk.domain.File parent = fileService.findByFid(parentId);
				String savepath =rootPath + parent.getFileurl();
				/*
				 * 2. 创建目标文件
				 */
				File destFile = new File(savepath, filename);
				//如果文件存放的路径不存在，则创建之
				if (!destFile.getParentFile().exists()) {
					destFile.getParentFile().mkdirs();
				}
				//如果文件存放的路径下有重名文件，则在文件名后面添加后缀
				for (int i = 1; destFile.exists() && !destFile.isDirectory() && i < Integer.MAX_VALUE; i++) {
					filename = filename.substring(0, index2) + "(" + i +")." + fileExt;
					destFile = new File(savepath, filename);
				}
				/*
				 * 3. 保存文件
				 */
				try {
					fileItem.write(destFile);// 它会把临时文件重定向到指定的路径，再删除临时文件
				} catch (Exception e) {
					throw new RuntimeException(e);
				}
				//创建文件对象，设置各项属性
				cn.etu.mydisk.domain.File file = new cn.etu.mydisk.domain.File();
				file.setFid(CommonUtils.uuid());
				file.setFname(filename);
				file.setFolder(false);
				file.setFileExt(fileExt);
				file.setFileSize(size);
				file.setFileurl(parent.getFileurl() + "/" + filename);
				file.setDeleted(false);
				file.setUser(user);
				file.setParent(parent);
				file.setPrivated(true);
				file.setCreatetime(new Date());
				file.setDeltime(null);
				file.setRemark(null);
				fileService.addFile(file);
			}
		}

		response.getWriter().print("success");
		System.out.println("success");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
