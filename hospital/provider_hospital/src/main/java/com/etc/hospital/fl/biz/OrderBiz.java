package com.etc.hospital.fl.biz;

import com.etc.hospital.fl.dto.OrderShow;
import com.etc.hospital.fl.entity.Order;

import java.util.Date;
import java.util.List;

public interface OrderBiz {
    int deleteByPrimaryKey(Integer orderId); //根据id删除
    List<OrderShow> selectAll();
    List<OrderShow> selectOrderByCondition(OrderShow orderShow);

    int check();
    Integer selectordersum(String order_date, Integer order_doctor);//根据日期和医生查询当前预约人数
    int insert(Order record);//添加

    /*int insertSelective(Order record);//添加（选填）*/

    Order selectByPrimaryKey(Integer orderId);//根据id查找

    int updateByPrimaryKeySelective(Order record);//修改（选填）

    List<OrderShow> selectbyDoctor(Integer order_doctor);//我收到的预约
    List<OrderShow> selectbypatient(Integer order_patient);//我的预约

   /* int updateByPrimaryKey(Order record);*/
}