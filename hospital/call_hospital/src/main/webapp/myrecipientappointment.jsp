<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2021/3/11
  Time: 9:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="baseUri" value="${pageContext.request.contextPath }"
       scope="request"></c:set>


<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<base href="<%=basePath%>">
<html>
<head>
    <title>我的预约</title>

    <!-- Meta Tags -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="keywords" content="Site keywords here">
    <meta name="description" content="">
    <meta name='copyright' content=''>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <link rel="stylesheet" href="${baseUri}/css/layui.css">
    <!-- Favicon -->
    <link rel="icon" href="img/favicon.png">

    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css?family=Poppins:200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i&display=swap"
          rel="stylesheet">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://www.jq22.com/jquery/bootstrap-4.2.1.css">
    <!-- Nice Select CSS -->
    <link rel="stylesheet" href="css/nice-select.css">
    <!-- Font Awesome CSS -->
    <link rel="stylesheet" href="https://www.jq22.com/jquery/font-awesome.4.7.0.css">
    <!-- icofont CSS -->
    <link rel="stylesheet" href="css/icofont.css">
    <!-- Slicknav -->
    <link rel="stylesheet" href="css/slicknav.min.css">
    <!-- Owl Carousel CSS -->
    <link rel="stylesheet" href="css/owl-carousel.css">
    <!-- Datepicker CSS -->
    <link rel="stylesheet" href="css/datepicker.css">
    <!-- Animate CSS -->
    <link rel="stylesheet" href="css/animate.min.css">
    <!-- Magnific Popup CSS -->
    <link rel="stylesheet" href="css/magnific-popup.css">

    <!-- Medipro CSS -->
    <link rel="stylesheet" href="css/normalize.css">
    <link rel="stylesheet" href="style.css">
    <link rel="stylesheet" href="css/responsive.css">

    <!-- Color CSS -->
    <link rel="stylesheet" href="css/color/color1.css">
    <!--<link rel="stylesheet" href="css/color/color2.css">-->
    <!--<link rel="stylesheet" href="css/color/color3.css">-->
    <!--<link rel="stylesheet" href="css/color/color4.css">-->
    <!--<link rel="stylesheet" href="css/color/color5.css">-->
    <!--<link rel="stylesheet" href="css/color/color6.css">-->
    <!--<link rel="stylesheet" href="css/color/color7.css">-->
    <!--<link rel="stylesheet" href="css/color/color8.css">-->
    <!--<link rel="stylesheet" href="css/color/color9.css">-->
    <!--<link rel="stylesheet" href="css/color/color10.css">-->
    <!--<link rel="stylesheet" href="css/color/color11.css">-->
    <!--<link rel="stylesheet" href="css/color/color12.css">-->

    <link rel="stylesheet" href="#" id="colors">

</head>

<body>

<!-- Preloader -->
<div class="preloader">
    <div class="loader">
        <div class="loader-outter"></div>
        <div class="loader-inner"></div>

        <div class="indicator">
            <svg width="16px" height="12px">
                <polyline id="back" points="1 6 4 6 6 11 10 1 12 6 15 6"></polyline>
                <polyline id="front" points="1 6 4 6 6 11 10 1 12 6 15 6"></polyline>
            </svg>
        </div>
    </div>
</div>
<!-- End Preloader -->

<!-- Mediplus Color Plate -->
<div class="color-plate">
    <a class="color-plate-icon"><i class="fa fa-cog fa-spin"></i></a>
    <h4>更多</h4>
    <p>Here is some awesome color's available on Mediplus Template.</p>
    <span class="color1"></span>
    <span class="color2"></span>
    <span class="color3"></span>
    <span class="color4"></span>
    <span class="color5"></span>
    <span class="color6"></span>
    <span class="color7"></span>
    <span class="color8"></span>
    <span class="color9"></span>
    <span class="color10"></span>
    <span class="color11"></span>
    <span class="color12"></span>
</div>
<!-- /End Color Plate -->

<!-- Header Area -->
<header class="header">
    <!-- Topbar -->
    <div class="topbar">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 col-md-5 col-12">
                    <!-- Contact -->
                    <ul class="top-link">
                        <li><a href="#">关于</a></li>
                        <li><a href="#">医生</a></li>
                        <li><a href="#">联系我们</a></li>
                        <li><a href="#">FAQ</a></li>
                    </ul>
                    <!-- End Contact -->
                </div>
                <div class="col-lg-6 col-md-7 col-12">
                    <!-- Top Contact -->
                    <ul class="top-contact">
                        <li><i class="fa fa-phone"></i>+880 1234 56789</li>
                        <li><i class="fa fa-envelope"></i><a href="mailto:support@yourmail.com">support@yourmail.com</a>
                        </li>
                    </ul>
                    <!-- End Top Contact -->
                </div>
            </div>
        </div>
    </div>
    <!-- End Topbar -->
    <!-- Header Inner -->
    <div class="header-inner">
        <div class="container">
            <div class="inner">
                <div class="row">
                    <div class="col-lg-3 col-md-3 col-12">
                        <!-- Start Logo -->
                        <!--logo图片  -->
                        <%--<div class="logo">
                            <a href="index.html"><img src="img/logo.png" alt="#"></a>
                            <a href="index.html"><img src="img/logo.png" alt="#"></a>
                        </div>--%>
                        <!-- End Logo -->
                        <!-- Mobile Nav -->
                        <div class="mobile-nav"></div>
                        <!-- End Mobile Nav -->
                    </div>
                    <div class="col-lg-7 col-md-9 col-12">
                        <!-- Main Menu -->
                        <div class="main-menu">
                            <nav class="navigation">
                                <ul class="nav menu">
                                    <li ><a href="doctorIndex.jsp">主页 </a>
                                    </li>

                                    <li><a href="showAllDoctorByDoctor.jsp">医生介绍<i class="icofont-rounded-down"></i></a>
                                        <ul class="dropdown">
                                            <li><a href="showAllDoctorByDoctor.jsp">所有医生</a></li>
                                        </ul>
                                    </li>
                                    <li><a href="showDeptByDoctor.jsp">科室介绍 <i class="icofont-rounded-down"></i></a>
                                        <ul class="dropdown">
                                            <li><a href="showDeptByDoctor.jsp">所有科室</a></li>
                                        </ul>
                                    </li>
                                    <li><a href="showRankByDoctor.jsp">职称 <i class="icofont-rounded-down"></i></a>
                                        <ul class="dropdown">
                                            <li><a href="showRankByDoctor.jsp">所有职称</a></li>
                                        </ul>
                                    </li>
                                    <c:if test="${user !=null }">
                                        <li class="active"><a href="scheduleController/showScheduleByDoctorId">个人中心 <i class="icofont-rounded-down"></i></a>
                                            <ul class="dropdown">
                                                <li><a href="scheduleController/showScheduleByDoctorId">个人信息</a></li>
                                                <li><a href="ordercontroller/selectbydoctor">查看我收到的预约</a></li>
                                                <li class="active"><a href="doctorController/logOut" > 退出</a></li>
                                            </ul>
                                        </li>
                                    </c:if>
                                    <c:if test="${user ==null}">
                                        <li><a href="login.jsp">登录 </a>
                                        </li>
                                    </c:if>
                                </ul>
                            </nav>
                        </div>
                        <!--/ End Main Menu -->
                    </div>

                </div>
            </div>
        </div>
    </div>
    <!--/ End Header Inner -->
</header>
<!-- End Header Area -->
<!-- Breadcrumbs -->
<div class="breadcrumbs overlay">
    <div class="container">
        <div class="bread-inner">
            <div class="row">
                <div class="col-12">
                    <h2>我的预约</h2>
                    <ul class="bread-list">
                        <li><a href="doctorIndex.jsp">主页</a></li>
                        <li><i class="icofont-simple-right"></i></li>
                        <li class="active">我收到的预约</li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- End Breadcrumbs -->

<div class="row">
    <div class="col-lg-2 col-md-2 col-12"></div>
    <div class="col-lg-8 col-md-8 col-12">
        <div class="layui-body">

            <div class="layui-form">
                <div class="layui-table">
                    <table>
                        <colgroup>
                            <!--好像这里是间距-->
                            <col width="5">

                            <col width="5">
                            <col width="5">

                            <col width="5">
                            <col width="5">
                            <col width="5">


                        </colgroup>

                        <thead>
                        <tr>

                            <th>id</th>
                            <th>预约病人</th>
                            <th>预约时间</th>

                            <th>病情描述</th>

                            <th>时间</th>
                            <th>操作/状态</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${sessionScope.orderlist}" var="order">
                        <tr>
                            <td>${order.order_id}</td>
                            <td>${order.patient_name }</td>
                            <td><fmt:formatDate value="${order.order_date }" pattern="yyyy-MM-dd HH:mm:ss"/></td>


                            <td>${order.order_comment}</td>


                            <td><fmt:formatDate value="${order.order_time }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                            <c:choose>


                            <c:when test="${order.order_state eq '100'}">
                            <td>
                                <a href="ordercontroller/updateorder?order_id=${order.order_id}&&order_state=101">同意</a>
                                <a href="ordercontroller/updateorder?order_id=${order.order_id}&&order_state=102">拒绝</a>
                            </td>
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

        </div>

    </div>
    <div class="col-lg-2 col-md-2 col-12"></div>
</div>


<script src="js/jquery.js" type="text/javascript"></script>
<!-- jquery Min JS -->
<script src="https://www.jq22.com/jquery/jquery-3.3.1.js"></script>
<!-- jquery Migrate JS -->
<script src="js/jquery-migrate-3.0.0.js"></script>
<!-- jquery Ui JS -->
<script src="js/jquery-ui.min.js"></script>
<!-- Easing JS -->
<script src="js/easing.js"></script>
<!-- Color JS -->
<script src="js/colors.js"></script>
<!-- Popper JS -->
<script src="js/popper.min.js"></script>
<!-- Bootstrap Datepicker JS -->
<script src="js/bootstrap-datepicker.js"></script>
<!-- Jquery Nav JS -->
<script src="js/jquery.nav.js"></script>
<!-- Slicknav JS -->
<script src="js/slicknav.min.js"></script>
<!-- ScrollUp JS -->
<script src="js/jquery.scrollUp.min.js"></script>
<!-- Niceselect JS -->
<script src="js/niceselect.js"></script>
<!-- Tilt Jquery JS -->
<script src="js/tilt.jquery.min.js"></script>
<!-- Owl Carousel JS -->
<script src="js/owl-carousel.js"></script>
<!-- counterup JS -->
<script src="js/jquery.counterup.min.js"></script>
<!-- Steller JS -->
<script src="js/steller.js"></script>
<!-- Wow JS -->
<script src="js/wow.min.js"></script>
<!-- Magnific Popup JS -->
<script src="js/jquery.magnific-popup.min.js"></script>
<!-- Counter Up CDN JS -->
<script src="http://cdnjs.cloudflare.com/ajax/libs/waypoints/2.0.3/waypoints.min.js"></script>
<!-- Bootstrap JS -->
<script src="https://www.jq22.com/jquery/bootstrap-4.2.1.js"></script>
<!-- Main JS -->
<script src="js/main.js"></script>
<script src="${baseUri}/js/layui.js"></script>
</body>
</html>
