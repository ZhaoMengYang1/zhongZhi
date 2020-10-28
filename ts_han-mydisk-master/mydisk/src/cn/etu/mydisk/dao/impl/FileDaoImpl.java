package cn.etu.mydisk.dao.impl;

import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ColumnListHandler;
import org.apache.commons.dbutils.handlers.MapHandler;
import org.apache.commons.dbutils.handlers.MapListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import cn.etu.mydisk.domain.File;
import cn.etu.mydisk.domain.User;
import cn.etu.mydisk.pager.Expression;
import cn.etu.mydisk.pager.PageBean;
import cn.etu.mydisk.pager.PageConstants;
import cn.hj.commons.CommonUtils;
import cn.hj.jdbc.TxQueryRunner;

public class FileDaoImpl {

	private QueryRunner qr = new TxQueryRunner();

	// 查询所有文件数量
	public int fileCount() {
		try {
			String sql = "SELECT COUNT(*) FROM t_file WHERE deleted=false AND folder=false";
			Number num = (Number) qr.query(sql, new ScalarHandler());
			return num.intValue();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	// 查询所有文件的合计大小
	public long allFileSize() {
		try {
			String sql = "SELECT SUM(fileSize) FROM t_file WHERE deleted=false AND folder=false";
			Number num = (Number) qr.query(sql, new ScalarHandler());
			if (num == null) {
				return 0;
			}
			return num.longValue();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	// 查询所有回收站所有文件的大小
	public long recycledTotalSize() {
		try {
			String sql = "SELECT SUM(fileSize) FROM t_recycled WHERE deleted=false AND folder=false";
			Number num = (Number) qr.query(sql, new ScalarHandler());
			if (num == null) {
				return 0;
			}
			return num.longValue();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	// 查询回收站所有文件的数量
	public int recycledCount() {
		try {
			String sql = "SELECT COUNT(*) FROM t_recycled WHERE deleted=false AND folder=false";
			Number num = (Number) qr.query(sql, new ScalarHandler());
			return num.intValue();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	// 修改文件名
	public void updateName(String fid, String newName, String newFileUrl) {

		try {
			String sql = "UPDATE t_file SET fname=?,fileurl=? WHERE fid=?";
			qr.update(sql, newName, newFileUrl, fid);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	
	//修改子文件的fileurl
	public void batchUpdateChildFileurl(Object[][] params){
		try {
			String sql = "UPDATE t_file SET fileurl=? WHERE fid=?";
			qr.batch(sql, params);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	// 批量删除文件夹或文件夹
	public void batchUpdateDeleted(Object[] fids) {
		/*
		 * 1.把fids转换成一个in子句 2.与update连接在一起生成完整的sql语句
		 */
		try {
			// Object[] fidsArray = fids.split(",");
			String inSql = toInSql(fids.length);
			String sql = "UPDATE t_file SET deleted=true,deltime=? WHERE fid " + inSql;
			// 创建一个比fids长度大1的新数组，把获得的删除时间放在新数组的第一个位置，然后把fids拷贝到新数组后面的位置，生成查询参数
			Timestamp deltime = new Timestamp(System.currentTimeMillis());
			Object[] params = new Object[fids.length + 1];
			params[0] = deltime;
			System.arraycopy(fids, 0, params, 1, fids.length);
			qr.update(sql, params);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	// 批量恢复文件夹或文件夹
	public void batchUpdateRecover(Object[] fidsArray) {
		/*
		 * 1.把fids转换成一个in子句 2.与update连接在一起生成完整的sql语句
		 */
		try {
			String inSql = toInSql(fidsArray.length);
			String sql = "UPDATE t_file SET deleted=false WHERE fid " + inSql;
			qr.update(sql, fidsArray);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	// 把恢复的文件从t_recycled表中删除
	public void delFromRecycled(Object[] fids) {
		/*
		 * 1.把fids转换成一个in子句 2.与update连接在一起生成完整的sql语句
		 */
		try {
			String inSql = toInSql(fids.length);
			String sql = "DELETE FROM t_recycled WHERE fid " + inSql;
			qr.update(sql, fids);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	// 查找要恢复的文件是否有被同时删除的子文件
	public List<Object> findDelChild(Object[] fids) {
		try {
			String inSql = toInSql(fids.length);
			String sql = "SELECT f.fid FROM t_file f LEFT JOIN t_recycled r ON f.fid=r.fid WHERE f.pid " + inSql
					+ "AND r.fid IS NULL";
			return qr.query(sql, new ColumnListHandler(), fids);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	// 查找文件夹下的所有文件和文件夹的fid
	public List<Object> findChild(Object[] fidsArray) {
		try {
			String inSql = toInSql(fidsArray.length);
			String sql = "SELECT fid FROM t_file WHERE pid " + inSql;
			return qr.query(sql, new ColumnListHandler(), fidsArray);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	//查找文件夹下的所有子文件
	public List<File> findByFids(Object[] fidsArray) {
		try {
			String inSql = toInSql(fidsArray.length);
			String sql = "SELECT * FROM t_file WHERE fid " + inSql;
			return qr.query(sql, new BeanListHandler<File>(File.class), fidsArray);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	// 把删除的文件或文件夹放入回收站
	public void addToRecycled(Object[] fidsArray) {
		try {
			String inSql = toInSql(fidsArray.length);
			// 在回收站t_recycled表中增加删除的文件记录
			String sql = "INSERT INTO t_recycled SELECT * FROM t_file WHERE fid " + inSql;
			qr.update(sql, fidsArray);
			// 将createtime设置成删除时的时间,将deltime设置成null
			String sql2 = "UPDATE t_recycled SET deltime=null,createtime=? WHERE fid " + inSql;
			// 创建一个比fidsArray长度大1的新数组，把获得的删除时间放在新数组的第一个位置，然后把fidsArray拷贝到新数组后面的位置，生成查询参数
			Timestamp deltime = new Timestamp(System.currentTimeMillis());
			Object[] params = new Object[fidsArray.length + 1];
			params[0] = deltime;
			System.arraycopy(fidsArray, 0, params, 1, fidsArray.length);
			qr.update(sql2, params);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	// 用来生成in子句
	private String toInSql(int len) {

		StringBuilder sb = new StringBuilder("IN(");
		for (int i = 0; i < len; i++) {
			sb.append("?");
			// 如果不是最后一个？，在？后面添加逗号
			if (i < len - 1) {
				sb.append(",");
			}
		}
		sb.append(")");
		return sb.toString();
	}

	// 创建文件夹或文件夹
	public void addFile(File file) {
		try {
			String sql = "INSERT INTO t_file VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?)";
			String pid;
			if (file.getParent() == null) {
				pid = null;
			} else {
				pid = file.getParent().getFid();
			}
			Object[] params = { file.getFid(), file.getFname(), file.getFolder(), file.getFileExt(), file.getFileSize(),
					file.getFileurl(), false, file.getUser().getUid(), pid, true, file.getCreatetime(),
					file.getDeltime(), file.getRemark() };
			qr.update(sql, params);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	// 查询该用户的该文件夹下所有文件和文件夹
	public PageBean<File> findAll(String uid, String fid, int pageCode) {

		List<Expression> exprList = new ArrayList<Expression>();
		exprList.add(new Expression("uid", "=", uid));
		exprList.add(new Expression("pid", "=", fid));
		exprList.add(new Expression("deleted", "=", "0"));
		return findByCriteria(exprList, pageCode);

	}

	// 将mapList转换成fileList
	private List<File> toFileList(List<Map<String, Object>> mapList) {
		List<File> fileList = new ArrayList<File>();
		for (Map<String, Object> map : mapList) {
			File file = toFile(map);
			fileList.add(file);
		}
		return fileList;
	}

	// 将map转换成file(把map中属于parent和user的属性赋给他们)
	private File toFile(Map<String, Object> map) {
		File file = CommonUtils.toBean(map, File.class);
		User user = CommonUtils.toBean(map, User.class);
		File parent = new File();
		parent.setFid((String) map.get("pid"));
		file.setUser(user);
		file.setParent(parent);
		return file;
	}
	/*
	 * //查询该文件夹下的文件及文件夹数量 private int findCount(String fid) { String sql =
	 * "SELECT COUNT(*) FROM t_file WHERE pid=? AND deleted=false"; Number num;
	 * try { num = (Number) qr.query(sql, new ScalarHandler(), fid); } catch
	 * (SQLException e) { throw new RuntimeException(e); } return
	 * num.intValue(); }
	 */

	// 按文件fid查询
	public File findByFid(String fid) {

		String sql = "SELECT * FROM t_file WHERE fid=?";
		try {
			Map<String, Object> map = qr.query(sql, new MapHandler(), fid);
			File file = toFile(map);
			return file;
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	// 查询该用户已删除的文件和文件夹
	public PageBean<File> findRecycled(String uid, int pc) {
		/*
		 * List<Expression> exprList = new ArrayList<Expression>();
		 * exprList.add(new Expression("uid", "=", uid)); exprList.add(new
		 * Expression("deleted", "=", "1")); return findByCriteria(exprList,
		 * pc);
		 */
		try {
			int pageSize = PageConstants.FILE_PAGE_SIZE;// 每页显示的条目数量
			String sql = "SELECT COUNT(*) FROM t_recycled WHERE uid=? AND deleted=false";
			Number number = (Number) qr.query(sql, new ScalarHandler(), uid);
			int totalRecord = number.intValue();// 得到总记录数
			// 得到当前页记录的beanList
			sql = "SELECT * FROM t_recycled WHERE uid=? AND deleted=false ORDER BY folder DESC, fname ASC limit ?,?";
			List<Map<String, Object>> mapList = qr.query(sql, new MapListHandler(), uid, (pc - 1) * pageSize, pageSize);
			// 将mapList转换成fileList
			List<File> fileList = toFileList(mapList);
			// 创建PageBean，设置参数,其中PageBean没有url，这个任务由Servlet完成
			PageBean<File> pb = new PageBean<>();
			pb.setBeanList(fileList);
			pb.setPageCode(pc);
			pb.setPageSize(pageSize);
			pb.setTotalRecord(totalRecord);
			return pb;
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	// 按文件类型查询该用户所有文件
	public PageBean<File> findByType(String uid, String type, int pageCode) {
		List<Expression> exprList = new ArrayList<Expression>();
		exprList.add(new Expression("uid", "=", uid));
		exprList.add(new Expression("fileExt", "IN", type));
		exprList.add(new Expression("deleted", "=", "0"));
		return findByCriteria(exprList, pageCode);
	}

	// 加载用户文件中除文档、音频、视频、图片以外的其他文件
	public PageBean<File> findOther(String uid, String type, int pageCode) {
		List<Expression> exprList = new ArrayList<Expression>();
		exprList.add(new Expression("uid", "=", uid));
		exprList.add(new Expression("fileExt", "NOT IN", type));
		exprList.add(new Expression("deleted", "=", "0"));
		return findByCriteria(exprList, pageCode);
	}

	/*
	 * 通用查询方法:根据查询条件和要查询的页数，返回查询页beanList
	 */
	private PageBean<File> findByCriteria(List<Expression> exprList, int pc) {
		/*
		 * 传入规则集合和页码，得到pageSize，通过规则集合生成where子句，
		 * 得到总记录数totalRecord，查询得到当前页记录beanList
		 */
		try {
			int pageSize = PageConstants.FILE_PAGE_SIZE;
			// 通过exprList生成where子句
			StringBuilder whereSql = new StringBuilder(" WHERE 1=1");
			List<Object> params = new ArrayList<Object>();// 对应sql语句中问号的值
			/*
			 * 遍历exprList，生成一个条件，以and开头 条件名称 expr.name
			 * 条件运算符expr.operator，可以是=、！=、>、< ... is null，如果是is null则没有值
			 * 如果条件不是is null，再追加问号，然后向params中添加与问号对应的值
			 */
			for (Expression expr : exprList) {
				// 如果运算符是is null，sql子句：WHERE 1=1 and name IS NULL and name
				// operator...
				whereSql.append(" and ").append(expr.getName()).append(" ").append(expr.getOperator()).append(" ");
				// 如果运算符是IN 或者 NOT IN，sql子句：WHERE 1=1 and name IN (?,?,...?) AND
				// name OPERATOR...
				if (expr.getOperator().equalsIgnoreCase("in") || expr.getOperator().equalsIgnoreCase("not in")) {
					whereSql.append("(");
					String[] values = expr.getValue().split(",");
					for (int i = 0; i < values.length; i++) {
						whereSql.append("?");
						params.add(values[i]);
						if (i < values.length - 1) {
							whereSql.append(",");
						}
					}
					whereSql.append(")");
				} else if (!expr.getOperator().equalsIgnoreCase("is null")) {
					// 运算符不是is null，sql子句：WHERE 1=1 and name operator ? and name
					// operator...
					whereSql.append("?");
					params.add(expr.getValue());
				}
			}

			// 得到对应WHERE子句条件下的总记录数
			String sql = "SELECT COUNT(*) FROM t_file" + whereSql;
			Number number = (Number) qr.query(sql, new ScalarHandler(), params.toArray());
			int totalRecord = number.intValue();// 得到总记录数
			// 得到当前页记录的beanList
			sql = "SELECT * FROM t_file" + whereSql + " ORDER BY folder DESC, fname ASC limit ?,?";
			params.add((pc - 1) * pageSize);// 当前页首行记录的下标
			params.add(pageSize);// 查询几行，也就是每页记录数
			List<Map<String, Object>> mapList = qr.query(sql, new MapListHandler(), params.toArray());
			// 将mapList转换成fileList
			List<File> fileList = toFileList(mapList);
			// 创建PageBean，设置参数,其中PageBean没有url，这个任务由Servlet完成
			PageBean<File> pb = new PageBean<>();
			pb.setBeanList(fileList);
			pb.setPageCode(pc);
			pb.setPageSize(pageSize);
			pb.setTotalRecord(totalRecord);
			return pb;
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	//彻底删除回收站的文件
	public void clean(Object[] fidsArray) {
		
		/*
		 * 1.把fids转换成一个in子句 2.与update连接在一起生成完整的sql语句
		 */
		try {
			// Object[] fidsArray = fids.split(",");
			String inSql = toInSql(fidsArray.length);
			String sql = "UPDATE t_recycled SET deleted=true,deltime=? WHERE fid " + inSql;
			// 创建一个比fids长度大1的新数组，把获得的删除时间放在新数组的第一个位置，然后把fids拷贝到新数组后面的位置，生成查询参数
			Timestamp deltime = new Timestamp(System.currentTimeMillis());
			Object[] params = new Object[fidsArray.length + 1];
			params[0] = deltime;
			System.arraycopy(fidsArray, 0, params, 1, fidsArray.length);
			qr.update(sql, params);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}



}
