package cn.etu.mydisk.utils;

import java.io.File;

import cn.etu.mydisk.exception.FileException;

public class FileUtil {

	/**
	 * 根据路径删除指定的目录或文件，无论存在与否
	 * 
	 * @param sPath
	 *            要删除的目录或文件
	 * @return 删除成功返回 true，否则返回 false。
	 */
	public static boolean DeleteFolder(String sPath) {
		File file = new File(sPath);
		// 判断目录或文件是否存在
		if (!file.exists()) { // 不存在返回 false
			return false;
		} else {
			// 判断是否为文件
			if (file.isFile()) { // 为文件时调用删除文件方法
				return deleteFile(sPath);
			} else { // 为目录时调用删除目录方法
				return deleteDirectory(sPath);
			}
		}
	}

	/**
	 * 删除单个文件
	 * 
	 * @param sPath
	 *            被删除文件的文件名
	 * @return 单个文件删除成功返回true，否则返回false
	 */
	private static boolean deleteFile(String sPath) {
		File file = new File(sPath);
		// 如果文件路径所对应的文件存在，并且是一个文件，则直接删除
		if (file.exists() && file.isFile()) {
			if (file.delete()) {
				return true;
			} else {
				return false;
			}
		} else {
			return false;
		}
	}

	/**
	 * 删除目录（文件夹）以及目录下的文件
	 * 
	 * @param sPath
	 *            被删除目录的文件路径
	 * @return 目录删除成功返回true，否则返回false
	 */
	private static boolean deleteDirectory(String sPath) {
		// 如果sPath不以文件分隔符结尾，自动添加文件分隔符
		if (!sPath.endsWith(File.separator)) {
			sPath = sPath + File.separator;
		}
		File dirFile = new File(sPath);
		// 如果sPath对应的文件不存在，或者不是一个目录，则退出
		if (!dirFile.exists() || !dirFile.isDirectory()) {
			return false;
		}
		boolean flag = true;
		// 删除文件夹下的所有文件(包括子目录)
		File[] files = dirFile.listFiles();
		for (int i = 0; i < files.length; i++) {
			// 删除子文件
			if (files[i].isFile()) {
				flag = deleteFile(files[i].getAbsolutePath());
				if (!flag)
					break;
			} // 删除子目录
			else if (files[i].isDirectory()) {
				flag = deleteDirectory(files[i].getAbsolutePath());
				if (!flag)
					break;
			}
		}
		if (!flag)
			return false;
		// 删除当前目录
		if (dirFile.delete()) {
			return true;
		} else {
			return false;
		}
	}

	/**
	 * 通过文件路径直接修改文件名
	 * 
	 * @param filePath
	 *            需要修改的文件的完整路径
	 * @param newFileName
	 *            需要修改的文件的名称
	 * @return 返回更改后的文件名
	 * @throws FileException
	 */
	public static String FixFileName(String filePath, String newFileName) throws FileException {
		// 存放的路径
		String path = filePath.substring(0, filePath.lastIndexOf("/"));
		// 判断原文件是否存在
		java.io.File oldFile = new java.io.File(filePath);
		if (!oldFile.exists()) {
			throw new FileException("您要修改的文件不存在！");
		}

		// 校验新文件名称是否是空
		if (newFileName == null || newFileName.trim().equals("")) {
			throw new FileException("新文件名不能为空！");
		}

		java.io.File newFile = null;
		if (oldFile.isDirectory()) { // 如果是文件夹
			newFile = new java.io.File(path, newFileName);
			// 如果存放的路径下有重名文件夹，则在文件夹名后面添加后缀
			for (int i = 1; newFile.exists() && newFile.isDirectory() && i < Integer.MAX_VALUE; i++) {
				newFileName = newFileName + "(" + i + ")";
				newFile = new java.io.File(path, newFileName);
			}
		} else { // 如果是文件
			// 获取后缀名,如：.txt .doc .pdf
			String fileExt = null;
			int index = filePath.lastIndexOf(".");
			if (index != -1) {
				fileExt = filePath.substring(index);
			}
			newFile = new java.io.File(path, newFileName + fileExt);
			// 如果文件存放的路径下有重名文件，则在文件名后面添加后缀
			for (int i = 1; newFile.exists() && !newFile.isDirectory() && i < Integer.MAX_VALUE; i++) {
				newFile = new java.io.File(path, newFileName + "(" + i + ")" + fileExt);
			}
		}
		// 修改文件名
		if (oldFile.renameTo(newFile)) { 
			return newFile.getName();
		} else {
			throw new FileException("修改文件名称失败！");
		}
	}

	// 创建文件夹
	public static String createDir(String fname, String savePath) throws FileException {
		File folder = new File(savePath, fname);
		// 如果文件存放的路径不存在，则创建之
		if (!folder.getParentFile().exists()) {
			folder.getParentFile().mkdirs();
		}
		// 如果文件存放的路径下有重名文件夹，则在文件夹名后面添加后缀
		for (int i = 1; folder.exists() && folder.isDirectory() && i < Integer.MAX_VALUE; i++) {
			fname = fname + "(" + i + ")";
			folder = new File(savePath, fname);
		}
		// 创建文件夹
		if (folder.mkdir()) {
			return fname;
		} else {
			throw new FileException("创建文件夹失败！");
		}
	}

}
