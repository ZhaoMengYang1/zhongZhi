package com.zz.springMybatis.entitys;

public class UploadContent {
    private String id;

    private String name;

    private String recordsId;

    private String path;

    private String folderNum;

    private String folderTime;

    private String folderType;

    private String projectInfo;

    public UploadContent(String id, String name, String recordsId, String path, String folderNum, String folderTime, String folderType, String projectInfo) {
        this.id = id;
        this.name = name;
        this.recordsId = recordsId;
        this.path = path;
        this.folderNum = folderNum;
        this.folderTime = folderTime;
        this.folderType = folderType;
        this.projectInfo = projectInfo;
    }

    public UploadContent() {
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

    public String getRecordsId() {
        return recordsId;
    }

    public void setRecordsId(String recordsId) {
        this.recordsId = recordsId == null ? null : recordsId.trim();
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

	@Override
	public String toString() {
		return "UploadContent [id=" + id + ", name=" + name + ", recordsId=" + recordsId + ", path=" + path
				+ ", folderNum=" + folderNum + ", folderTime=" + folderTime + ", folderType=" + folderType
				+ ", projectInfo=" + projectInfo + "]";
	}
    
    
    
    
}