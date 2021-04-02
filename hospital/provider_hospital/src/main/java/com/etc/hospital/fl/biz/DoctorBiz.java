package com.etc.hospital.fl.biz;

import com.etc.hospital.fl.dto.DoctorCondition;
import com.etc.hospital.fl.dto.DoctorShow;
import com.etc.hospital.fl.entity.Doctor;

import java.util.List;

public interface DoctorBiz {


    //管理员插入一个医生的信息
    Boolean insertADoctor(Doctor doctor);



    //根据电话号码和密码判断登录情况
    DoctorCondition checkDoctorLogin(String doctor_phone, String doctor_pwd);

    //管理员查询所有医生的信息
    List<DoctorCondition> selectAllDoctorByAdmin();

    //管理员根据条件查询医生的信息
    List<DoctorCondition> selectDoctorByCondition(DoctorCondition condition);


    //患者医生查询所有医生信息
    List<DoctorShow> selectAllDoctor();

    //医生修改自己的个人信息
    Boolean updateDoctorInfo(DoctorCondition condition);


    //根据电话号码查询
    Integer selectDoctorByPhone(String doctor_phone);



    //通过id查询医生的信息显示在医生或患者页面
    DoctorShow selectDoctorById(Integer doctor_id);

    //通过部门id查询所有该部门下的医生信息显示在医生或患者页面
    List<DoctorShow> selectDoctorByDeptId(Integer dept_id);

    //通过职称id查询该职称下的所有医生信息显示在医生或患者页面
    List<DoctorShow> selectDoctorByRankId(Integer rank_id);

    //修改医生的部门
    boolean updateDoctorDept(Integer doctor_id,Integer dept_id);

    //修改职称
    boolean updateDoctorRank(Integer doctor_id,Integer rank_id);

//    int deleteById(Integer doctorId);//根据id删除
//
//    int insert(Doctor record);//添加
//
//  /*  int insertSelective(Doctor record);//添加（选填）*/
//
//    Doctor selectByPrimaryKey(Integer doctorId);//根据id查找
//
//    int updateByPrimaryKeySelective(Doctor record);//修改（选填）
//
//    int updateByPrimaryKeyWithBLOBs(Doctor record);
//
//    /*int updateByPrimaryKey(Doctor record);*/
}
