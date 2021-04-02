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
</head>
<script type="text/javascript">
    function queren() {
        if (!confirm("确认要删除吗？")) {
            window.event.returnValue = false;//这句话关键，没有的话，还是会执行下一步的
        }
    }

</script>
<style>
    <!--
    .pageshow {

        float: right;
        line-height: 50px;
        margin-right: 100px;
    }
    .wjl{
        width:300px; height:30px;float:left}
    input{float:left}


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
            <legend>所有状态</legend>
        </fieldset>




        <div class="layui-form">
            <table class="layui-table">
                <colgroup>
                    <col width="5">
                    <col width="5">

                    <col>
                </colgroup>
                <thead>
                <tr>
                    <th>id</th>

                    <th>名</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${sessionScope.statelist}" var="statelist">
                <tr>
                    <td>${statelist.state_id}</td>
                    <td>${statelist.state_comment }</td>
                </tr>
                    </c:forEach>


                </tbody>
            </table>
        </div>

    </div>


    <!-- 引入底部导航 -->
    <c:import url="nav/bottom.jsp"></c:import>
</div>


<script src="${baseUri}/static/layui/layui.js"></script>
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