package com.etc.hospital.fl.feigninterface;

import com.etc.hospital.fl.dto.Schedule_doctor;
import com.etc.hospital.fl.entity.Schedule;
import com.etc.hospital.fl.hystrix.Call_provider_admincontroller_hystrix;
import com.etc.hospital.fl.hystrix.Call_provider_schedulecontroller_hystrix;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;
import java.util.Map;

@FeignClient(value="eureka-client-provider")  //填入的是要调用的服务的名字
public interface Call_provider_schedulecontroller {
    @RequestMapping("/scheduleController/showScheduleDoctor")
    public List<Schedule_doctor> showScheduleDoctor(@RequestParam Map map);

    @RequestMapping("/scheduleController/updateSchedule")
    public boolean updateSchedule(@RequestParam Map map);

    @RequestMapping("/scheduleController/showScheduleByDoctor")
    public Schedule showScheduleByDoctor(@RequestParam Integer doctor_id);

    @RequestMapping("/scheduleController/showScheduleByDept")
    public List<Schedule_doctor> showScheduleByDept(@RequestParam Integer deptId);

    @RequestMapping("/scheduleController/showScheduleByDoctorName")
    public List<Schedule_doctor> showScheduleByDoctorName(@RequestParam String doctor_name);

}
