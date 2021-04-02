package com.etc.hospital.fl.biz.impl;

import com.etc.hospital.fl.biz.StateBiz;
import com.etc.hospital.fl.dao.StateDao;
import com.etc.hospital.fl.entity.State;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
@Service
public class StateBizImpl implements StateBiz {
    @Resource
    private StateDao dao;
    @Override
    public List<State> selectAll() {
        return dao.selectAll();
    }

    @Override
    public State selectById(Integer state_id) {
        return dao.selectById(state_id);
    }
}
