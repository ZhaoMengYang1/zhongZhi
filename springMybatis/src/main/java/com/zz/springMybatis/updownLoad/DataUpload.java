package com.zz.springMybatis.updownLoad;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItemIterator;
import org.apache.commons.fileupload.FileItemStream;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.io.FilenameUtils;

@WebServlet("/DataUpload")
public class DataUpload extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response){
		System.out.println("上传文件夹============================");
	    ServletFileUpload upload = new ServletFileUpload();
	    FileItemIterator fileIterator;
	    try {
	        fileIterator = upload.getItemIterator(request);
	        InputStream inputStream = null;
	        BufferedReader br = null;
	        System.out.println("CheckPoint 1");
	        while(fileIterator.hasNext()) {
	            System.out.println("CheckPoint 2");
	            FileItemStream item = fileIterator.next();
	            String inputFileName = FilenameUtils.getName(item.getName());
	            inputStream = item.openStream();

	            inputFileName = inputFileName.split("\\.")[0];
	            List<String[]> list = new ArrayList<String[]>();                
	            // Getting File
	            br = new BufferedReader(new InputStreamReader(inputStream));    // Getting the object to read file
	            String line;
	            while((line = br.readLine())!= null){// While condition ends then end of file is reached.
	                list.add(line.split(","));
	            }
	            // Checking if File is Empty
	            if (list.size() == 0){
	                System.err.println("File Empty");
	            }else{
	                // TODO : Parameter Parser.
	                // DO JOB HERE
	            }           
	        }
	    } catch (FileUploadException e) {
	        // TODO Auto-generated catch block
	        e.printStackTrace();
	    } catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public void doGet(HttpServletRequest request,HttpServletResponse response) {
		doPost(request,response);
	}
}
