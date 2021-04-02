package com.etc.hospital.fl.dao;

import com.etc.hospital.fl.entity.Admin;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface AdminDao {

    //管理员登录验证
    Admin loginManager(Admin admin);
}