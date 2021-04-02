<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="baseUri" value="${pageContext.request.contextPath }"
       scope="request"></c:set>
<!DOCTYPE html>
<html>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<base href="<%=basePath%>">
<head>
    <meta charset="utf-8">
    <title>春日医院预约网站</title>
    <link rel="stylesheet" href="${baseUri}/static/layui/css/layui.css">
    <link rel="stylesheet" href="${baseUri}/fonts/bootstrap.min.css">

    <script src="https://cdn.staticfile.org/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/popper.js/1.15.0/umd/popper.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/4.3.1/js/bootstrap.min.js"></script>

    <script src="/static/layui/lay/modules/jquery.js" type="text/javascript"></script>
    <script src="${baseUri}/static/layui/layui.js"></script>
</head>

<script>
layui.use(['jquery','layer'],function () {
    var $=layui.$
        ,layer=layui.layer;
 $(document).ready(function(){


    //能够将控制器返回的json字符串自动转换成object类型
    $.getJSON("deptController/selectAllDept", {type: 'dept'}, function (data) {

        var str3 = "<option value='0'>部门选择</option>";
        for (var i = 0; i < data.length; i++) {

            str3 = str3 + "<option value='" + data[i].dept_id + "' >" + data[i].dept_name + "</option>";
        }
        //找到id为huaju的标签对象，将里面的内容替换成str
        $("#dept").html(str3);
        $("#doctor_dept").html(str3);
        $("#doctor_dept1").html(str3);


    });


    //能够将控制器返回的json字符串自动转换成object类型
    $.getJSON("rankController/selectAllRank1", {type: 'rank'}, function (data) {

        var str1 = "<option value='0'>职称选择</option>";
        var str2 = "";

        for (var i = 0; i < data.length; i++) {
            str1 = str1 + "<option value='" + data[i].rank_id + "' >" + data[i].rank_name + "</option>";
        }
        //找到id为huaju的标签对象，将里面的内容替换成str

        $("#rank").html(str1);
        $("#doctor_rank").html(str1);
        $("#doctor_rank1").html(str1);


    });

 }
 )})

function checkname() {
    var name = document.getElementById("name").value;
    var mes = document.getElementById("warning-message0");
    console.log("时间"+name)

    if (name!=null && name!='') {
        console("")
        mes.innerHTML = "";
        falge1 = true;
    } else {
        mes.innerHTML = "新增的医生姓名不能为空";
        mes.setAttribute("style", "font-size:9px;color:red");
        falge1 = false;
    }
    return falge1;
}

function checkphone(phone) {
    var phone1=document.getElementById("doctor_phone").value;
    console.log("电话"+phone1)
    var mes = document.getElementById("warning-message3");
    var re = /^1\d{10}$/;
    if (re.test(phone1)) {
        mes.innerHTML = "";
        falge1 = true;
    } else {
        mes.innerHTML = "手机号输入违法";
        falge1 = false;
    }

    return falge1
}

function checkall() {

    //return falge1;
    return checkphone() && checkname();


}

function Values(doctor_id,dept,rank){
    $("#doctor_id").val(doctor_id);
    $("#olddept").val(dept);
    $("#oldrank").val(rank);

}
</script>


<style>

    .wjl {
        width: 1500px;
        height: 45px;
        float: left
    }

    input,select {
        float: left;
        margin:4px;
        height: 25px;
        border-radius: 5px;
        border-color: grey;
    }
    select{
        width: auto;


    }
    ::selection{
        color: darkgrey;
    }



    -->
</style>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">

    <!-- 引入头部导航 -->
    <c:import url="nav/titlenav.jsp"></c:import>

    <!-- 引入左边导航 -->
    <c:import url="nav/leftnav.jsp"></c:import>


    <div class="layui-body">
        <!-- 内容主体区域 -->
        <fieldset class="layui-elem-field layui-field-title"
                  style="margin-top: 20px;">
            <legend>所有预约</legend>
        </fieldset>
        <%--<a href="usercontroller/selectalluserbysex.do?user_sex=1">男</a>
        <a href="usercontroller/selectalluserbysex.do?user_sex=0">女</a>
        <a href="usercontroller/selectalluserbypower.do?user_power=0">权限</a>
        <button onclick="usercontroller/selectalluserbypower.do?user_power=0">gghg</button>
        <a class="Operation" href="usercontroller/selectalluserbysex.do?user_sex=1"><img class="img_s" src="${baseUri}/img/noimg.jpg" width="15" height="15" alt=""></a>--%>
        <%-- <div class="wjl">
             <a href="usercontroller/selectalluserbysex.do?user_sex=1">已同意</a>
             <a href="usercontroller/selectalluserbysex.do?user_sex=0">已拒绝</a>
             <a href="usercontroller/selectalluserbypower.do?user_power=0">未处理</a>

         </div>--%>
        <!-- 模糊查询字段-->

        <div class="wjl">
            <form action="doctorController/selectDoctorByCondition" width="">
                <input type="text" name="doctor_name" placeholder="医生姓名">

                <%--<input type="radio" name="doctor_sex" value="0">男
                <input type="radio" name="doctor_sex" value="1">女
                <input type="radio" name="doctor_sex" value="2" checked="checked">不限--%>
                <select id="sex" name="doctor_sex" >
                    <option value="" disabled selected hidden>性别</option>
                    <option value="0">男</option>
                    <option value="1">女</option>
                    <option value="2" selected="selected">不限</option>

                </select>


                <select id="dept" name="doctor_dept" width="120px">

                </select>
                <select id="rank" name="doctor_rank"width="120px"></option>
              </select>
                <input type="text" name="doctor_phone" placeholder="电话">

                <input type="submit" value="条件查询" float="right">
            </form>
        </div>

        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#AddDoctor">
            添加医生
        </button>

        <!-- 添加医生模态框 -->
        <div class="modal fade" id="AddDoctor">
            <div class="modal-dialog">
                <div class="modal-content">

                    <!-- 模态框头部 -->
                    <div class="modal-header">
                        <h4 class="modal-title">添加医生</h4>
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>

                    <!-- 模态框主体 -->
                    <div class="modal-body">
                        <div class="formDiv">
                            <form action="doctorController/insertADoctor" method="post">
                                <label class="doctor_name">
                                    <input type="text" placeholder="医生姓名" name="doctor_name" onblur="checkname()"/>

                                </label>

                                <label class="doctor_dept">
                                    <select id="doctor_dept" name="doctor_dept" width="120px">

                                    </select>
                                </label>

                                <label class="doctor_sex">
                                    <select  name="doctor_sex" >
                                        <option value="" disabled selected hidden>性别</option>
                                        <option value="0" selected="selected">男</option>
                                        <option value="1">女</option>
                                    </select>

                                </label>
                                <label class="doctor_phone">
                                    <input type="number" placeholder="医生电话"  id="doctor_phone" name="doctor_phone" onblur="checkphone()"/>


                                </label>
                                <label class="doctor_rank">
                                    <select id="doctor_rank" name="doctor_rank"width="120px"></option>
                                    </select>

                                </label>

                                <br>
                                <label class="doctor_rank">
                                    <br><p style="color:red" id="warning-message3"></p>
                                    <p style="color:red" id="warning-message0"></p>
                                </label>
                                <label class="doctor_rank">
                                    <button  class="btn btn-secondary" input type="submit" onclick=" return checkall()">添加

                                    </button>

                                </label>



                            </form>
                        </div>
                    </div>
                    <!-- 模态框底部 -->
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">关闭</button>
                    </div>

                </div>
            </div>
        </div>
        <!-- 修改医生模态框 -->
        <div class="modal fade" id="UpdateDoctor">
            <div class="modal-dialog">
                <div class="modal-content">

                    <!-- 模态框头部 -->
                    <div class="modal-header">
                        <h4 class="modal-title">修改医生</h4>
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>

                    <!-- 模态框主体 -->
                    <div class="modal-body">
                        <div class="formDiv">
                            <form action="doctorController/updateDoctorByAdmin" method="post">
                                <label class="doctor_id">
                                    <input type="text" placeholder="医生姓名" name="doctor_id" id="doctor_id"  value="" hidden/>
                                    <input type="text" placeholder="原部门" name="olddept" id="olddept" hidden>
                                    <input type="text" placeholder="原职称" name="oldrank" id="oldrank" hidden>
                                </label>

                                <label class="doctor_dept">
                                    <select id="doctor_dept1" name="doctor_dept" width="120px">

                                    </select>
                                </label>



                                <label class="doctor_rank">
                                    <select id="doctor_rank1" name="doctor_rank"width="120px"></option>
                                    </select>

                                </label>

                                <label class="doctor_rank">
                                    <button  class="btn btn-secondary" input type="submit" >修改

                                    </button>

                                </label>



                            </form>
                        </div>
                    </div>
                    <!-- 模态框底部 -->
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">关闭</button>
                    </div>

                </div>
            </div>
        </div>

        <div class="layui-form">
            <table class="layui-table">

                <colgroup>
                    <col width="5">
                    <col width="5">
                    <col width="5">
                    <col width="5">
                    <col width="5">
                    <col width="5">
                    <col width="5">
                    <col width="5">
                    <col width="5">

                    <col>
                </colgroup>
                <thead>
                <tr>
                    <td>医生姓名</td>
                    <td>电话</td>
                    <td>照片</td>
                    <td>性别</td>
                    <td>创建时间</td>
                    <td>部门</td>
                    <td>职称</td>
                    <td>业务专长</td>
                    <td>操作</td>
                </tr>
                </thead>
                <c:if test="${empty sessionScope.doctorList}">

                    <tbody>
                    没有医生信息！</tbody>
                </c:if>
                <tbody>



                <c:forEach items="${sessionScope.doctorList}" var="s">
                    <tr>
                        <td>${s.doctor_name}</td>
                        <td>${s.doctor_phone}</td>
                        <td>
                            <c:choose>
                                <c:when test="${empty s.doctor_img}">
                                    没有照片信息
                                </c:when>
                                <c:when test="${!empty s.doctor_img}">
                                    <img src="<%=basePath%>${s.doctor_img}"
                                         id="pic" style="height: 50px;width: 50px"/>
                                </c:when>
                            </c:choose>
                        </td>
                        <td>
                            <c:choose>
                                <c:when test="${s.doctor_sex eq '0'}">
                                    男
                                </c:when>
                                <c:when test="${s.doctor_sex eq '1'}">
                                    女
                                </c:when>
                            </c:choose>
                        </td>

                        <td><fmt:formatDate value="${s.doctor_time}" pattern="yyyy-MM-dd HH:mm:ss"/></td>

                        <td>${s.dept_name}</td>
                        <td>${s.rank_name}</td>
                        <td>${s.doctor_specialty}</td>
                        <td><button onclick="Values(${s.doctor_id},${s.doctor_dept},${s.doctor_rank})" data-toggle="modal" data-target="#UpdateDoctor">修改</button></td>


                    </tr>
                </c:forEach>

                </tbody>
            </table>
        </div>

    </div>


    <!-- 引入底部导航 -->
    <c:import url="nav/bottom.jsp"></c:import>
</div>



<script>
    //JavaScript代码区域
    layui.use('element', function () {
        var element = layui.element;

    });
    layui.use('carousel', function () {
        var carousel = layui.carousel;
        //建造实例
        carousel.render({
            elem: '#test1',
            width: '100%' //设置容器宽度
            ,
            arrow: 'always' //始终显示箭头
            //,anim: 'updown' //切换动画方式
        });
    });
    layer.open({
        type: 4,
        content: ['已下架', '#soldBook']
        //数组第二项即吸附元素选择器或者DOM
    });
</script>
</body>
</html>