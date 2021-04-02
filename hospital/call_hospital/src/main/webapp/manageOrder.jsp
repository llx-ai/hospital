<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="baseUri" value="${pageContext.request.contextPath }"
       scope="request"></c:set>
<!DOCTYPE html>
<html>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<base href="<%=basePath%>" >
<head>
    <meta charset="utf-8">
    <title>春日医院预约网站</title>
    <link rel="stylesheet" href="${baseUri}/static/layui/css/layui.css">
    <script src="/static/layui/lay/modules/jquery.js" type="text/javascript"></script>
    <script src="${baseUri}/static/layui/layui.js"></script>
</head>



<style>
    <!--
    .pageshow {

        float: right;
        line-height: 50px;
        margin-right: 100px;
    }

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
        width: 80px;


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
            <form action="ordercontroller/selectorderbycondition" >
                <input type="text" name="doctor_name" placeholder="医生姓名">
                <input type="text" name="patient_name" placeholder="患者姓名">

                <%--<input type="radio" name="doctor_sex" value="0">男
                <input type="radio" name="doctor_sex" value="1">女
                <input type="radio" name="doctor_sex" value="2" checked="checked">不限--%>
                <select id="sex" name="order_state" >
                    <option value="" disabled selected hidden>状态</option>

                    <option value="100">未处理</option>
                    <option value="101">已同意</option>
                    <option value="102">已拒绝</option>

                </select>


              <input type="date" name="order_date" placeholder="预约时间">
                <input type="date" name="order_time" placeholder="预约时间">

                <input type="submit" value="条件查询" float="right">
            </form>
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

                    <col>
                </colgroup>
                <thead>
                <tr>

                    <th>预约编号</th>
                    <th>预约病人</th>
                    <th>预约时间</th>
                    <th>预约医生</th>
                    <th>病情描述</th>
                    <th>时间</th>
                    <th>预约状态</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${sessionScope.orderlist}" var="order">
                <tr>
                    <td>${order.order_id}</td>
                    <td>${order.patient_name }</td>
                    <td><fmt:formatDate value="${order.order_date }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                    <td>${order.doctor_name }</td>

                    <td>${order.order_comment}</td>


                    <td><fmt:formatDate value="${order.order_time }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                    <c:choose>


                    <c:when test="${order.order_state eq '100'}">
                    <td> 未处理</td>
                    </c:when>

                    <c:when test="${order.order_state  eq '101'}">

                    <td> 已同意</td>
                    </c:when>

                    <c:when test="${order.order_state  eq '102'}">

                    <td> 已拒绝</td>
                    </c:when>

                    </c:choose>

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