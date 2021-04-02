package com.etc.hospital.fl.feigninterface;


import com.etc.hospital.fl.dto.DoctorCondition;
import com.etc.hospital.fl.dto.DoctorShow;
import com.etc.hospital.fl.entity.Doctor;
import com.etc.hospital.fl.hystrix.Call_provider_hystrix_doctor;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;


@FeignClient(value="eureka-client-provider")  //填入的是要调用的服务的名字
public interface Call_provider_doctorcontroller {


    //新增一个doctor信息
    @RequestMapping("/doctorController/insertADoctor")
    public boolean insertADoctor(@RequestBody Doctor doctor);


    //doctor登录
    @RequestMapping("/doctorController/checkDoctorLogin")
    public DoctorCondition checkDoctorLogin(@RequestParam String doctor_phone, @RequestParam String doctor_pwd);


    //管理员查询所有医生的信息
    @RequestMapping("/doctorController/selectAllDoctorByAdmin")
    public List<DoctorCondition> selectAllDoctorByAdmin();

    //管理员根据条件查询医生的信息
    @RequestMapping("/doctorController/selectDoctorByCondition")
    public List<DoctorCondition> selectDoctorByCondition(@RequestBody DoctorCondition condition);


    //患者医生那边显示所有的doctor信息,无密码
    @RequestMapping("/doctorController/selectAllDoctor")
    public List<DoctorShow> selectAllDoctor();

    //医生修改自己的个人信息
    @RequestMapping("/doctorController/updateDoctorInfo")
    public Boolean updateDoctorInfo(@RequestBody DoctorCondition condition);


    //根据电话查询医生信息
    @RequestMapping("/doctorController/selectDoctorByPhone")
    public Integer selectDoctorByPhone(@RequestParam String doctor_phone);


    //通过id查询医生的信息显示在医生或患者页面
    @RequestMapping("/doctorController/selectDoctorById")
    public DoctorShow selectDoctorById(@RequestParam Integer doctor_id);

    //通过部门id查询所有该部门下的医生信息显示在医生或患者页面
    @RequestMapping("/doctorController/selectDoctorByDeptId")
    public List<DoctorShow> selectDoctorByDeptId(@RequestParam Integer dept_id);

    //通过职称id查询该职称下的所有医生信息显示在医生或患者页面
    @RequestMapping("/doctorController/selectDoctorByRankId")
    public List<DoctorShow> selectDoctorByRankId(@RequestParam Integer rank_id);

    //修改医生的部门
    @RequestMapping("/doctorController/updateDoctorDept")
    boolean updateDoctorDept(@RequestParam Integer doctor_id,@RequestParam Integer dept_id);

    //修改职称
    @RequestMapping("/doctorController/updateDoctorRank")
    boolean updateDoctorRank(@RequestParam Integer doctor_id,@RequestParam Integer rank_id);


}
