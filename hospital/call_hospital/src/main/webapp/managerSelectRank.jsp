<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2021/3/9
  Time: 14:39
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <base href="<%=basePath%>" >
</head>



    <form action="rankController/selectRankById">
        <input type="text" name="rank_id">
        <input type="submit" value="查询">
    </form>

    <table class="table table-hover">


        <tr>
             <td>职称id</td>
             <td>职称名</td>
        </tr>

        <tr>
            <td>${rank.rank_id}</td>
            <td>${rank.rank_name}</td>
        </tr>

    </table>


    <form action="rankController/selectAllRank">
        <input type="submit" value="查询全部">
    </form>

    <table class="table table-hover">

        <tr >

            <c:if test="${empty sessionScope.rankList}">
                没有职称信息！
            </c:if>
        </tr>

        <tr>
            <td>职称id</td>
            <td>职称名</td>

        </tr>


        <c:forEach items="${sessionScope.rankList}" var="s">
            <tr>
            <td>${s.rank_id}</td>
            <td>${s.rank_name}</td>
            </tr>
        </c:forEach>

    </table>

</body>
</html>
