package com.etc.hospital.fl.biz.impl;

import com.etc.hospital.fl.biz.DoctorBiz;
import com.etc.hospital.fl.dao.DoctorDao;
import com.etc.hospital.fl.dto.DoctorCondition;
import com.etc.hospital.fl.dto.DoctorShow;
import com.etc.hospital.fl.entity.Doctor;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class DoctorBizImpl implements DoctorBiz {
    @Resource
    private DoctorDao dao;

    @Override
    public Boolean insertADoctor(Doctor doctor) {
        if(dao.selectDoctorByPhone(doctor.getDoctor_phone())>0){
            return false;
        }else {
            return dao.insertADoctor(doctor);
        }
    }


    @Override
    public DoctorCondition checkDoctorLogin(String doctor_phone, String doctor_pwd) {
        return dao.checkDoctorLogin(doctor_phone,doctor_pwd);
    }

    //管理员所有查询医生的信息
    @Override
    public List<DoctorCondition> selectAllDoctorByAdmin() {
        return dao.selectAllDoctorByAdmin();
    }

    //管理员根据条件查询医生的信息
    @Override
    public List<DoctorCondition> selectDoctorByCondition(DoctorCondition condition) {
        return dao.selectDoctorByCondition(condition);
    }

    //患者医生查询所有医生的信息，显示在页面中
    @Override
    public List<DoctorShow> selectAllDoctor() {
        return dao.selectAllDoctor();
    }


    //医生修改自己的个人信息
    @Override
    public Boolean updateDoctorInfo(DoctorCondition condition){
        return dao.updateDoctorInfo(condition);
    }

    @Override
    public Integer selectDoctorByPhone(String doctor_phone) {
        return dao.selectDoctorByPhone(doctor_phone);
    }


    //通过id查询医生的信息显示在医生或患者页面
    @Override
    public DoctorShow selectDoctorById(Integer doctor_id){
        return dao.selectDoctorById(doctor_id);
    }

    //通过部门id查询所有该部门下的医生信息显示在医生或患者页面
    @Override
    public List<DoctorShow> selectDoctorByDeptId(Integer dept_id){
        return dao.selectDoctorByDeptId(dept_id);
    }

    //通过职称id查询该职称下的所有医生信息显示在医生或患者页面
    @Override
    public List<DoctorShow> selectDoctorByRankId(Integer rank_id){
        return dao.selectDoctorByRankId(rank_id);
    }

    @Override
    public boolean updateDoctorDept(Integer doctor_id, Integer dept_id) {
        return dao.updateDoctorDept(doctor_id,dept_id);
    }

    @Override
    public boolean updateDoctorRank(Integer doctor_id, Integer rank_id) {
        return dao.updateDoctorRank(doctor_id,rank_id);
    }

}
