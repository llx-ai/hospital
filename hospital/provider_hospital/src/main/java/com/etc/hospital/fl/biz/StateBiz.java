package com.etc.hospital.fl.biz;

import com.etc.hospital.fl.entity.State;

import java.util.List;

public interface StateBiz {
    List<State> selectAll();

    State selectById(Integer state_id);

}
