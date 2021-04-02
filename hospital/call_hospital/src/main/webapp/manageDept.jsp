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

						var str3 = " ";
						for (var i = 0; i < data.length; i++) {
							str3 = str3 + "<tr><td>" + data[i].dept_id + "</td><td>" + data[i].dept_name + "</td></tr>";
						}
						//找到id为huaju的标签对象，将里面的内容替换成str
						$("#dept").html(str3);

					});

				}
		)})

</script>

<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">

	<!-- 引入头部导航 -->
	<c:import url="nav/titlenav.jsp"></c:import>

	<!-- 引入左边导航 -->
	<c:import url="nav/leftnav.jsp"></c:import>



	<div class="layui-body" >
		<!-- 内容主体区域 -->
		<fieldset class="layui-elem-field layui-field-title"
				  style="margin-top: 20px;">
			<legend>科室列表</legend>
		</fieldset>





		<div class="layui-form">
			<table class="layui-table" >
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
				<tbody id="dept">



				</tbody>
			</table>
		</div>
	</div>


	<!-- 引入底部导航 -->
	<c:import url="nav/bottom.jsp"></c:import>
</div>


<script>
	//JavaScript代码区域
	layui.use('element', function() {
		var element = layui.element;

	});
	layui.use('carousel', function() {
		var carousel = layui.carousel;
		//建造实例
		carousel.render({
			elem : '#test1',
			width : '100%' //设置容器宽度
			,
			arrow : 'always' //始终显示箭头
			//,anim: 'updown' //切换动画方式
		});
	});
</script>
</body>
</html>