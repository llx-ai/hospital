<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<base href="<%=basePath%>" >
<div class="layui-header">
	<!--<div class="layui-logo"><img src="../images/top-bg2.png"></div>-->
	<div><img src="<%=basePath%>images/后台logo.png" style="width: 180px;height: 60px"></div>
	<!-- 头部区域（可配合layui已有的水平导航） -->
	<ul class="layui-nav layui-layout-left">

		<!--
		<li class="layui-nav-item"><a href="###">控制台</a></li>
		<li class="layui-nav-item"><a href="###">商品管理</a></li>
		<li class="layui-nav-item"><a href="###">用户</a></li>
			<li class="layui-nav-item"><a href="javascript:;">其它系统</a>-->
			<dl class="layui-nav-child">
				<dd>
					<a href="###">邮件管理</a>
				</dd>
				<dd>
					<a href="###">消息管理</a>
				</dd>
				<dd>
					<a href="###">授权管理</a>
				</dd>
			</dl></li>
	</ul>
	<ul class="layui-nav layui-layout-right">
		<li class="layui-nav-item"><a href="javascript:;"> <%--<img
				src="${baseUri}/static/images/head.jpg" class="layui-nav-img"> ${msAdmin.adminName }--%>
		</a>
			</li>
		<li class="layui-nav-item"><a href="login.jsp" onclick="return confirm('确认退出管理员？')">安全退出</a></li>
	</ul>
</div>