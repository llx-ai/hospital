package com.etc.hospital.fl.hystrix;

import com.etc.hospital.fl.dto.Schedule_doctor;
import com.etc.hospital.fl.entity.Schedule;
import com.etc.hospital.fl.feigninterface.Call_provider_schedulecontroller;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;
import java.util.Map;

@Component
public class Call_provider_schedulecontroller_hystrix implements Call_provider_schedulecontroller {
    @Override
    public List<Schedule_doctor> showScheduleDoctor(@RequestParam Map map) {
        System.out.println("远程服务showScheduleDoctor不可用，请稍后再试");
        return null;
    }

    @Override
    public boolean updateSchedule(@RequestParam Map map) {
        System.out.println("远程服务updateSchedule不可用，请稍后再试");
        return false;
    }

    @Override
    public Schedule showScheduleByDoctor(@RequestParam Integer doctor_id) {
        System.out.println("远程服务showScheduleByDoctor不可用，请稍后再试");
        return null;
    }

    @Override
    public List<Schedule_doctor> showScheduleByDept(Integer deptId) {
        System.out.println("远程服务showScheduleByDept不可用，请稍后再试");
        return null;
    }

    @Override
    public List<Schedule_doctor> showScheduleByDoctorName(String doctor_name) {
        System.out.println("远程服务showScheduleByDoctorName不可用，请稍后再试");
        return null;
    }
}
