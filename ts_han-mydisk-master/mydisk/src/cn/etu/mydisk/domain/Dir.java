package cn.etu.mydisk.domain;

import java.util.Date;

public class Dir {

	private String did;
	private String dname;
	private Dir parent;
	private User user;
	private String imgrul;
	private Boolean privated;
	private String fileurl;
	private Boolean deleted;
	private Date deltime;
	
	public Boolean getDeleted() {
		return deleted;
	}
	public void setDeleted(Boolean deleted) {
		this.deleted = deleted;
	}
	public String getDid() {
		return did;
	}
	public void setDid(String id) {
		this.did = id;
	}
	public String getDname() {
		return dname;
	}
	public void setDname(String name) {
		this.dname = name;
	}
	public Dir getParent() {
		return parent;
	}
	public void setParent(Dir parent) {
		this.parent = parent;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public String getImgrul() {
		return imgrul;
	}
	public void setImgrul(String imgrul) {
		this.imgrul = imgrul;
	}

	public Boolean getPrivated() {
		return privated;
	}
	public void setPrivated(Boolean privated) {
		this.privated = privated;
	}
	public Date getDeltime() {
		return deltime;
	}
	public void setDeltime(Date deltime) {
		this.deltime = deltime;
	}
	public String getFileurl() {
		return fileurl;
	}
	public void setFileurl(String fileurl) {
		this.fileurl = fileurl;
	}
	@Override
	public String toString() {
		return "Dir [id=" + did + ", name=" + dname + ", parent=" + parent + ", user=" + user + ", imgrul=" + imgrul
				+ ", isPrivate=" + privated + ", fileurl=" + fileurl + "]";
	}
	
}
