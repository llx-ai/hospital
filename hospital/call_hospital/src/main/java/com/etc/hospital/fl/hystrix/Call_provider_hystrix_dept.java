package com.etc.hospital.fl.hystrix;

import com.etc.hospital.fl.entity.Dept;
import com.etc.hospital.fl.feigninterface.Call_provider_deptcontroller;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
public class Call_provider_hystrix_dept implements Call_provider_deptcontroller {
    @Override
    public Dept selectDeptById(Integer dept_id) {
        System.out.println("selectDeptById 不可用");
        return null;
    }

    @Override
    public List<Dept> selectAllDept() {
        System.out.println("selectAllDept 不可用");
        return null;
    }
}
