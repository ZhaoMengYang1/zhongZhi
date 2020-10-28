package cn.etu.mydisk.domain;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

public class User {

	private String uid;//主键
	private String uname;//用户名
	private String password;//密码
	private String password2;
	private Boolean locked;//是否锁定
	private Boolean admin;//是否管理员
	private Boolean deleted;//是否删除
	private Date createTime;//创建时间
	private int diskSize;//网盘大小
	private File home;//用户的根文件夹
	private Map<String, String> errors = new HashMap<String, String>();
	
	
	public File getHome() {
		return home;
	}

	public void setHome(File home) {
		this.home = home;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public int getDiskSize() {
		return diskSize;
	}

	public void setDiskSize(int diskSize) {
		this.diskSize = diskSize;
	}

	public Boolean getDeleted() {
		return deleted;
	}

	public void setDeleted(Boolean deleted) {
		this.deleted = deleted;
	}




	public Map<String, String> getErrors() {
		return errors;
	}




	public void setErrors(Map<String, String> errors) {
		this.errors = errors;
	}
	
	//添加用户校验
	public boolean addValidate() {
		
		boolean isOK = true;
		
		if (this.uname == null || this.uname.trim().equals("")) {
			isOK = false;
			
			errors.put("uname", "用户名不能为空");
			
		}else if (!this.uname.matches("^[a-zA-Z][a-zA-Z0-9_]*${3,8}")) {
			isOK = false;
			errors.put("uname","用户名必须由3-8个字母、数字组成，且以字母开头");
		}
		
		if (this.password == null || this.password.trim().equals("")) {
			isOK = false;
			errors.put("password", "密码不能为空");
		}else if (!this.password.matches("[A-Za-z0-9]{1,20}")) {
			isOK = false;
			errors.put("password","密码必须由1-20位字母数字组合");
		}

		return isOK;
	}
	
	//修改密码校验
	public boolean pwdValidate() {
		
		boolean isOK = true;

		if (this.password == null || this.password.trim().equals("")) {
			isOK = false;
			errors.put("password", "密码不能为空");
		}else if (!this.password.matches("[A-Za-z0-9]{1,20}")) {
			isOK = false;
			errors.put("password","密码必须由1-20位字母数字组合");
		}
		
		if (this.password2 == null || this.password2.trim().equals("")) {
			isOK = false;
			errors.put("password2", "第二次输入密码不能为空");
		}else if (!this.password2.equals(this.password)) {
			isOK = false;
			errors.put("password2","两次密码必须一致。");
		}

		return isOK;
	}
	//用户登陆校验
	public boolean loginValidate() {
		
		boolean isOK = true;
		
		if (this.uname == null || this.uname.trim().equals("")) {
			isOK = false;
			
			errors.put("uname", "用户名不能为空");
			
		}else if (!this.uname.matches("^[a-zA-Z][a-zA-Z0-9_]*${3,8}")) {
			isOK = false;
			errors.put("uname","用户名必须由3-8个字母、数字组成，且以字母开头");
		}
		
		if (this.password == null || this.password.trim().equals("")) {
			isOK = false;
			errors.put("password", "密码不能为空");
		}else if (!this.password.matches("[A-Za-z0-9]{1,20}")) {
			isOK = false;
			errors.put("password","密码必须由1-20位字母数字组合");
		}

		return isOK;
	}
	
	//用户名不能为空：3-8字母数字组成，字母开头
		//密码不能空，6-20字母数组组合
		//邮箱不能为空且符合格式
		//生日可以空，如果不空则格式必须正确
		//昵称不能为空，且必须是汉字
		public boolean validate() {
			
			boolean isOK = true;
			
			if (this.uname == null || this.uname.trim().equals("")) {
				isOK = false;
				
				errors.put("uname", "用户名不能为空");
				
			}else if (!this.uname.matches("^[a-zA-Z][a-zA-Z0-9_]*${3,8}")) {
				isOK = false;
				errors.put("uname","用户名必须由3-8个字母、数字组成，且以字母开头");
			}
			
			if (this.password == null || this.password.trim().equals("")) {
				isOK = false;
				errors.put("password", "密码不能为空");
			}else if (!this.password.matches("[A-Za-z0-9]{1,20}")) {
				isOK = false;
				errors.put("password","密码必须由1-20位字母数字组合");
			}
			
			if (this.password2 == null || this.password2.trim().equals("")) {
				isOK = false;
				errors.put("password2", "第二次输入密码不能为空");
			}else if (!this.password2.equals(this.password)) {
				isOK = false;
				errors.put("password2","两次密码必须一致。");
			}
			/*
			if (this.email == null || this.email.trim().equals("")) {
				isOK = false;
				errors.put("email", "邮箱不能为空");
			}else if (!this.email.matches("\\w+@\\w+(\\.\\w+)+")) {
				isOK = false;
				errors.put("email","邮箱格式不正确");
			}
			
			if (this.birthday != null && !this.birthday.trim().equals("")) {
				try {
					DateLocaleConverter dlc = new DateLocaleConverter();
					dlc.convert(this.birthday, "yyyy-MM-dd");
				} catch (Exception e) {
					isOK = false;
					errors.put("birthday", "日期格式不正确");
				}
			}
			
			if (this.nickname == null || this.nickname.trim().equals("")) {
				isOK = false;
				errors.put("nickname", "昵称不能为空");
			}else if (!this.nickname.matches("[\u4e00-\u9fa5]+")) {
				isOK = false;
				errors.put("nickname","昵称必须是汉字");
			}
			*/
			return isOK;
		}



	@Override
		public String toString() {
			return "User [uid=" + uid + ", uname=" + uname + ", password=" + password + ", password2=" + password2
					+ ", locked=" + locked + ", admin=" + admin + ", deleted=" + deleted + ", createTime=" + createTime
					+ ", diskSize=" + diskSize + ", home=" + home + ", errors=" + errors + "]";
		}

	public String getUid() {
		return uid;
	}
	public void setUid(String uid) {
		this.uid = uid;
	}
	public String getUname() {
		return uname;
	}
	public void setUname(String uname) {
		this.uname = uname;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getPassword2() {
		return password2;
	}
	public void setPassword2(String password2) {
		this.password2 = password2;
	}
	public Boolean getLocked() {
		return locked;
	}
	public void setLocked(Boolean locked) {
		this.locked = locked;
	}
	public Boolean getAdmin() {
		return admin;
	}
	public void setAdmin(Boolean isAdmin) {
		this.admin = isAdmin;
	}
	
}
