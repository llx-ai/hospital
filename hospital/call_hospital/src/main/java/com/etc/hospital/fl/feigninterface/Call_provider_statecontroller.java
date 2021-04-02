package com.etc.hospital.fl.feigninterface;

import com.etc.hospital.fl.entity.State;
import com.etc.hospital.fl.hystrix.Call_provider_hystrix_state;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@FeignClient(value="eureka-client-provider")  //填入的是要调用的服务的名字
public interface Call_provider_statecontroller {
    @RequestMapping("/statecontroller/selectallstate")
    public List<State> selectallstate();


    @RequestMapping("/statecontroller/selectstatebyid")
    public State selectstatebyid(@RequestParam Integer state_id);




}
