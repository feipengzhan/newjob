<%--
  Created by IntelliJ IDEA.
  User: Wang
  Date: 2019/7/8 0008
  Time: 下午 21:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title></title>




</head>
<body>
省：
<select style="width: 100px;" id="pre" onchange="chg(this);">
    <option value="-1">请选择</option>
</select>
市：
<select style="width: 100px;" id="city" onchange="chg2(this)" ;></select>
区：
<select style="width: 100px;" id="area"></select>



<script>

    //声明省
    var pres = ["北京", "上海", "山东"]; //直接声明Array
    //声明市
    var cities = [
        ["东城", "昌平", "海淀"],
        ["浦东", "高区"],
        ["济南", "青岛"]
    ];
    var areas = [
        [
            ["东城1", "东城2", "东城3"],
            ["昌平1", "昌平2", "昌平3"],
            ["海淀1", "海淀2", "海淀3"]
        ],
        [
            ["浦东1", "浦东2", "浦东3"],
            ["高区1", "高区2", "高区3"]
        ],
        [
            ["济南1", "济南2"],
            ["青岛1", "青岛2"]
        ]
    ]
    //设置一个省的公共下标
    var pIndex = -1;
    var preEle = document.getElementById("pre");
    var cityEle = document.getElementById("city");
    var areaEle = document.getElementById("area");
    //先设置省的值
    for (var i = 0; i < pres.length; i++) {
        //声明option.<option value="pres[i]">Pres[i]</option>
        var op = new Option(pres[i], i);
        //添加
        preEle.options.add(op);
    }
    function chg(obj) {
        if (obj.value == -1) {
            cityEle.options.length = 0;
            areaEle.options.length = 0;
        }
        //获取值
        var val = obj.value;
        pIndex = obj.value;
        //获取ctiry
        var cs = cities[val];
        //获取默认区
        var as = areas[val][0];
        //先清空市
        cityEle.options.length = 0;
        areaEle.options.length = 0;
        for (var i = 0; i < cs.length; i++) {
            var op = new Option(cs[i], i);
            cityEle.options.add(op);
        }
        for (var i = 0; i < as.length; i++) {
            var op = new Option(as[i], i);
            areaEle.options.add(op);
        }
    }
    function chg2(obj) {
        var val = obj.selectedIndex;
        var as = areas[pIndex][val];
        areaEle.options.length = 0;
        for (var i = 0; i < as.length; i++) {
            var op = new Option(as[i], i);
            areaEle.options.add(op);
        }
    }
</script>
</body>
</html>
