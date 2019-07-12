package com.xcy.ssm.controller;

import com.xcy.ssm.pojo.Area;
import com.xcy.ssm.service.AreaService;
import com.xcy.ssm.utils.JedisClientPool;
import com.xcy.ssm.utils.JsonUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
public class AreaController {

    @Autowired
    AreaService areaService;

    @Autowired
    JedisClientPool jedisClientPool;


    @RequestMapping("x1")
    @ResponseBody
    public Object Sheng1() {


        int i =0;
        boolean isEs = jedisClientPool.exists("proviince");
        List<Area> list = null;
        if (isEs) {
            String str1 = jedisClientPool.get("proviince");

            list = JsonUtils.jsonToList(str1, Area.class);


        } else  {
            list = areaService.getAllProvince();
            System.out.println(list.toString());
            jedisClientPool.set("proviince", JsonUtils.objectToJson(list));

        }



            list = areaService.getAllProvince();
            System.out.println(list.toString());




        return list;
    }

    @RequestMapping("x2")
    @ResponseBody
    public Object Sheng2(int id) {

        String ids = Integer.toString(id);
        System.out.println(id + "+++");
        boolean isE = jedisClientPool.exists(ids);
        List<Area> list2 = null;

        if (isE) {
            String str = jedisClientPool.get(ids);
            list2 = JsonUtils.jsonToList(str, Area.class);


        } else  {
            list2 = areaService.getAllcity(id);
            System.out.println(list2.toString());
            jedisClientPool.set(ids, JsonUtils.objectToJson(list2));

        }



        return list2;
    }
    @RequestMapping("x3")
    @ResponseBody
    public Object Sheng3(int id) {
        System.out.println(id + "___");
        List<Area> list3 = areaService.getAllCont(id);
        System.out.println(list3.toString());

        return list3;
    }


}