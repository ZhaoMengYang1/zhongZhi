package com.zz.springMybatis.updownLoad;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemIterator;
import org.apache.commons.fileupload.FileItemStream;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.io.FilenameUtils;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.MultipartResolver;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
			
@WebServlet("/uploadFolder")
public class UploadFolder extends HttpServlet{
	
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private String Storage_PATH = "D:/upload";

	public void doPost(HttpServletRequest request,HttpServletResponse response) {
		
		System.out.println("uploadFolder上传文件夹===========================");
		
		DiskFileItemFactory factory = new DiskFileItemFactory();
		
		ServletFileUpload upload = new ServletFileUpload(factory);
		
		upload.setHeaderEncoding("UTF-8");
		
		if(!ServletFileUpload.isMultipartContent(request)) {
			return;
		}
		
		try {
			fileItem(request,upload);
		} catch (FileUploadException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
        
		
	}
	
	public void fileItem(HttpServletRequest request, ServletFileUpload upload) throws FileUploadException {
		
		
		List<FileItem> list = upload.parseRequest(request);
		
		String savePath = "D/upload";
		String folderName;
		String folderName02;
		System.out.println(list);
		for(FileItem item : list) {
			String fileName = item.getName();
			System.out.println("item.getName01======"+ fileName);
			if(fileName ==null || fileName.trim().equals("")) {
				continue;
			}
			System.out.println("item.getName02======"+ fileName);
			
			
			folderName = fileName.substring(fileName.lastIndexOf("/")+1);
			
			String temp = fileName.substring(0,fileName.indexOf("/" +folderName));
			folderName02= fileName.substring(fileName.lastIndexOf("/")+1);
			System.out.println("folderName====================="+ folderName);
			System.out.println("temp================" + temp);
			System.out.println("folderName02=====================" + folderName02);
			
			
		}
	}
	
	

	
	
	
	
	public void doGet(HttpServletRequest request,HttpServletResponse response) {
		doPost(request,response);
	}
	

}
