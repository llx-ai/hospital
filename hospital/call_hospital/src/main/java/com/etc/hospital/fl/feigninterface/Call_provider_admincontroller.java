package com.etc.hospital.fl.feigninterface;

import com.etc.hospital.fl.entity.Admin;
import com.etc.hospital.fl.hystrix.Call_provider_admincontroller_hystrix;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@FeignClient(value="eureka-client-provider")  //填入的是要调用的服务的名字
public interface Call_provider_admincontroller {

    @RequestMapping("/loginManager")
    public Admin loginManager(@RequestBody Admin admin);
}
