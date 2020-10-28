package com.zz.springMybatis.entitys;

import java.util.Date;

public class UploadRecord {
    private String id;

    private String name;

    private Date date;

    private String path;

    private String folderNum;

    private String folderTime;

    private String folderType;

    private String projectInfo;

    public UploadRecord(String id, String name, Date date, String path, String folderNum, String folderTime, String folderType, String projectInfo) {
        this.id = id;
        this.name = name;
        this.date = date;
        this.path = path;
        this.folderNum = folderNum;
        this.folderTime = folderTime;
        this.folderType = folderType;
        this.projectInfo = projectInfo;
    }

    public UploadRecord() {
        super();
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id == null ? null : id.trim();
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public String getPath() {
        return path;
    }

    public void setPath(String path) {
        this.path = path == null ? null : path.trim();
    }

    public String getFolderNum() {
        return folderNum;
    }

    public void setFolderNum(String folderNum) {
        this.folderNum = folderNum == null ? null : folderNum.trim();
    }

    public String getFolderTime() {
        return folderTime;
    }

    public void setFolderTime(String folderTime) {
        this.folderTime = folderTime == null ? null : folderTime.trim();
    }

    public String getFolderType() {
        return folderType;
    }

    public void setFolderType(String folderType) {
        this.folderType = folderType == null ? null : folderType.trim();
    }

    public String getProjectInfo() {
        return projectInfo;
    }

    public void setProjectInfo(String projectInfo) {
        this.projectInfo = projectInfo == null ? null : projectInfo.trim();
    }
}