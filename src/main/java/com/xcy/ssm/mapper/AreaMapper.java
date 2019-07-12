package com.xcy.ssm.mapper;

import com.xcy.ssm.pojo.Area;

import java.util.List;

public interface AreaMapper {


    List<Area> getALlProvince();


    List<Area> getAllcity(int id);

    List<Area> getAllCont(int id);
}
