<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2021/3/9
  Time: 17:11
  To change this template use File | Settings | File Templates.
--%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <base href="<%=basePath%>" >

    <script src="js/jquery.js" type="text/javascript"></script>
    <script type="text/javascript" src="/js/jquery.min.js"></script>

</head>

<script>

    //能够将控制器返回的json字符串自动转换成object类型
    $.getJSON("deptController/selectAllDept",{type:'dept'},function(data){
        var str3="<option value='0'>未选择</option>";
        for(var i=0;i<data.length;i++){

            str3=str3+"<option value='"+data[i].dept_id+"'>"+data[i].dept_name+"</option>";
        }
        //找到id为huaju的标签对象，将里面的内容替换成str
        $("#dept").html(str3);
    });

    //能够将控制器返回的json字符串自动转换成object类型
    $.getJSON("rankController/selectAllRank1",{type:'rank'},function(data){
        var str1="<option value='0'>未选择</option>";
        var str2="";

        for(var i=0;i<data.length;i++){
            str1=str1+"<option value='"+data[i].rank_id+"'>"+data[i].rank_name+"</option>";
        }
        //找到id为huaju的标签对象，将里面的内容替换成str

        $("#rank").html(str1);

    });


    var falge1 = false;

    function checkname() {
        var name = document.getElementById("name");
        var mes = document.getElementById("warning-message0");
        if (name.value.length>0) {
            mes.innerHTML ="";
            falge1 = true;
        } else {
            mes.innerHTML = "新增的医生姓名不能为空";
            mes.setAttribute("style", "font-size:9px;color:red");
            falge1 = false;
        }
        return falge1;
    }


    function checkphone() {
        var phone = document.getElementById("phone").value;
        var mes = document.getElementById("warning-message3");
        var re = /^1\d{10}$/;



        $.get("doctorController/selectDoctorByPhone",{doctor_phone:phone},function(data){

            if(data=='nofind'&&phone.length==11){
                //可以使用
                mes.innerHTML ="";
                flag1=true;
            }else if(data=='find'&&phone.length==11){
                mes.innerHTML = "已经存在该手机号";
                flag1=false;
            }

        });


        if (re.test(phone)) {
            mes.innerHTML ="";
            falge1 = true;
        } else {
            mes.innerHTML = "手机号输入违法";
            falge1 = false;
        }

        return falge1
    }

    function checkall() {

        //return falge1;
        return checkphone()&&checkname();

    }


</script>


<body>

        <form action="doctorController/insertADoctor">
            医生姓名：<input type="text" name="doctor_name" id="name" onblur="checkname()"><br>
            <p style="color:red" id="warning-message0"></p>
            <br>

            性别：
            <input type="radio" name="doctor_sex" value="0" checked="checked">男
            <input type="radio" name="doctor_sex" value="1">女
            <br>医生部门：<select id="dept" name="doctor_dept"></select>
            <br>医生的等级： <select id="rank" name="doctor_rank"></select>
            <br>电话 <input type="text" id="phone" name="doctor_phone" onblur="checkphone()"><br>
            <p style="color:red" id="warning-message3"></p><br>
            <input type="submit" value="添加" onclick="return checkall()">
        </form>

</body>
</html>
