package com.etc.hospital.fl.biz;

import com.etc.hospital.fl.entity.Dept;

import java.util.List;

public interface DeptBiz {

    //通过id查找部门信息
    Dept selectDeptById(Integer dept_id);


    //查看所有的部门
    List<Dept> selectAllDept();

//    int deleteByPrimaryKey(Integer deptId);//根据id删除
//
//
//
//    int insert(Dept record);//添加
//
//    /*int insertSelective(Dept record);//添加（选填）*/
//
//    Dept selectByPrimaryKey(Integer deptId);//根据id查找
//
//    int updateByPrimaryKeySelective(Dept record);//修改（选填）

   /* int updateByPrimaryKey(Dept record);*/
}