package com.etc.hospital.fl.controller;


import com.etc.hospital.fl.biz.OrderBiz;
import com.etc.hospital.fl.dto.OrderShow;
import com.etc.hospital.fl.entity.Order;

import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.Date;
import java.util.List;

@RestController
@RequestMapping("/ordercontroller")
public class OrderController {
    @Resource
    private OrderBiz biz;

    @RequestMapping("/addorder")
    public Integer addorder(@RequestBody Order order){
        biz.check();
        return biz.insert(order);
    }
    @RequestMapping("/selectallorder")
    public List<OrderShow> selectallorder(){
        biz.check();
        return biz.selectAll();
    }
    @RequestMapping("/selectorderbyid")
    public Order selectorderbyid(@RequestParam Integer order_id){
        biz.check();
        return biz.selectByPrimaryKey(order_id);
    }
    @RequestMapping("/updateorder")
    public Integer updateorder(@RequestBody Order order){
        biz.check();
        return biz.updateByPrimaryKeySelective(order);
    }

    @RequestMapping("/selectbydoctor")
    @ResponseBody
    public List<OrderShow> selectbydoctor(@RequestParam Integer order_doctor){
        biz.check();
        return biz.selectbyDoctor(order_doctor);
    }
    @RequestMapping("/selectbypatient")
    @ResponseBody
    public List<OrderShow> selectbypatient(@RequestParam Integer order_patient){
        biz.check();
        return biz.selectbypatient(order_patient);
    }

    @RequestMapping("/selectordersum")
    @ResponseBody
    public Integer selectordersum(@RequestParam String order_date, @RequestParam Integer order_doctor){
        biz.check();
        return biz.selectordersum(order_date,order_doctor);
    }
    @RequestMapping("/selectorderbycondition")
    @ResponseBody
    public List<OrderShow> selectorderbycondition(@RequestBody OrderShow orderShow){
        biz.check();
        return biz.selectOrderByCondition(orderShow);
    }


}
