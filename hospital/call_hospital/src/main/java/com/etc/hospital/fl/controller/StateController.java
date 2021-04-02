package com.etc.hospital.fl.controller;


import com.etc.hospital.fl.entity.State;
import com.etc.hospital.fl.feigninterface.Call_provider_statecontroller;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import static java.lang.System.out;

@Controller
@RequestMapping("/statecontroller")
public class StateController {
    @Resource
    private Call_provider_statecontroller biz;

    @RequestMapping("/selectallstate")
    public void selectallstate(HttpSession session, HttpServletResponse response)throws IOException {
        PrintWriter out = response.getWriter();

        List list=biz.selectallstate();
        session.setAttribute("statelist",list);

        //return  "managerSelectRank";
        out.print("<script>location.href='../manageState.jsp';</script>");
        out.flush();
        out.close();


    }
    @RequestMapping("/selectstatebyid")
    public void selectstatebyid(Integer state_id,HttpSession session,HttpServletResponse response)throws IOException{
        out.println("hdhhhdh");
        PrintWriter out = response.getWriter();

        State state =biz.selectstatebyid(state_id);
        session.setAttribute("state",state);

        //return  "managerSelectRank";
        out.print("<script>location.href='../manageState.jsp';</script>");
        out.flush();
        out.close();


    }
}
