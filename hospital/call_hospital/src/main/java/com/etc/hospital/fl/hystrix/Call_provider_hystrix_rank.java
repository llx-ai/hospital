package com.etc.hospital.fl.hystrix;

import com.etc.hospital.fl.entity.Rank;
import com.etc.hospital.fl.feigninterface.Call_provider_rankcontroller;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
public class Call_provider_hystrix_rank implements Call_provider_rankcontroller {
    @Override
    public Rank selectRankById(Integer rank_id) {
        System.out.println("selectRankById 不可用");
        return null;
    }

    @Override
    public List<Rank> selectAllRank() {
        System.out.println("selectAllRank 不可用");
        return null;
    }
}
