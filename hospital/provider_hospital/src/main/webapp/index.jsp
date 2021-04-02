<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<body>
<h2>Hello World!</h2>


<a href="scheduleController/showSchedule">查看排班表</a>


<c:if test="time == null">
    没有信息
</c:if>
<c:if test="time != null">
    <table>
        <tr>
            <td>科室</td>
            <td>时段</td>
            <td>今天</td>
            <td>明天</td>
            <td>后天</td>
            <td>周四</td>
            <td>周五</td>
            <td>周六</td>
            <td>周日</td>
        </tr>
        <tr>
            <td rowspan="2">神经外科</td>
            <td>上午</td>
            <td></td>
        </tr>
    </table>
</c:if>

</body>
</html>
