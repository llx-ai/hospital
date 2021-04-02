package com.etc.hospital.fl.controller;

import com.etc.hospital.fl.biz.RankBiz;
import com.etc.hospital.fl.entity.Rank;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.List;

@RestController
@RequestMapping("/rankController")
public class RankController {

    @Resource
    private RankBiz rankBiz;

    //通过id查询职称
    @RequestMapping("/selectRankById")
    public Rank selectRankById(@RequestParam Integer rank_id){
       return rankBiz.selectRankById(rank_id);
       //session.setAttribute("rank",rank);

    }

    //查询全部的职称
    @RequestMapping("/selectAllRank")
    public List<Rank> selectAllRank(){

        List<Rank> rankList= rankBiz.selectAllRank();
        return  rankList;
        //session.setAttribute("rank",rank);

    }

}
