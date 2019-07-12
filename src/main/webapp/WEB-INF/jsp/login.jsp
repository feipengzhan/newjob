<%--
  Created by IntelliJ IDEA.
  User: Wang
  Date: 2019/7/8 0008
  Time: 下午 20:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>

    <script src="${pageContext.request.contextPath}/js/jquery-3.3.1.js"></script>

    <script>
        /*$(function () {

            //发送ajax请求，加载所有省份数据
            $.get("province.do",{},function (data) {
                //[{"id":1,"name":"北京"},{"id":2,"name":"上海"},{"id":3,"name":"广州"},{"id":4,"name":"陕西"}]

                //1.获取select
                var province = $("#province");
                //2.遍历json数组
                $(data).each(function () {

                    alert(this.name)
                    //3.创建<option>
                    var option = "<option name='"+this.id+"'>"+this.name+"</option>";

                    //4.调用select的append追加option
                    province.append(option);
                });


            });

        });*/
        $(function () {
            $.ajax({
                url:"province",
                dataType:"json",
                type:"get",
                success:function (data) {
                    //1.获取select
                    var province = $("#province");

                    $(data).each(function () {


                        //3.创建<option>
                        var option = "<option name='"+this.id+"'>"+this.name+"</option>";
                        //4.调用select的append追加option
                        province.append(option);
                    });
                }
            })

            $("#province").change(function () {
                $("#city option:gt(0)").remove()
                $("#area option:gt(0)").remove()

                var name = $("#province option:selected").val()

                $.ajax({
                    url:"city.do?name="+name,
                    dataType:"json",
                    type:"get",
                    success:function (data) {
                        //1.获取select
                        var city = $("#city");

                        $(data).each(function () {


                            //3.创建<option>
                            var option = "<option name='"+this.id+"'>"+this.name+"</option>";
                            //4.调用select的append追加option
                            city.append(option);
                        });
                    }
                })

            })

            $("#city").change(function () {

                $("#area:gt(0)").remove()

                var name = $("#city option:selected").val()

                $.ajax({
                    url:"area.do?name="+name,
                    dataType:"json",
                    type:"get",
                    success:function (data) {
                        //1.获取select
                        var area = $("#area");

                        $(data).each(function () {


                            //3.创建<option>
                            var option = "<option name='"+this.id+"'>"+this.name+"</option>";
                            //4.调用select的append追加option
                            area.append(option);
                        });
                    }
                })

            })

        })



    </script>

</head>
<body>



<select id="province">
    <option>--请选择省份--</option>

</select>
<select id="city">
    <option>--请选择市--</option>
</select>
<select id="area">
    <option>--请选择县--</option>

</select>
</body>
</html>
