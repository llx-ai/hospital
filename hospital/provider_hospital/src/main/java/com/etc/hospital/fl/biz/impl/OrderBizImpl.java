package com.etc.hospital.fl.biz.impl;

import com.etc.hospital.fl.biz.OrderBiz;
import com.etc.hospital.fl.dao.OrderDao;
import com.etc.hospital.fl.dto.OrderShow;
import com.etc.hospital.fl.entity.Order;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Date;
import java.util.List;

@Service
public class OrderBizImpl implements OrderBiz {
    @Resource
    private OrderDao dao;
    @Override
    public int deleteByPrimaryKey(Integer orderId) {
        return dao.deleteByPrimaryKey(orderId);
    }

    @Override
    public int insert(Order record) {
        return dao.insert(record);
    }

    @Override
    public Order selectByPrimaryKey(Integer orderId) {
        return dao.selectByPrimaryKey(orderId);
    }

    @Override
    public int updateByPrimaryKeySelective(Order record) {
        return dao.updateByPrimaryKeySelective(record);
    }



    @Override
    public List<OrderShow> selectAll() {
        return dao.selectAll();
    }

    @Override
    public List<OrderShow> selectbyDoctor(Integer order_doctor) {
        return dao.selectbyDoctor(order_doctor);
    }

    @Override
    public List<OrderShow> selectbypatient(Integer order_patient) {
        return dao.selectbypatient(order_patient);
    }

    @Override
    public int check() {
        return dao.check();
    }

    @Override
    public Integer selectordersum(String order_date, Integer order_doctor) {
        return dao.selectordersum(order_date,order_doctor);
    }

    @Override
    public List<OrderShow> selectOrderByCondition(OrderShow orderShow) {
        return dao.selectOrderByCondition(orderShow);
    }
}
