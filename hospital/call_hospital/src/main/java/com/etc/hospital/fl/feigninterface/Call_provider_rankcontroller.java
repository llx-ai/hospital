package com.etc.hospital.fl.feigninterface;

import com.etc.hospital.fl.entity.Rank;
import com.etc.hospital.fl.hystrix.Call_provider_hystrix_rank;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@FeignClient(value="eureka-client-provider")  //填入的是要调用的服务的名字
public interface Call_provider_rankcontroller {


    //通过id查询职称
    @RequestMapping("/rankController/selectRankById")
    public Rank selectRankById(@RequestParam Integer rank_id);


    //查询全部的职称
    @RequestMapping("/rankController//selectAllRank")
    public List<Rank> selectAllRank();


}
