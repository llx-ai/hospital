package com.etc.hospital.fl.controller;

import com.etc.hospital.fl.biz.DoctorBiz;
import com.etc.hospital.fl.dto.DoctorCondition;
import com.etc.hospital.fl.dto.DoctorShow;
import com.etc.hospital.fl.entity.Doctor;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import java.util.List;

@RestController
@RequestMapping("/doctorController")
public class DoctorController {

    @Resource
    private DoctorBiz doctorBiz;


    //新增一个doctor信息
    @RequestMapping("/insertADoctor")
    public boolean insertADoctor(@RequestBody Doctor doctor){
        return doctorBiz.insertADoctor(doctor);
    }

    //doctor登录
    @RequestMapping("/checkDoctorLogin")
    public DoctorCondition checkDoctorLogin(@RequestParam String doctor_phone, @RequestParam String doctor_pwd){
        return doctorBiz.checkDoctorLogin(doctor_phone,doctor_pwd);
    }

    //管理员查询所有医生的信息
    @RequestMapping("/selectAllDoctorByAdmin")
    public List<DoctorCondition> selectAllDoctorByAdmin(){
        return doctorBiz.selectAllDoctorByAdmin();
    }

    //管理员根据条件查询医生的信息
    @RequestMapping("/selectDoctorByCondition")
    public List<DoctorCondition> selectDoctorByCondition(@RequestBody DoctorCondition condition){
        return doctorBiz.selectDoctorByCondition(condition);
    }


    //患者医生那边显示所有的doctor信息,无密码
    @RequestMapping("/selectAllDoctor")
    public List<DoctorShow> selectAllDoctor(){
        return doctorBiz.selectAllDoctor();
    }

    //医生修改自己的个人信息
    @RequestMapping("/updateDoctorInfo")
    public Boolean updateDoctorInfo(@RequestBody DoctorCondition condition){
        return doctorBiz.updateDoctorInfo(condition);
    }

    //根据电话查询医生信息
    @RequestMapping("/selectDoctorByPhone")
    public Integer selectDoctorByPhone(@RequestParam String doctor_phone) {
        return doctorBiz.selectDoctorByPhone(doctor_phone);
    }

//    //根据电话查询医生信息
//    @RequestMapping("/selectDoctorById")
//    public Integer selectDoctorByPhone(@RequestParam String doctor_id) {
//        return doctorBiz.selectDoctorByPhone(doctor_id);
//    }


    //通过id查询医生的信息显示在医生或患者页面
    @RequestMapping("/selectDoctorById")
    public DoctorShow selectDoctorById(@RequestParam Integer doctor_id){
        return doctorBiz.selectDoctorById( doctor_id);
    }

    //通过部门id查询所有该部门下的医生信息显示在医生或患者页面
    @RequestMapping("/selectDoctorByDeptId")
    public List<DoctorShow> selectDoctorByDeptId(@RequestParam Integer dept_id){
        return doctorBiz.selectDoctorByDeptId(dept_id);
    }

    //通过职称id查询该职称下的所有医生信息显示在医生或患者页面
    @RequestMapping("/selectDoctorByRankId")
    public List<DoctorShow> selectDoctorByRankId(@RequestParam Integer rank_id){
        return doctorBiz.selectDoctorByRankId(rank_id);
    }


    //修改医生的部门
    @RequestMapping("/updateDoctorDept")
    boolean updateDoctorDept(@RequestParam Integer doctor_id,@RequestParam Integer dept_id){
        return doctorBiz.updateDoctorDept(doctor_id,dept_id);
    }

    //修改职称
    @RequestMapping("/updateDoctorRank")
    boolean updateDoctorRank(@RequestParam Integer doctor_id,@RequestParam Integer rank_id){
        return doctorBiz.updateDoctorRank(doctor_id,rank_id);
    }

}
