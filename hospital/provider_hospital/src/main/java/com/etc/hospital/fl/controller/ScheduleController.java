package com.etc.hospital.fl.controller;

import com.etc.hospital.fl.biz.ScheduleBiz;
import com.etc.hospital.fl.dto.Schedule_doctor;
import com.etc.hospital.fl.entity.Schedule;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/scheduleController")
public class ScheduleController {

    @Resource
    private ScheduleBiz biz;


    //根据条件查询排班医生信息
    @RequestMapping("/showScheduleDoctor")
    public List<Schedule_doctor> showScheduleDoctor(@RequestParam Map map){
        return biz.showScheduleDoctor(map);
    }


    //修改排班信息
    @RequestMapping("/updateSchedule")
    public boolean updateSchedule(@RequestParam Map map){
        return biz.updateSchedule(map);
    }

    //根据医生查看排班信息
    @RequestMapping("/showScheduleByDoctor")
    public Schedule showScheduleByDoctor(@RequestParam Integer doctor_id){
        return biz.showScheduleByDoctor(doctor_id);
    }

    //根据科室查看排班信息
    @RequestMapping("/showScheduleByDept")
    public List<Schedule_doctor> showScheduleByDept(@RequestParam Integer deptId){
        return biz.showScheduleByDept(deptId);
    }


    //根据医生姓名模糊查询排班信息
    public List<Schedule_doctor> showScheduleByDoctorName(@RequestParam String doctor_name){
        return biz.showScheduleByDoctorName(doctor_name);
    }
}
