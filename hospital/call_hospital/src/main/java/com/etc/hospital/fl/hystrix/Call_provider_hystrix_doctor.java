package com.etc.hospital.fl.hystrix;

import com.etc.hospital.fl.dto.DoctorCondition;
import com.etc.hospital.fl.dto.DoctorShow;
import com.etc.hospital.fl.entity.Doctor;
import com.etc.hospital.fl.feigninterface.Call_provider_doctorcontroller;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
public class Call_provider_hystrix_doctor implements Call_provider_doctorcontroller {
    @Override
    public boolean insertADoctor(Doctor doctor) {
        System.out.println("insertADoctor 不可用");

        return false;
    }

    @Override
    public DoctorCondition checkDoctorLogin(String doctor_phone, String doctor_pwd) {
        System.out.println("checkDoctorLogin 不可用");
        return null;
    }

    @Override
    public List<DoctorCondition> selectAllDoctorByAdmin() {
        System.out.println("selectAllDoctorByAdmin 不可用");
        return null;
    }

    @Override
    public List<DoctorCondition> selectDoctorByCondition(DoctorCondition condition) {
        return null;
    }

    @Override
    public List<DoctorShow> selectAllDoctor() {
        return null;
    }

    @Override
    public Boolean updateDoctorInfo(DoctorCondition condition) {
        return null;
    }

    @Override
    public Integer selectDoctorByPhone(String doctor_phone) {
        return null;
    }

    @Override
    public DoctorShow selectDoctorById(Integer doctor_id) {
        return null;
    }

    @Override
    public List<DoctorShow> selectDoctorByDeptId(Integer dept_id) {
        return null;
    }

    @Override
    public List<DoctorShow> selectDoctorByRankId(Integer rank_id) {
        return null;
    }

    @Override
    public boolean updateDoctorDept(Integer doctor_id, Integer dept_id) {
        return false;
    }

    @Override
    public boolean updateDoctorRank(Integer doctor_id, Integer rank_id) {
        return false;
    }

}
