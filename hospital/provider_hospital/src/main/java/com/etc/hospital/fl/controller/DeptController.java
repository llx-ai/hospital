package com.etc.hospital.fl.controller;

import com.etc.hospital.fl.biz.DeptBiz;
import com.etc.hospital.fl.entity.Dept;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import java.util.List;

@RestController
@RequestMapping("/deptController")
public class DeptController {

    @Resource
    private DeptBiz deptBiz;

    //通过id查询部门
    @RequestMapping("/selectDeptById")
    public Dept selectDeptById(@RequestParam Integer dept_id){
        return deptBiz.selectDeptById(dept_id);

        //session.setAttribute("rank",rank);
    }

    //查询全部的部门
    @RequestMapping("/selectAllDept")
    public List<Dept> selectAllDept(){

        List<Dept> deptList= deptBiz.selectAllDept();
        return  deptList;
        //session.setAttribute("rank",rank);

    }

}
