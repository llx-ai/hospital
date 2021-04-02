package com.etc.hospital.fl.biz;

import com.etc.hospital.fl.dto.Patient_Order_Doctor;
import com.etc.hospital.fl.entity.Dept;
import com.etc.hospital.fl.entity.Patient;

import java.util.List;

public interface PatientBiz {
    int deleteByPrimaryKey(Integer patientId);//根据id删除

    int insert(Patient record);//添加

    /*int insertSelective(Patient record);*/

    Patient selectByPrimaryKey(Integer patientId);//根据id查找

    int updateByPrimaryKeySelective(Patient record);//修改（选填）

/*
    int updateByPrimaryKey(Patient record);*/

    //患者登录
    public Patient checkLogin(Patient patient);

    //患者注册
    public int register(Patient patient);

//    //查询所有科室
     public List<Dept> queryAllDept();

    //管理员浏览患者信息
    public List<Patient> queryAllPatient();

    //患者修改个人信息
    public int changeInfo(Patient patient);

    //根据患者id查找患者信息
    public Patient queryPatientById(Integer patient_id);

    //根据患者姓名查询患者信息
    List<Patient> queryPatientByName(String patient_name);

    //根据患者年龄查询患者信息
    List<Patient_Order_Doctor> queryPatientByAge(Integer IsOld);

    //根据患者性别查询患者信息
    List<Patient> queryPatientBySex(Integer patient_sex);

    //根据电话查询用户
    public Patient queryPatientByPhone(String patient_phone);

    List<Patient> selectAll();
    List<Patient> selectPatientCondition(Patient patient);

}