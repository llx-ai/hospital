<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<base href="<%=basePath%>" >
<c:set var="baseUri" value="${pageContext.request.contextPath }"
	scope="request"></c:set>
<div class="layui-footer" style="background-color: #333300">
	<!-- 底部固定区域 -->
	<h5 style="text-align: center;color:#ff9933">o(*￣︶￣*)o ---- Four_L管理员后台----- ￣□￣</h5>
</div>