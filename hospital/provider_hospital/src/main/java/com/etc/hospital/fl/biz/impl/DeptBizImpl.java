package com.etc.hospital.fl.biz.impl;

import com.etc.hospital.fl.biz.DeptBiz;
import com.etc.hospital.fl.dao.DeptDao;
import com.etc.hospital.fl.entity.Dept;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class DeptBizImpl implements DeptBiz {
    @Resource
    private DeptDao dao;

    @Override
    public Dept selectDeptById(Integer dept_id) {
        return dao.selectDeptById(dept_id);
    }

    @Override
    public List<Dept> selectAllDept() {
        return dao.selectAllDept();
    }


    /*@Override
    public int updateByPrimaryKey(Dept record) {
        return dao.updateByPrimaryKey(record);
    }*/
}
