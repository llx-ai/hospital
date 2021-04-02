package com.etc.hospital.fl.feigninterface;

import com.etc.hospital.fl.dto.OrderShow;
import com.etc.hospital.fl.entity.Order;
import com.etc.hospital.fl.hystrix.Call_provider_hystrix_order;
import com.etc.hospital.fl.hystrix.Call_provider_hystrix_state;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.Date;
import java.util.List;

@FeignClient(value="eureka-client-provider")  //填入的是要调用的服务的名字
public interface Call_provider_ordercontroller {


    @RequestMapping("/ordercontroller/addorder")
    public Integer addorder(@RequestBody Order order);

    @RequestMapping("/ordercontroller/selectallorder")
    public List<OrderShow> selectallorder();

    @RequestMapping("/ordercontroller/selectorderbyid")
    public Order selectorderbyid(@RequestParam Integer order_id);

    @RequestMapping("/ordercontroller/updateorder")
    public Integer updateorder(@RequestBody Order order);

    @RequestMapping("/ordercontroller/selectbydoctor")
    public List<OrderShow> selectbydoctor(@RequestParam Integer order_doctor);

    @RequestMapping("/ordercontroller/selectbypatient")
    public List<OrderShow> selectbypatient(@RequestParam Integer order_patient);
    @RequestMapping("/ordercontroller/selectordersum")
    public Integer selectordersum(@RequestParam String order_date, @RequestParam Integer order_doctor);
    @RequestMapping("/ordercontroller/selectorderbycondition")
    public List<OrderShow> selectorderbycondition(@RequestBody OrderShow orderShow);




}
