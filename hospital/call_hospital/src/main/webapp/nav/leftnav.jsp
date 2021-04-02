<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<base href="<%=basePath%>">
<div class="layui-side layui-bg-black">
    <div class="layui-side-scroll">
        <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
        <ul class="layui-nav layui-nav-tree" lay-filter="test">
            <li class="layui-nav-item layui-nav-itemed">
                <a class="" href="javascript:;">预约管理</a>
                <dl class="layui-nav-child">
                    <dd>
                        <a href="ordercontroller/selectorderbycondition">所有预约</a>
                    </dd>

                </dl>
            </li>
            <li class="layui-nav-item layui-nav-itemed">
                <a class="" href="javascript:;">状态管理</a>
                <dl class="layui-nav-child">
                    <dd>
                        <a href="statecontroller/selectallstate">所有状态</a>
                    </dd>

                </dl>
            </li>
            <li class="layui-nav-item layui-nav-itemed">
                <a class="" href="javascript:;">职称管理</a>
                <dl class="layui-nav-child">
                    <dd>
                        <a href="rankController/selectAllRank">所有职称</a>
                    </dd>

                </dl>
            </li>

            <li class="layui-nav-item layui-nav-itemed">
                <a class="" href="javascript:;">医生管理</a>
                <dl class="layui-nav-child">
                    <dd>
                        <a href="doctorController/selectAllDoctorByAdmin">所有医生</a>
                    </dd>

                </dl>
            </li>

            <li class="layui-nav-item layui-nav-itemed">
                <a class="" href="javascript:;">患者管理</a>
                <dl class="layui-nav-child">
                    <dd>
                        <a href="PatientController/selectpatientcondition">所有患者</a>
                    </dd>

                </dl>
            </li>
            <li class="layui-nav-item layui-nav-itemed">
                <a class="" href="javascript:;">科室管理</a>
                <dl class="layui-nav-child">
                    <dd>
                        <a href="manageDept.jsp">所有科室</a>
                    </dd>

                </dl>
            </li>
			 <li class="layui-nav-item layui-nav-itemed">
                <a class="" href="javascript:;">排班管理</a>
                <dl class="layui-nav-child">
                    <dd>
                        <a href="manageSchedule.jsp">排班信息</a>
                    </dd>

                </dl>
            </li>

        </ul>
    </div>
</div>