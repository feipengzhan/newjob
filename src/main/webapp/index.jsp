<%--
  Created by IntelliJ IDEA.
  User: Wang
  Date: 2019/7/10 0010
  Time: 下午 20:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>

    <script src="js/jquery-1.9.1.min.js"></script>

    <script>


        $(function () {

            //发送ajax请求，加载所有省份数据
            $.get("x1",{},function (data) {
                //[{"id":1,"name":"北京"},{"id":2,"name":"上海"},{"id":3,"name":"广州"},{"id":4,"name":"陕西"}]

                //1.获取select
                var province = $("#province");
                //2.遍历json数组
                $(data).each(function () {
                    //3.创建<option>
                    var option = "<option value='"+this.id+"'>"+this.name+"</option>";

                    //4.调用select的append追加option
                    province.append(option);
                });


            });


            $("#province").change(function() {
                alert($(this).val());

                $.get("x2",{id : $(this).val()},function (data) {
                    //[{"id":1,"name":"北京"},{"id":2,"name":"上海"},{"id":3,"name":"广州"},{"id":4,"name":"陕西"}]

                    //1.获取select
                    var city = $("#city");
                    city.empty();
                    city.append("<option>--请选择城市--</option>")
                    //2.遍历json数组
                    $(data).each(function () {
                        //3.创建<option>
                        var option = "<option value='"+this.id+"'>"+this.name+"</option>";

                        //4.调用select的append追加option
                        city.append(option);
                    });


                });

            });


            $("#city").change(function() {
                alert($(this).val());

                $.get("x3",{id : $(this).val()},function (data) {
                    //[{"id":1,"name":"北京"},{"id":2,"name":"上海"},{"id":3,"name":"广州"},{"id":4,"name":"陕西"}]

                    //1.获取select
                    var cont = $("#cont");
                    cont.empty();
                    cont.append("<option>--请选择县区--</option>")
                    //2.遍历json数组
                    $(data).each(function () {
                        //3.创建<option>
                        var option = "<option value='"+this.id+"'>"+this.name+"</option>";

                        //4.调用select的append追加option
                        cont.append(option);
                    });


                });

            });


        });






    </script>

</head>
<body>



<select id="province" >
    <option>--请选择省份--</option>

</select>
<select id="city">
    <option>--请选择城市--</option>

</select>
<select id="cont">
    <option>--请选择县区--</option>

</select>
</body>
</html>
