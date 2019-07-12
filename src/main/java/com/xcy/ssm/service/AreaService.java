package com.xcy.ssm.service;

import com.xcy.ssm.pojo.Area;

import java.util.List;

public interface AreaService {




    List<Area> getAllProvince();


    List<Area> getAllcity(int id);

    List<Area> getAllCont(int id);
}
