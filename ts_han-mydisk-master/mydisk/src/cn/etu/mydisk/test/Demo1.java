package cn.etu.mydisk.test;

import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.junit.Test;

import cn.etu.mydisk.dao.impl.FileDaoImpl;
import cn.etu.mydisk.domain.File;
import cn.etu.mydisk.domain.User;
import cn.hj.jdbc.JdbcUtils;
import cn.hj.jdbc.TxQueryRunner;

public class Demo1 {

	@Test
	public void test1() throws ParseException {
		File f1 = new File();
		f1.setParent(null);
		f1.setFid("1");

		File f2 = new File();
		f2.setParent(f1);
		f2.setFid("2");

		File f3 = new File();
		f3.setParent(f2);
		f3.setFid("3");

		File f4 = new File();
		f4.setParent(f3);
		f4.setFid("4");

		List<String> pl = new ArrayList<String>();
		pl = getPathList(f4, f1.getFid(), pl);

		System.out.println(pl);
	}

	private List<String> getPathList(File currentFile, String homeid, List<String> pathList) {
		// List<String> pathList = new ArrayList<String>();
		System.out.println(currentFile.getFid());
		if (currentFile.getParent().getFid().equals(homeid)) {
			pathList.add(currentFile.getFid());
			return pathList;
		} else {
			pathList.add(currentFile.getFid());
			return getPathList(currentFile.getParent(), homeid, pathList);
		}
	}

	@Test
	public void test2() throws SQLException {
		QueryRunner qr = new TxQueryRunner();
		long l = (long) 1234567890123l;
		User user = new User();
		user.setUid("111");
		user.setUname("qq");
		user.setPassword("123");
		File f = new File();
		f.setFid("12121212");
		f.setFname("test111");
		f.setFileSize(l);
		f.setFileurl("qqq");
		f.setUser(user);
		System.out.println(f);
		String sql = "INSERT INTO t_file (fid,fname,fileSize,fileurl,uid) VALUES(?,?,?,?,?)";
		qr.update(sql, f.getFid(), f.getFname(), f.getFileSize(), f.getFileurl(), f.getUser().getUid());
	}

	@Test
	public void test3() throws ParseException {
		File f1 = new File();
		f1.setParent(null);
		f1.setFid("1");

		File f2 = new File();
		f2.setParent(f1);
		f2.setFid("2");

		File f3 = new File();
		f3.setParent(f2);
		f3.setFid("3");

		File f4 = new File();
		f4.setParent(f3);
		f4.setFid("4");

		List<File> pl = new ArrayList<File>();

		pl = getPathList1(f4, f1.getFid(), pl);
		Collections.reverse(pl);
		System.out.println("===========================");
		// System.out.println(getParent(f4, f1.getFid()));
		System.out.println("===========================");
		System.out.println(pl);
		for (File file : pl) {
			System.out.println(file);
		}
	}

	/*
	 * private String getParent(File currentFile, String homeid){ //List<String>
	 * pathList = new ArrayList<String>();
	 * System.out.println(currentFile.getFid()); if
	 * (currentFile.getParent().getFid().equals(homeid)) { return homeid; } else
	 * { // pathList.add(currentFile.getParent().getFid()); return
	 * getParent(currentFile.getParent(), homeid); } }
	 */
	private List<File> getPathList1(File currentFile, String homeid, List<File> pathList) {
		// List<String> pathList = new ArrayList<String>();
		System.out.println(currentFile.getFid());
		if (currentFile.getParent().getFid().equals(homeid)) {
			pathList.add(currentFile.getParent());
			return pathList;
		} else {
			pathList.add(currentFile.getParent());
			return getPathList1(currentFile.getParent(), homeid, pathList);
		}
	}

	@Test
	public void test4() {

		String s1 = "/wangwu/天津";
		String s2 = "/wangwu/北.京/东城/四惠";
		s2 = s2.replaceFirst("/wangwu/北.京", s1);
		System.out.println(s2);
	}

	FileDaoImpl fileDao = new FileDaoImpl();

	@Test
	public void test5() {
		/*
		 * 1.修改文件的名称和url 2.修改文件的子文件的url a.查询子文件 b.添加修改子文件url到批处理
		 */

		/*
		 * fids = findChild();
		 *  if(fids != null); 
		 *  changeChildUrl(oldUrl newUrl fids ){
		 *   getParams();
		 *   paramsToArray();
		 *   dao.updateChildUrl(params);
		 *   }
		 */

		String oldFileUrl = "/wangwu/北京";
		String fid = "630AFD0C2C22438CAB22739F106EDC23";
		// String fid= "61531591FB042208A669FE1DCD6F9B7";
		String newFileUrl = "/wangwu/tianjin";
		Object[] fidsArray = { fid };
		List<Object> fidsList = fileDao.findChild(fidsArray);

		List<Object[]> paramsList = new ArrayList<Object[]>();
		paramsList = getParamsList(oldFileUrl, newFileUrl, fidsList.toArray(), paramsList);
		Object[][] params = paramsList2Array(paramsList);
		for (int i = 0; i < params.length; i++) {
			for (int j = 0; j < params[i].length; j++) {
				System.out.println(params[i][j]);
			}
		}
		// fileDao.updateChildFileurl((Object[][]) params.toArray());
	}

	// 将paramsList转换成二维数组，作为批处理的参数
	private Object[][] paramsList2Array(List<Object[]> paramsList) {
		Object[] paramsArray = paramsList.toArray();
		Object[][] params = new Object[paramsArray.length][];
		for (int i = 0; i < paramsArray.length; i++) {
			params[i] = (Object[]) paramsArray[i];
		}
		return params;
	}
	//递归得到要修改名称的文件的所有子文件的id和新的url，放入paramsList中
	private List<Object[]> getParamsList(String oldFileUrl, String newFileUrl, Object[] fidsArray,
			List<Object[]> paramsList) {
		List<File> fileList = fileDao.findByFids(fidsArray);
		for (File file : fileList) {
			String s = file.getFileurl().replaceFirst(oldFileUrl, newFileUrl);
			file.setFileurl(s);
			Object[] a = { file.getFileurl(), file.getFid() };
			paramsList.add(a);
		}
		List<Object> fidsList = fileDao.findChild(fidsArray);
		if (fidsList != null && !fidsList.isEmpty()) {
			getParamsList(oldFileUrl, newFileUrl, fidsList.toArray(), paramsList);
			;
		}
		return paramsList;
	}

	private List<Object[]> getParams(String oldFileUrl, String newFileUrl, Object[] fidsArray, List<Object[]> params) {
		List<Object> fidsList = fileDao.findChild(fidsArray);
		if (fidsList != null && !fidsList.isEmpty()) {
			List<File> fileList = fileDao.findByFids(fidsArray);
			for (File file : fileList) {
				String s = file.getFileurl().replaceFirst(oldFileUrl, newFileUrl);
				file.setFileurl(s);
				Object[] a = { file.getFileurl(), file.getFid() };
				params.add(a);
			}
			getParams(oldFileUrl, newFileUrl, fidsList.toArray(), params);
			;
		}
		return params;
	}

}
