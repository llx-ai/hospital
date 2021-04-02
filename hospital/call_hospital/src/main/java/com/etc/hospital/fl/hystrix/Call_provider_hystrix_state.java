package com.etc.hospital.fl.hystrix;

import com.etc.hospital.fl.entity.Order;
import com.etc.hospital.fl.entity.State;
import com.etc.hospital.fl.feigninterface.Call_provider_statecontroller;
import org.springframework.stereotype.Component;

import java.util.Date;
import java.util.List;

@Component
public class Call_provider_hystrix_state implements Call_provider_statecontroller {
    @Override
    public List<State> selectallstate() {
        System.out.println("selectallstate不可用");
        return null;
    }



    @Override
    public State selectstatebyid(Integer state_id) {
        System.out.println("selectstatebyid不可用");
        return null;
    }


}
