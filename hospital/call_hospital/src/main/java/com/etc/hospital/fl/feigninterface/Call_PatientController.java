package com.etc.hospital.fl.feigninterface;

import com.etc.hospital.fl.dto.Patient_Order_Doctor;
import com.etc.hospital.fl.entity.Dept;
import com.etc.hospital.fl.entity.Patient;
import com.etc.hospital.fl.hystrix.patient;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.Date;
import java.util.List;

@FeignClient(value="eureka-client-provider")  //填入的是要调用的服务的名字
public interface Call_PatientController {

    //患者登录
    @RequestMapping("/checkLogin")
    public Patient checkLogin(@RequestBody Patient patient);

    //患者注册
    @RequestMapping("/register")
    public int register(@RequestBody Patient patient);

    //查看所有科室
    @RequestMapping("/queryAllDept")
    public List<Dept> queryAllDept();

    //管理员浏览患者信息
    @RequestMapping("/queryAllPatient")
    public List<Patient> queryAllPatient();

    //患者修改个人信息
    @RequestMapping("/changeInfo")
    public int changeInfo(@RequestBody Patient patient);

    //根据患者id查询患者信息
    @RequestMapping("/queryPatientById")
    public Patient queryPatientById(@RequestParam Integer patient_id);

    //根据患者姓名模糊查询患者信息
    @RequestMapping("/queryPatientByName")
    public List<Patient> queryPatientByName(@RequestParam String patient_name);

    //根据患者是否成年查询患者信息
    @RequestMapping("/queryPatientByAge")
    public List<Patient_Order_Doctor> queryPatientByAge(@RequestParam Integer IsOld);

    //根据患者性别查询患者信息
    @RequestMapping("/queryPatientBySex")
    public List<Patient> queryPatientBySex(@RequestParam Integer patient_sex);

    @RequestMapping("/queryPatientByPhone")
    public Patient queryPatientByPhone(@RequestParam String patient_phone);

    //通过条件查询
    @RequestMapping("/selectpatientcondition")
    public List<Patient> selectpatientcondition(@RequestBody Patient patient);

}
