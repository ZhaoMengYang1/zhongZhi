package cn.etu.mydisk.user.web.servlet;

import java.io.FileInputStream;
import java.io.IOException;
import java.util.Properties;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.IOUtils;

import cn.etu.mydisk.domain.File;
import cn.etu.mydisk.service.impl.FileServiceImpl;
import cn.etu.mydisk.utils.DownloadUtils;

/**
 * Servlet implementation class DownloadServleet
 */
@WebServlet(name="DownloadServlet", urlPatterns="/DownloadServlet")
public class DownloadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private FileServiceImpl fileService = new FileServiceImpl();
	private Properties props = new Properties();

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String fid = request.getParameter("fid");
		File file = fileService.findByFid(fid);
		/*
		 * 两个头：1.Content-Type 2.Content-Disposition
		 * 一个流:下载文件的数据
		 */
		//使下载框显示中文文件名不出乱码
		//String framename = new String(filename.getBytes("GBK"), "ISO-8859-1");//（有时不管用，比如edge）
		String framename = DownloadUtils.filenameEncoding(file.getFname(), request);
		
		String contentType = this.getServletContext().getMimeType(file.getFname());//通过文件名称获得MIME类型
		String contentDisposition = "attachment;filename=" + framename;

		// 读取配置文件
		try {
			props.load(this.getClass().getClassLoader().getResourceAsStream("myDiskConfig.properties"));
		} catch (IOException e) {
			throw new RuntimeException(e);
		}
		// 找到服务器保存文件的根目录
		String rootPath = props.getProperty("rootUrl");
		//得到读取硬盘文件的流
		FileInputStream input = new FileInputStream(rootPath + file.getFileurl());
		//设置头
		response.setHeader("content-Type", contentType);
		response.setHeader("content-Disposition", contentDisposition);
		//获取输出到客户端的输出流
		ServletOutputStream output = response.getOutputStream();
		//调用commons-io中的API把输入流的数据写入到输出流中
		IOUtils.copy(input, output);
		//关闭输入流
		input.close();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
