package com.etc.hospital.fl.controller;

import com.etc.hospital.fl.biz.StateBiz;
import com.etc.hospital.fl.entity.State;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.List;

@RestController
@RequestMapping("/statecontroller")
public class StateController {
    @Resource
    private StateBiz biz;

    @RequestMapping("/selectallstate")
    public List<State> selectallstate(){
        return biz.selectAll();



    }
    @RequestMapping("/selectstatebyid")
    public State selectstatebyid(@RequestParam Integer state_id){
       return biz.selectById(state_id);

    }
}
