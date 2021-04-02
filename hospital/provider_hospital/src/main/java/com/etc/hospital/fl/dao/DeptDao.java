package com.etc.hospital.fl.dao;

import com.etc.hospital.fl.entity.Dept;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface DeptDao {

    //通过id查找部门信息
    Dept selectDeptById(Integer dept_id);

    //查看所有的部门
    List<Dept> selectAllDept();

//    int deleteByPrimaryKey(Integer deptId);
//
//    int insert(Dept record);
//
//    int insertSelective(Dept record);
//
//    Dept selectByPrimaryKey(Integer deptId);
//
//    int updateByPrimaryKeySelective(Dept record);
//
//    int updateByPrimaryKey(Dept record);
}