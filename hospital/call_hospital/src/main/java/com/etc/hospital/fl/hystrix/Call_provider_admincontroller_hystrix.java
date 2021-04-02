package com.etc.hospital.fl.hystrix;

import com.etc.hospital.fl.entity.Admin;
import com.etc.hospital.fl.feigninterface.Call_provider_admincontroller;
import org.springframework.stereotype.Component;

@Component
public class Call_provider_admincontroller_hystrix implements Call_provider_admincontroller {

    @Override
    public Admin loginManager(Admin admin) {
        System.out.println("远程服务loginManager不可用，请稍后再试");
        return null;
    }
}
