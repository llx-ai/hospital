package com.etc.hospital.fl.feigninterface;


import com.etc.hospital.fl.entity.Dept;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@FeignClient(value="eureka-client-provider")  //填入的是要调用的服务的名字
public interface Call_provider_deptcontroller {


    //通过id查询部门
    @RequestMapping("/deptController/selectDeptById")
    public Dept selectDeptById(@RequestParam Integer dept_id);

    //查询全部的部门
    @RequestMapping("/deptController/selectAllDept")
    public List<Dept> selectAllDept();

}
