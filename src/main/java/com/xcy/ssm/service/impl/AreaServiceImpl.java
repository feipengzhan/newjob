package com.xcy.ssm.service.impl;

import com.xcy.ssm.mapper.AreaMapper;
import com.xcy.ssm.pojo.Area;
import com.xcy.ssm.service.AreaService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AreaServiceImpl implements AreaService {
    @Autowired
    AreaMapper areaMapper;


    @Override
    public List<Area> getAllProvince() {
        return areaMapper.getALlProvince();
    }

    @Override
    public List<Area> getAllcity(int id) {
        return areaMapper.getAllcity(id);
    }

    @Override
    public List<Area> getAllCont(int id) {
        return areaMapper.getAllCont(id);
    }


}
