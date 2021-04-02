package com.etc.hospital.fl.hystrix;

import com.etc.hospital.fl.dto.Patient_Order_Doctor;
import com.etc.hospital.fl.entity.Dept;
import com.etc.hospital.fl.entity.Patient;
import com.etc.hospital.fl.feigninterface.Call_PatientController;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.RequestBody;

import java.util.List;

@Component
public class patient implements Call_PatientController {
    //患者登录
    @Override
    public Patient checkLogin(Patient patient){
        System.out.println("登录服务调用失败");
        return null;
    }

    //患者注册
    @Override
    public int register(Patient patient){
        System.out.println("患者注册服务调用失败");
        return 0;
    }

    //查询所有科室
    @Override
    public List<Dept> queryAllDept(){
        System.out.println("查询所有科室服务调用失败");
        return null;
    }

    //管理员浏览患者信息
    @Override
    public List<Patient> queryAllPatient(){
        System.out.println("管理员浏览患者信息服务调用失败");
        return null;
    }

    //患者修改个人信息
    @Override
    public int changeInfo(Patient patient){
        System.out.println("患者修改个人信息服务调用失败");
        return 0;
    }

    //根据患者id查找患者
    @Override
    public Patient queryPatientById(Integer patient_id){
        System.out.println("患者修改个人信息服务调用失败");
        return null;
    }

    //根据患者姓名查找患者
    @Override
    public List<Patient> queryPatientByName(String patient_name){
        System.out.println("患者姓名查询服务调用失败");
        return null;
    }

    //根据患者是否成年查找患者
    @Override
    public List<Patient_Order_Doctor> queryPatientByAge(Integer IsOld){
        System.out.println("患者是否成年服务调用失败");
        return null;
    }

    //根据患者性别查找患者
    @Override
    public List<Patient> queryPatientBySex(Integer patient_sex){
        System.out.println("患者性别服务调用失败");
        return null;
    }

    @Override
    public Patient queryPatientByPhone(String patient_phone) {
        System.out.println("患者电话服务调用失败");
        return null;
    }

    @Override
    public List<Patient> selectpatientcondition(Patient patient) {
        System.out.println("selectpatientcondition 不可用");
        return null;
    }
}
