package com.etc.hospital.fl.controller;

import com.etc.hospital.fl.entity.Admin;
import com.etc.hospital.fl.feigninterface.Call_provider_admincontroller;
import org.apache.http.HttpResponse;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.PrintWriter;

@Controller
@RequestMapping("/adminController")
public class AdminController {

    @Resource
    private Call_provider_admincontroller call;

    //管理员验证登录
    @RequestMapping("/loginManager")
    public void loginManager(String name, String pwd, HttpServletResponse response, HttpSession session)throws Exception{
        response.setContentType("text/html;charset=utf-8");
        PrintWriter out=response.getWriter();
        Admin user = new Admin();
        user.setAdmin_name(name);
        user.setAdmin_pwd(pwd);
        Admin admin =call.loginManager(user);
        if(admin!=null){
            //管理员登录成功,把管理员信息保存到session中
            System.out.println("管理员登录成功11111！");
            session.setAttribute("admin",admin);
            //跳转后台界面***
            out.print("<script>alert('登录成功！！！');location.href='../manageindex.jsp';</script>");
        }
        out.print("<script>alert('用户名或密码错误！！！');history.go(-1);</script>");

        out.flush();
        out.close();
    }

}
