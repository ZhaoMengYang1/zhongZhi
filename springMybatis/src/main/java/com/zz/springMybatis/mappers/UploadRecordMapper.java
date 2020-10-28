package com.zz.springMybatis.mappers;

import com.zz.springMybatis.entitys.UploadRecord;

public interface UploadRecordMapper {
    int deleteByPrimaryKey(String id);

    int insert(UploadRecord record);

    int insertSelective(UploadRecord record);

    UploadRecord selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(UploadRecord record);

    int updateByPrimaryKey(UploadRecord record);
}