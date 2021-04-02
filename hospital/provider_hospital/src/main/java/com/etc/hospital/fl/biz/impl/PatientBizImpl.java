package com.etc.hospital.fl.biz.impl;

import com.etc.hospital.fl.biz.PatientBiz;
import com.etc.hospital.fl.dao.PatientDao;
import com.etc.hospital.fl.dto.Patient_Order_Doctor;
import com.etc.hospital.fl.entity.Dept;
import com.etc.hospital.fl.entity.Patient;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class PatientBizImpl implements PatientBiz {
    @Resource
    private PatientDao dao;

    @Override
    public List<Patient> selectAll() {
        return dao.selectAll();
    }

    @Override
    public List<Patient> selectPatientCondition(Patient patient) {
        return dao.selectPatientCondition(patient);
    }

    @Override
    public Patient queryPatientByPhone(String patient_phone) {
        return dao.queryPatientByPhone(patient_phone);
    }

    //根据是否成年查询患者信息
    @Override
    public List<Patient_Order_Doctor> queryPatientByAge(Integer IsOld){
      return dao.queryPatientByAge(IsOld);
    }

    //根据患者姓名查询患者信息
    @Override
    public List<Patient> queryPatientByName(String patient_name){
     return dao.queryPatientByName(patient_name);
    }

    //根据患者性别查询患者信息
    @Override
    public List<Patient> queryPatientBySex(Integer patient_sex){
        return dao.queryPatientBySex(patient_sex);
    }


    //根据患者id查找患者信息
    @Override
    public Patient queryPatientById(Integer patient_id){
        return dao.queryPatientById(patient_id);
    }

    //患者修改个人信息
    @Override
    public int changeInfo(Patient patient){
        return dao.changeInfo(patient);
    }

    //管理员浏览所有患者信息
    @Override
    public List<Patient> queryAllPatient(){
        return dao.queryAllPatient();
    }

    //查询所有科室
    @Override
    public List<Dept> queryAllDept(){
        return dao.queryAllDept();
    }

    //患者注册
    @Override
    public int register(Patient patient){
        return dao.register(patient);
    }

    //患者登录
    @Override
    public Patient checkLogin(Patient patient){
        return dao.checkLogin(patient);
    }

    @Override
    public int deleteByPrimaryKey(Integer patientId) {
        return dao.deleteByPrimaryKey(patientId);
    }

    @Override
    public int insert(Patient record) {
        return dao.insert(record);
    }

   /* @Override
    public int insertSelective(Patient record) {
        return insertSelective(record);
    }*/

    @Override
    public Patient selectByPrimaryKey(Integer patientId) {
        return dao.selectByPrimaryKey(patientId);
    }

    @Override
    public int updateByPrimaryKeySelective(Patient record) {
        return dao.updateByPrimaryKeySelective(record);
    }

  /*  @Override
    public int updateByPrimaryKey(Patient record) {
        return dao.updateByPrimaryKey(record);
    }*/
}
