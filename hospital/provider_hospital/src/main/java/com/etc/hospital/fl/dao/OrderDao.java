package com.etc.hospital.fl.dao;

import com.etc.hospital.fl.dto.OrderShow;
import com.etc.hospital.fl.entity.Order;
import com.etc.hospital.fl.entity.State;
import org.apache.ibatis.annotations.Mapper;

import java.util.Date;
import java.util.List;

@Mapper
public interface OrderDao {
    int deleteByPrimaryKey(Integer orderId);

    List<OrderShow> selectAll();

    List<OrderShow> selectOrderByCondition(OrderShow orderShow);

    int insert(Order record);
    int check();
    Integer selectordersum(String order_date, Integer order_doctor);



    Order selectByPrimaryKey(Integer orderId);

    int updateByPrimaryKeySelective(Order record);
    List<OrderShow> selectbyDoctor(Integer order_doctor);
    List<OrderShow> selectbypatient(Integer order_patient);

}