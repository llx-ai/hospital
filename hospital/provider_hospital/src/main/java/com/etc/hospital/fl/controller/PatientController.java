package com.etc.hospital.fl.controller;

import com.etc.hospital.fl.biz.PatientBiz;
import com.etc.hospital.fl.dto.Patient_Order_Doctor;
import com.etc.hospital.fl.entity.Dept;
import com.etc.hospital.fl.entity.Patient;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.List;

@RestController
public class PatientController {
    @Resource
    private PatientBiz biz;

    @RequestMapping("selectpatientcondition")
    @ResponseBody
    public List<Patient> selectpatientcondition(@RequestBody Patient patient){

        return biz.selectPatientCondition(patient);
    }

    //患者登录
    @RequestMapping("/checkLogin")
    public Patient checkLogin(@RequestBody Patient patient){
        return biz.checkLogin(patient);
    }

    //患者注册
    @RequestMapping("/register")
    public int register(@RequestBody Patient patient) {
         return biz.register(patient);
    }


///查看所有科室
    @RequestMapping("/queryAllDept")
    public List<Dept> queryAllDept(){
        return biz.queryAllDept();
    }

    //管理员浏览所有用户信息
    @RequestMapping("/queryAllPatient")
    public List<Patient> queryAllPatient(){
        return biz.queryAllPatient();
    }

    //根据患者姓名模糊查询患者信息
    @RequestMapping("/queryPatientByName")
    public List<Patient> queryPatientByName(@RequestParam String patient_name) {
       return biz.queryPatientByName(patient_name);
    }

//    根据患者性别查询患者信息
    @RequestMapping("/queryPatientBySex")
    public List<Patient> queryPatientBySex(@RequestParam Integer patient_sex){
        return biz.queryPatientBySex(patient_sex);
    }
    //根据患者是否成年查询患者信息
    @RequestMapping("/queryPatientByAge")
    public List<Patient_Order_Doctor> queryPatientByAge(@RequestParam Integer IsOld){
        return  biz.queryPatientByAge(IsOld);
    }

    //患者修改个人信息
    @RequestMapping("/changeInfo")
    public int changeInfo(@RequestBody Patient patient){
        return biz.changeInfo(patient);
    }

    //根据患者id查询患者信息
    @RequestMapping("/queryPatientById")
    public Patient queryPatientById(@RequestParam Integer patient_id){
        return biz.queryPatientById(patient_id);
    }


    //根据电话查询用户
    @RequestMapping("/queryPatientByPhone")
    public Patient queryPatientByPhone(@RequestParam String patient_phone){
        return biz.queryPatientByPhone(patient_phone);
    }
}
