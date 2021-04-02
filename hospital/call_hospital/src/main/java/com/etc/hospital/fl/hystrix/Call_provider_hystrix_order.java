package com.etc.hospital.fl.hystrix;

import com.etc.hospital.fl.dto.OrderShow;
import com.etc.hospital.fl.entity.Order;
import com.etc.hospital.fl.entity.State;
import com.etc.hospital.fl.feigninterface.Call_provider_ordercontroller;
import com.etc.hospital.fl.feigninterface.Call_provider_statecontroller;
import org.springframework.stereotype.Component;

import java.util.Date;
import java.util.List;

@Component
public class Call_provider_hystrix_order implements Call_provider_ordercontroller {


    @Override
    public Integer addorder(Order order) {
        System.out.println("selectallstate不可用");
        return null;
    }

    @Override
    public List<OrderShow> selectallorder() {
        System.out.println("selectallorder不可用");
        return null;
    }



    @Override
    public Order selectorderbyid(Integer order_id) {
        System.out.println("selectorderbyid不可用");
        return null;
    }

    @Override
    public Integer updateorder(Order order) {
        System.out.println("updateorder不可用");
        return null;
    }

    @Override
    public List<OrderShow> selectbydoctor(Integer order_doctor) {
        System.out.println("selectbydoctor不可用");
        return null;
    }

    @Override
    public List<OrderShow> selectbypatient(Integer order_patient) {
        System.out.println("selectbypatient不可用");
        return null;
    }

    @Override
    public Integer selectordersum(String order_date, Integer order_doctor) {
        System.out.println("selectordersum不可用");
        return 0;
    }


    @Override
    public List<OrderShow> selectorderbycondition(OrderShow orderShow) {
        System.out.println("selectorderbycondition 不可用");
        return null;
    }
}
