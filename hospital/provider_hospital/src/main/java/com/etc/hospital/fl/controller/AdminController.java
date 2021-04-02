package com.etc.hospital.fl.controller;

import com.etc.hospital.fl.biz.AdminBiz;
import com.etc.hospital.fl.entity.Admin;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;

@RestController
public class AdminController {
    @Resource
    private AdminBiz biz;

    @RequestMapping("/loginManager")
    public Admin loginManager(@RequestBody Admin admin){
        return biz.loginManager(admin);
    }

}
