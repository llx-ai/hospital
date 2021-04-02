package com.etc.hospital.fl.biz.impl;

import com.etc.hospital.fl.biz.ScheduleBiz;
import com.etc.hospital.fl.dao.ScheduleDao;
import com.etc.hospital.fl.dto.Schedule_doctor;
import com.etc.hospital.fl.entity.Schedule;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

@Service
public class ScheduleBizImpl implements ScheduleBiz {
    @Resource
    private ScheduleDao dao;

    @Override
    public List<Schedule_doctor> showScheduleDoctor(Map map) {
        return dao.showScheduleDoctor(map);
    }

    @Override
    public boolean updateSchedule(Map map) {
        return dao.updateSchedule(map);
    }

    @Override
    public Schedule showScheduleByDoctor(Integer doctor_id) {
        return dao.showScheduleByDoctor(doctor_id);
    }

    @Override
    public List<Schedule_doctor> showScheduleByDept(Integer deptId) {
        return dao.showScheduleByDept(deptId);
    }

    @Override
    public List<Schedule_doctor> showScheduleByDoctorName(String doctor_name) {
        return dao.showScheduleByDoctorName(doctor_name);
    }
}
