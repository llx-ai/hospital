package com.etc.hospital.fl.controller;

import com.etc.hospital.fl.entity.Rank;
import com.etc.hospital.fl.feigninterface.Call_provider_rankcontroller;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.PrintWriter;
import java.util.List;

@Controller
@RequestMapping("/rankController")
public class RankController {

    @Resource
    private Call_provider_rankcontroller call;


    @RequestMapping("/selectRankById")
    public void selectRankById(Integer rank_id, HttpSession session, HttpServletResponse response, HttpServletRequest request)throws Exception{
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        Rank rank=call.selectRankById(rank_id);
        session.setAttribute("rank",rank);

        //return "managerSelectRank";

        out.print("<script>location.href='../manageRank.jsp';</script>");
        out.flush();
        out.close();

    }

    //查询全部的职称
    @RequestMapping("/selectAllRank")
    public void selectAllRank( HttpSession session, HttpServletResponse response, HttpServletRequest request)throws Exception{
        PrintWriter out = response.getWriter();

        List<Rank> rankList= call.selectAllRank();
        session.setAttribute("rankList",rankList);
        //return  "managerSelectRank";
        out.print("<script>location.href='../manageRank.jsp';</script>");
        out.flush();
        out.close();

    }

    //查询全部的职称
    @RequestMapping("/selectAllRank1")
    @ResponseBody
    public List<Rank> selectAllRank1(){

        List<Rank> rankList= call.selectAllRank();
        return  rankList;


    }



}
