package com.etc.hospital.fl.controller;

import com.alibaba.fastjson.JSONObject;
import com.etc.hospital.fl.entity.Patient;
import com.etc.hospital.fl.util.Config;
import com.zhenzi.sms.ZhenziSmsClient;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.PrintWriter;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;

@Controller
@RequestMapping("/changeController")
public class ChangeController {

    @RequestMapping("/loginChange")
    public ModelAndView loginChange(String phone,String password,String check,HttpSession session){
        Map map = new HashMap();
        System.out.println("进入loginChange");
        if ("2".equals(check)) {//医生的权限
            map.put("doctor_phone",phone);
            map.put("doctor_pwd",password);
            return new ModelAndView("redirect:/doctorController/checkDoctorLogin",map);
        }
        else if("1".equals(check)) {//患者
            map.put("patient_phone",phone);
            map.put("patient_pwd",password);
            return new ModelAndView("redirect:/PatientController/checkLogin",map);
        }else{
            map.put("name",phone);
            map.put("pwd",password);
            return new ModelAndView("redirect:/adminController/loginManager",map);
        }

    }




    @RequestMapping("/checkUser")
    public void checkUser(HttpSession session,HttpServletResponse response,HttpServletRequest request)throws Exception{
        response.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
        PrintWriter out = response.getWriter();
        System.out.println("进入checkUser");
        if(session.getAttribute("user")!=null){
            System.out.println("成功！");

        }
        out.print("<script>location.href='../login.jsp';</script>");
        out.flush();
        out.close();
    }

    //发送验证码
    @RequestMapping("/sendCode")
    @ResponseBody
    public String sendCode(String u_tel,HttpSession session)throws Exception{
        System.out.println("进入sendCode:"+u_tel);
        JSONObject json = null;
        //生成6位验证码
        String verifyCode = String.valueOf(new Random().nextInt(8999) + 1000);
        session.setAttribute(u_tel,verifyCode);
        System.out.println("验证码: "+verifyCode);
        //发送短信
        ZhenziSmsClient client = new ZhenziSmsClient(Config.apiUrl, Config.appId, Config.appSecret);
        Map<String, Object> params = new HashMap<String, Object>();
        params.put("number", u_tel);
        params.put("templateId", "3728");
        String[] templateParams = {verifyCode, "5分钟内有效"};
        params.put("templateParams", templateParams);
        String result = client.send(params);
        json = JSONObject.parseObject(result);
        System.out.println("发送情况："+json.getString("data"));
        if(json.getIntValue("code") == 0){//发送短信成功
            System.out.println("发送成功");
            return verifyCode;
        }
        System.out.println("验证码发送失败");
        return "fail";
//        return "1234";
    }

    //转发页面：到预约页面
    @RequestMapping("/gotoAppointment")
    public void gotoAppointment(String time, Integer doctor_id, HttpServletResponse response, HttpSession session)throws Exception{
        response.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
        PrintWriter out = response.getWriter();
        session.setAttribute("order_date",time);
        session.setAttribute("order_doctor",doctor_id);
//        out.print("<script>location.href='../appointment.jsp';</script>");
        out.flush();
        out.close();

    }

}
