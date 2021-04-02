package com.etc.hospital.fl.biz.impl;

import com.etc.hospital.fl.biz.AdminBiz;
import com.etc.hospital.fl.dao.AdminDao;
import com.etc.hospital.fl.entity.Admin;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service

public class AdminBizImpl implements AdminBiz {
    @Resource
    private AdminDao dao;

    @Override
    public Admin loginManager(Admin admin) {
        return dao.loginManager(admin);
    }
}
