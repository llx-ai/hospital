package com.etc.hospital.fl.biz;

import com.etc.hospital.fl.entity.Admin;

public interface AdminBiz {
    //管理员登录验证
    Admin loginManager(Admin admin);
}