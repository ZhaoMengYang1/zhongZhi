package cn.etu.mydisk.service.impl;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import cn.etu.mydisk.dao.impl.FileDaoImpl;
import cn.etu.mydisk.domain.File;
import cn.etu.mydisk.pager.PageBean;
import cn.etu.mydisk.utils.FileUtil;
import cn.hj.jdbc.JdbcUtils;

public class FileServiceImpl {

	private FileDaoImpl fileDao = new FileDaoImpl();

	// 查询所有文件的数量
	public int fileCount() {

		return fileDao.fileCount();
	}

	// 查询所有文件的总大小
	public String allFileSize() {
		long size = fileDao.allFileSize();
		if (size == 0) {
			return "0KB";
		} else if (size > 1024 * 1024 * 1024) {
			return String.format("%.2f", size / (double) (1024 * 1024 * 1024)) + "GB";
		} else if (size > 1024 * 1024) {
			return String.format("%.2f", size / (double) (1024 * 1024)) + "MB";
		} else {
			return String.format("%.2f", size / (double) 1024) + "KB";
		}
	}

	// 查询回收站所有文件的数量
	public int recycledCount() {
		return fileDao.recycledCount();
	}

	// 查询回收站所有文件的总大小
	public String recycledTotalSize() {
		long size = fileDao.recycledTotalSize();
		if (size == 0) {
			return "0KB";
		} else if (size > 1024 * 1024 * 1024) {
			return String.format("%.2f", size / (double) (1024 * 1024 * 1024)) + "GB";
		} else if (size > 1024 * 1024) {
			return String.format("%.2f", size / (double) (1024 * 1024)) + "MB";
		} else {
			return String.format("%.2f", size / (double) 1024) + "KB";
		}
	}

	// 创建文件夹
	public void createFolder(File file) {

		/*
		 * //读取配置文件，找到文件存放位置 Properties props = new Properties(); try {
		 * props.load(this.getClass().getClassLoader().getResourceAsStream(
		 * "myDiskConfig.properties")); } catch (IOException e) { throw new
		 * RuntimeException(e); } //服务器保存文件的根目录 String rootPath =
		 * props.getProperty("rootUrl"); //创建文件夹 String folderPath = rootPath +
		 * "/" +file.getFname(); java.io.File folder = new
		 * java.io.File(folderPath); if (!folder.exists()) { folder.mkdirs(); }
		 * file.setFileurl(folderPath);
		 */
		fileDao.addFile(file);
	}

	// 查询该文件夹下所有的文件和文件夹
	public PageBean<File> findAll(String uid, String fid, int pageCode) {

		return fileDao.findAll(uid, fid, pageCode);
	}

	// 按fid查询文件
	public File findByFid(String fid) {

		return fileDao.findByFid(fid);
	}

	// 按文件类型查找该用户所有文件
	public PageBean<File> findByType(String uid, String type, int pageCode) {

		return fileDao.findByType(uid, type, pageCode);
	}

	// 查找该用户所有已删除的文件和文件夹
	public PageBean<File> findRecycled(String uid, int pageCode) {

		return fileDao.findRecycled(uid, pageCode);
	}

	// 加载用户文件中除文档、音频、视频、图片以外的其他文件
	public PageBean<File> findOther(String uid, String type, int pageCode) {

		return fileDao.findOther(uid, type, pageCode);
	}

	// 添加文件或文件夹
	public void addFile(File file) {

		fileDao.addFile(file);
	}

	// 批量删除文件或文件夹
	public void batchDelete(Object[] fids) {

		/*
		 * 将该文件放入（回收站）t_recycled表中 删除该文件或文件夹
		 */
		try {
			JdbcUtils.beginTransaction();// 开启事务
			fileDao.addToRecycled(fids);// 放入回收站
			batchDeleteFiles(fids);// 删除文件
			JdbcUtils.commitTransaction();// 提交事务
		} catch (SQLException e) {
			try {
				JdbcUtils.rollbackTransaction();
			} catch (SQLException e1) {
				throw new RuntimeException(e1);
			}
			throw new RuntimeException(e);
		}

	}

	/*
	 * 递归删除文件夹 判断该文件是否有子文件，如果有，先删除子文件，然后删除该文件
	 */
	private void batchDeleteFiles(Object[] fids) {
		List<Object> fidsList = fileDao.findChild(fids);
		if (fidsList != null && !fidsList.isEmpty()) {
			batchDeleteFiles(fidsList.toArray());
		}
		fileDao.batchUpdateDeleted(fids);
	}

	// 批量恢复文件或文件夹：如果有子文件，恢复子文件
	public void batchRecover(Object[] fids) {

		/*
		 * 将该文件从（回收站）t_recycled表中移除 恢复该文件 恢复该文件下的子文件
		 */
		try {
			JdbcUtils.beginTransaction();// 开启事务
			fileDao.delFromRecycled(fids);// 从回收站移除
			recoverFiles(fids);// 恢复该文件
			JdbcUtils.commitTransaction();// 提交事务
		} catch (SQLException e) {
			try {
				JdbcUtils.rollbackTransaction();
			} catch (SQLException e1) {
				throw new RuntimeException(e1);
			}
			throw new RuntimeException(e);
		}

		// fileDao.batchUpdateRecover(fids);
	}

	/*
	 * 递归恢复文件夹 判断该文件是否有子文件，如果有，恢复子文件
	 */
	private void recoverFiles(Object[] fids) {

		fileDao.batchUpdateRecover(fids);
		List<Object> fidsList = fileDao.findDelChild(fids);
		if (fidsList != null && !fidsList.isEmpty()) {
			recoverFiles(fidsList.toArray());
		}
	}

	// 修改文件名：如果有子文件，需要修改子文件的fileurl
	public void rename(File oldFile, String newName, String newFileUrl) {

		try {
			JdbcUtils.beginTransaction();// 开启事务
			fileDao.updateName(oldFile.getFid(), newName, newFileUrl);// 修改文件名和fileurl
			Object[] fidsArray = { oldFile.getFid() };
			List<Object> fidsList = fileDao.findChild(fidsArray); // 查找子文件
			if (fidsList != null && !fidsList.isEmpty()) { // 如果有子文件
				changeChildFileurl(oldFile, newFileUrl, fidsList);// 修改子文件的fileurl
			}
			JdbcUtils.commitTransaction();// 提交事务
		} catch (SQLException e) {
			try {
				JdbcUtils.rollbackTransaction();
			} catch (SQLException e1) {
				throw new RuntimeException(e1);
			}
			throw new RuntimeException(e);
		}

	}

	// 修改子文件的fileurl
	private void changeChildFileurl(File oldFile, String newFileUrl, List<Object> fidsList) {
		// 得到所有子文件的id和新的url，放入paramsList中
		List<Object[]> paramsList = new ArrayList<Object[]>();
		paramsList = getParamsList(oldFile.getFileurl(), newFileUrl, fidsList.toArray(), paramsList);
		// 将paramsList转换成二维数组，作为批处理的参数
		Object[][] params = paramsList2Array(paramsList);
		// 批处理修改子文件的fileurl
		fileDao.batchUpdateChildFileurl(params);
	}
	/*
	 * //修改子文件的fileurl private void changeChildUrl(File oldFile, String
	 * newFileUrl) { Object[] fidsArray = { oldFile.getFid() }; List<Object>
	 * fidsList = fileDao.findChild(fidsArray); // 查找子文件 if (fidsList != null &&
	 * !fidsList.isEmpty()) { // 如果有子文件 changeChildFileurl(oldFile, newFileUrl,
	 * fidsList); } }
	 */

	// 将paramsList转换成二维数组，作为批处理的参数
	private Object[][] paramsList2Array(List<Object[]> paramsList) {
		Object[] paramsArray = paramsList.toArray();
		Object[][] params = new Object[paramsArray.length][];
		for (int i = 0; i < paramsArray.length; i++) {
			params[i] = (Object[]) paramsArray[i];
		}
		return params;
	}

	// 递归得到要修改名称的文件的所有子文件的id和新的url，放入paramsList中
	private List<Object[]> getParamsList(String oldFileUrl, String newFileUrl, Object[] fidsArray,
			List<Object[]> paramsList) {
		List<File> fileList = fileDao.findByFids(fidsArray);// 查询出所有的子文件
		for (File file : fileList) {// 将子文件的fid和新的fileurl放入paramsList中
			String s = file.getFileurl().replaceFirst(oldFileUrl, newFileUrl);
			file.setFileurl(s);
			Object[] a = { file.getFileurl(), file.getFid() };
			paramsList.add(a);
		}
		List<Object> fidsList = fileDao.findChild(fidsArray);// 查询子文件的子文件
		if (fidsList != null && !fidsList.isEmpty()) {// 如果子文件还有子文件
			getParamsList(oldFileUrl, newFileUrl, fidsList.toArray(), paramsList);// 得到所有子文件的id和新的url，放入paramsList中
		}
		return paramsList;
	}

	//彻底删除回收站的文件
	public void clean(Object[] fidsArray, String rootPath) {
		
		fileDao.clean(fidsArray);
		//从硬盘上删除文件
		List<File> fileList = fileDao.findByFids(fidsArray);
		for (File file : fileList) {
			FileUtil.DeleteFolder(rootPath + file.getFileurl());
		}
	}

}
