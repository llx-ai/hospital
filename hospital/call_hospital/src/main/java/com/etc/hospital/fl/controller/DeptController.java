package com.etc.hospital.fl.controller;

import com.etc.hospital.fl.entity.Dept;
import com.etc.hospital.fl.feigninterface.Call_provider_deptcontroller;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.List;

@Controller
@RequestMapping("/deptController")
public class DeptController {

    @Resource
    private Call_provider_deptcontroller call;

    //通过id查询部门
    @RequestMapping("/selectDeptById")
    public void selectDeptById(Integer dept_id){

        call.selectDeptById(dept_id);


        //session.setAttribute("rank",rank);
    }

    //查询全部的部门
    @RequestMapping("/selectAllDept")
    @ResponseBody
    public List<Dept> selectAllDept(){

        List<Dept> deptList= call.selectAllDept();
        return  deptList;

        //session.setAttribute("rank",rank);

    }





}
