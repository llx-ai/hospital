package com.etc.hospital.fl.dao;

import com.etc.hospital.fl.entity.Rank;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface RankDao {
    //int deleteByPrimaryKey(Integer rankId);

    //int insert(Rank record);

    //int insertSelective(Rank record);

    //Rank selectByPrimaryKey(Integer rankId);

    //查一个
    Rank selectRankById(Integer rank_id);

    //查询全部
    List<Rank> selectAllRank();

    //int updateByPrimaryKeySelective(Rank record);

    //int updateByPrimaryKey(Rank record);
}