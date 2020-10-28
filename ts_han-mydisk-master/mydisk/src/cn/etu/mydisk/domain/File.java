package cn.etu.mydisk.domain;

import java.util.Date;

public class File {

	private String fid;
	private String fname;
	private Boolean folder;
	private String fileExt;
	private long fileSize;
	private String fileurl;
	private Boolean deleted;
	private User user;
	private File parent;
	private Boolean privated;
	private Date createtime;
	private Date deltime;
	private String remark;
	
	
	public Boolean getFolder() {
		return folder;
	}
	public void setFolder(Boolean folder) {
		this.folder = folder;
	}
	public String getFileExt() {
		return fileExt;
	}
	public void setFileExt(String fileExt) {
		this.fileExt = fileExt;
	}
	public long getFileSize() {
		return fileSize;
	}
	public void setFileSize(long fileSize) {
		this.fileSize = fileSize;
	}
	public String getFid() {
		return fid;
	}
	public void setFid(String id) {
		this.fid = id;
	}
	public String getFname() {
		return fname;
	}
	public void setFname(String name) {
		this.fname = name;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	public String getFileurl() {
		return fileurl;
	}
	public void setFileurl(String fileurl) {
		this.fileurl = fileurl;
	}
	public Boolean getDeleted() {
		return deleted;
	}
	public void setDeleted(Boolean deleted) {
		this.deleted = deleted;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public File getParent() {
		return parent;
	}
	public void setParent(File parent) {
		this.parent = parent;
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
	public Date getCreatetime() {
		return createtime;
	}
	public void setCreatetime(Date createtime) {
		this.createtime = createtime;
	}
	@Override
	public String toString() {
		return "File [fid=" + fid + ", fname=" + fname + ", folder=" + folder + ", fileExt=" + fileExt + ", fileSize="
				+ fileSize + ", fileurl=" + fileurl + ", deleted=" + deleted + ", user=" + user + ", parent=" + parent
				+ ", privated=" + privated + ", createtime=" + createtime + ", deltime=" + deltime + ", remark="
				+ remark + "]";
	}

	
}
