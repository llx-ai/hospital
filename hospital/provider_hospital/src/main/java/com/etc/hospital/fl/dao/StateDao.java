package com.etc.hospital.fl.dao;

import com.etc.hospital.fl.entity.State;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
@Mapper
public interface StateDao {
    List<State> selectAll();

    State selectById(Integer state_id);

}
