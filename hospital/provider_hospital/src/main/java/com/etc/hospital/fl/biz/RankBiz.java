package com.etc.hospital.fl.biz;

import com.etc.hospital.fl.entity.Rank;

import java.util.List;

public interface RankBiz {

    //查一个
    Rank selectRankById(Integer rank_id);

    //查询全部
    List<Rank> selectAllRank();















    //int deleteByPrimaryKey(Integer rankId);//根据id删除

    //int insert(Rank record);//添加

    /*int insertSelective(Rank record);*/

    //Rank selectByPrimaryKey(Integer rankId);//根据id查找

   // int updateByPrimaryKeySelective(Rank record);//修改（选填）

   /* int updateByPrimaryKey(Rank record);*/
}