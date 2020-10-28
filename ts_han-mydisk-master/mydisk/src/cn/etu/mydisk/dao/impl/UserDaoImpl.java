package cn.etu.mydisk.dao.impl;

import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.MapHandler;
import org.apache.commons.dbutils.handlers.MapListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import cn.etu.mydisk.domain.File;
import cn.etu.mydisk.domain.User;
import cn.etu.mydisk.pager.PageBean;
import cn.etu.mydisk.pager.PageConstants;
import cn.hj.commons.CommonUtils;
import cn.hj.jdbc.TxQueryRunner;

public class UserDaoImpl {

	private QueryRunner qr = new TxQueryRunner();

	// 按用户名查找
	public User findByUname(String uname) {
		try {
			String sql = "SELECT * FROM t_user WHERE uname=? AND deleted=false";
			Map<String, Object> map = qr.query(sql, new MapHandler(), uname);
			
			return toBean(map);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	// 查找用户总数
	public int findCount() {
		try {
			String sql = "SELECT COUNT(*) FROM t_user WHERE deleted=false AND uname!='admin'";
			Number num = (Number) qr.query(sql, new ScalarHandler());
			return num.intValue();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	// 添加用户
	public void add(User user) {
		try {
			String sql = "INSERT INTO t_user VALUES(?,?,?,?,?,?,?,?)";
			Object[] params = { user.getUid(), user.getUname(), user.getPassword(), false, false, false,
					new Timestamp(user.getCreateTime().getTime()), user.getHome().getFid()};
			qr.update(sql, params);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	// 分页查询所有用户
	public PageBean<User> findAll(int pc) {
		try {
			int pageSize = PageConstants.FILE_PAGE_SIZE;
			int totalRecord = findCount();
			
			String sql = "SELECT * FROM t_user WHERE deleted=false AND uname!='admin' ORDER BY uname limit ?,?";
			List<Map<String, Object>> mapList = qr.query(sql, new MapListHandler(), (pc - 1) * pageSize, pageSize);
			//mapList 中除了User的信息外，还包含user.home，要把home部分的信息
			//转换成File home，然后设置给user
			List<User> beanList = toBeanList(mapList);
			//创建PageBean，设置参数
			PageBean<User> pb = new PageBean<User>();
			//其中PageBean没有url，这个任务由Servlet完成
			pb.setBeanList(beanList);
			pb.setPageCode(pc);
			pb.setPageSize(pageSize);
			pb.setTotalRecord(totalRecord);

			return pb;
			
			
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	//将mapList转换成beanList
	private List<User> toBeanList(List<Map<String, Object>> mapList) {
		List<User> beanList = new ArrayList<User>();
		for (Map<String,Object> map : mapList) {
			User user = toBean(map);
			beanList.add(user);
		}
		return beanList;
	}
	//把一个map转换成一个Bean
	private User toBean(Map<String, Object> map) {

		if (map == null || map.size() == 0) return null;
		User user = CommonUtils.toBean(map, User.class);
		File home = CommonUtils.toBean(map, File.class);
		user.setHome(home);
		return user;
	}

	//设置用户为删除状态
	public void updateDeleted(String uids) {
		/*
		 * 1.首先把uids转换成数组
		 * 2.把uids转换成一个where子句
		 * 3.与delete from连接在一起生成完整的sql语句
		 */
		try {
			Object[] uidsArray = uids.split(",");
			String whereSql = toWhereSql(uidsArray.length);
			
			String sql = "UPDATE t_user SET deleted=true WHERE " + whereSql;
			qr.update(sql, uidsArray);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	//用来生成where子句
	private String toWhereSql(int len) {
		
		StringBuilder sb = new StringBuilder("uid IN(");
		for (int i = 0; i < len; i++) {
			sb.append("?");
			//如果不是最后一个？，在？后面添加逗号
			if (i < len - 1) {
				sb.append(",");
			}
		}
		sb.append(")");
		return sb.toString();
	}

	//修改用户密码
	public void updatePassword(String uid, String password) {
		
		try {
			String sql = "UPDATE t_user SET password=? WHERE uid=?";
			qr.update(sql, password, uid);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	//设置锁定状态
	public void updateLocked(String uid, Boolean b) {
		
		try {
			String sql = "UPDATE t_user SET locked=? WHERE uid=?";
			qr.update(sql, b, uid);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	//按用户名模糊查找
	public PageBean<User> findByUname(String uname, int pageCode) {
	
		try {
			int pageSize = PageConstants.FILE_PAGE_SIZE;
			int totalRecord = findCount();
			
			String sql = "SELECT * FROM t_user WHERE uname LIKE ? AND uname!='admin' ORDER BY uname limit ?,?";
			String param = "%" + uname + "%";
			List<User> beanList = qr.query(sql, new BeanListHandler<User>(User.class), param, (pageCode - 1) * pageSize, pageSize);
			
			//创建PageBean，设置参数
			PageBean<User> pb = new PageBean<User>();
			//其中PageBean没有url，这个任务由Servlet完成
			pb.setBeanList(beanList);
			pb.setPageCode(pageCode);
			pb.setPageSize(pageSize);
			pb.setTotalRecord(totalRecord);

			return pb;
			
			
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

}
