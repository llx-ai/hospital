package com.etc.hospital.fl.controller;

import com.etc.hospital.fl.dto.DoctorCondition;
import com.etc.hospital.fl.dto.Schedule_doctor;
import com.etc.hospital.fl.entity.Schedule;
import com.etc.hospital.fl.feigninterface.Call_provider_schedulecontroller;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/scheduleController")
public class ScheduleController {

    @Resource
    private Call_provider_schedulecontroller call;

    //根据条件查询排班医生信息
    @RequestMapping("/showScheduleDoctor")
    @ResponseBody
    public List<Schedule_doctor> showScheduleDoctor(Integer deptId, String day , Integer dateId){
        System.out.println("进入showScheduleDoctor");
        System.out.println("部门编号："+deptId+",星期："+day+",上午或下午："+dateId);
        Map map = new HashMap();
        map.put("day",day);
        map.put("deptId",deptId);
        map.put("dateId",dateId);
        List<Schedule_doctor> sche_doc_list = call.showScheduleDoctor(map);
        return sche_doc_list;
    }

    //修改排班信息
    @RequestMapping("/updateSchedule")
    @ResponseBody
    public String updateSchedule(Integer doctor_id, String day , Integer dateId){
        System.out.println("updateSchedule");
        Map map = new HashMap();
        map.put("day",day);
        map.put("doctor_id",doctor_id);
        map.put("dateId",dateId);
        if(call.updateSchedule(map)){
            //修改成功
            return "success";
        }
        return "fail";
    }

    //根据医生查看排班信息
    @RequestMapping("/showScheduleByDoctor")
    public String showScheduleByDoctor(Integer doctor_id, HttpSession session, HttpServletResponse response)throws Exception{
        System.out.println("showScheduleByDoctor");
        response.reset();
        response.setContentType("text/html;charset=utf-8");
        PrintWriter out=response.getWriter();
        Schedule schedule = call.showScheduleByDoctor(3);
        if(schedule!=null){
            System.out.println("查询成功");
            session.setAttribute("scheduleList",schedule);

            out.print("<script>alert('查询成功！！！');location.href='../scheduleTable.jsp';</script>");
            out.flush();
            out.close();
            return "scheduleTable";
        }
        System.out.println("查询失败");
        out.flush();
        out.close();
        return "index";
    }

    //根据科室查看排班信息
    @RequestMapping("/showScheduleByDept")
    public List<Schedule_doctor> showScheduleByDept(Integer deptId){
        List<Schedule_doctor> sche_dept_list = call.showScheduleByDept(deptId);
        return sche_dept_list;
    }

    //根据医生姓名模糊查询
    @RequestMapping("/showScheduleByDoctorName")
    public List<Schedule_doctor> showScheduleByDoctorName(String doctor_name){
        List<Schedule_doctor> sche_doctor_list = call.showScheduleByDoctorName(doctor_name);
        return sche_doctor_list;
    }

    //根据医生id查看个人排班信息
    @RequestMapping("/showScheduleByDoctorId")
    public void showScheduleByDoctorId( HttpSession session, HttpServletResponse response)throws Exception{
        System.out.println("showScheduleByDoctor");
        response.reset();
        response.setContentType("text/html;charset=utf-8");
        PrintWriter out=response.getWriter();
        DoctorCondition condition=(DoctorCondition) session.getAttribute("doctor");

        Schedule schedule = call.showScheduleByDoctor(condition.getDoctor_id());
        if(schedule!=null){
            System.out.println("查询成功");
            session.setAttribute("scheduleList",schedule);
            out.print("<script>location.href='../doctorInfo.jsp';</script>");
        }
        System.out.println("查询失败");
        session.setAttribute("scheduleList",schedule);
        out.print("<script>location.href='../doctorInfo.jsp';</script>");
        out.flush();
        out.close();

    }

}
