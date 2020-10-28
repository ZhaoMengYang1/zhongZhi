package com.zz.springMybatis.mappers;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.zz.springMybatis.entitys.UploadContent;

@Repository
public interface UploadContentMapper {
    int deleteByPrimaryKey(String id);

    int insert(UploadContent record);

    int insertSelective(UploadContent record);

    UploadContent selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(UploadContent record);

    int updateByPrimaryKey(UploadContent record);
    
    List<UploadContent> getAllContent();
    
    
    
    
}