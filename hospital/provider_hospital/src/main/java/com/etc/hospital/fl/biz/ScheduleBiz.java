package com.etc.hospital.fl.biz;

import com.etc.hospital.fl.dto.Schedule_doctor;
import com.etc.hospital.fl.entity.Schedule;

import java.util.List;
import java.util.Map;

public interface ScheduleBiz {

    //根据条件查询排班医生信息
    List<Schedule_doctor> showScheduleDoctor(Map map);

    //修改排班信息
    boolean updateSchedule(Map map);

    //根据医生查看排班信息
    Schedule showScheduleByDoctor(Integer doctor_id);

    //根据科室查看排班信息
    List<Schedule_doctor> showScheduleByDept(Integer deptId);

    //根据医生姓名模糊查询排班信息
    List<Schedule_doctor> showScheduleByDoctorName(String doctor_name);
}