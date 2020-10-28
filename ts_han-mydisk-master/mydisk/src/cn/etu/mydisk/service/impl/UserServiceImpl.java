package cn.etu.mydisk.service.impl;

import java.util.List;

import cn.etu.mydisk.dao.impl.UserDaoImpl;
import cn.etu.mydisk.domain.User;
import cn.etu.mydisk.exception.UserException;
import cn.etu.mydisk.pager.PageBean;
import cn.hj.commons.CommonUtils;

public class UserServiceImpl {

	private UserDaoImpl userDao = new UserDaoImpl();

	// 用户登陆
	public User login(User form) throws UserException {
		String password = CommonUtils.md5(form.getPassword());
		User user = userDao.findByUname(form.getUname());
		if (user == null)
			throw new UserException("用户名不存在");
		if (!user.getPassword().equals(password))
			throw new UserException("密码错误，请重新输入。");
		if (user.getLocked())
			throw new UserException("用户已被锁定，请联系管理员解锁。");
		return user;
	}

	// 查询所有用户数量
	public int findCount() {
		return userDao.findCount();
	}

	// 添加用户
	public void add(User form) throws UserException {
		User user = userDao.findByUname(form.getUname());
		if (user != null) {
			throw new UserException("用户名已存在");
		} else {
			userDao.add(form);
		}
	}

	// 查询所有用户数量
	public PageBean<User> findAll(int pc) {
		return userDao.findAll(pc);
	}

	//删除用户
	public void batchDelete(String uids) {
		
		userDao.updateDeleted(uids);
	}

	//重置用户密码为1
	public void changePassword(String uid, String password) {
		
		userDao.updatePassword(uid, password);
	}

	//锁定和解锁
	public void lock(String uid, String flag) {
		Boolean b = false;
		if (flag.equals("1")) {
			b = true;
		}
		userDao.updateLocked(uid, b);
	}

	//按用户名模糊查找
	public PageBean<User> findByUname(String uname, int pageCode) {
		// TODO Auto-generated method stub
		return userDao.findByUname(uname, pageCode);
	}
	

}
