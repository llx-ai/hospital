package com.etc.hospital.fl.biz.impl;

import com.etc.hospital.fl.biz.RankBiz;
import com.etc.hospital.fl.dao.RankDao;
import com.etc.hospital.fl.entity.Rank;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class RankBizImpl implements RankBiz {
    @Resource
    private RankDao dao;

    @Override
    public Rank selectRankById(Integer rank_id) {
        return dao.selectRankById(rank_id);
    }

    @Override
    public List<Rank> selectAllRank() {
        return dao.selectAllRank();
    }
}
