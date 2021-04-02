<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2021/3/12
  Time: 9:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<html>
<head>
    <script type="text/javascript" charset="utf-8" src="/utf8-jsp/ueditor.config.js"></script>
    <script type="text/javascript" charset="utf-8" src="/utf8-jsp/ueditor.all.min.js"></script>
    <script type="text/javascript" charset="utf-8" src="/utf8-jsp/lang/zh-cn/zh-cn.js"></script>
    <script src="js/jquery.js" type="text/javascript"></script>
    <base href="<%=basePath%>" >

    <!-- Meta Tags -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="keywords" content="Site keywords here">
    <meta name="description" content="">
    <meta name='copyright' content=''>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Title -->
    <title>Mediplus - Medical and Doctor Directory HTML Template.</title>

    <!-- Favicon -->
    <link rel="icon" href="img/favicon.png">

    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css?family=Poppins:200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i&display=swap" rel="stylesheet">

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


<script>
    $(function(){
        var ue = UE.getEditor("myeditor");
        ue.ready(function() {
            //不可编辑
            ue.setDisabled();
        });
    });

</script>




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
    <h4>Mediplus</h4>
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
<header class="header" >
    <!-- Topbar -->
    <div class="topbar">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 col-md-5 col-12">
                    <!-- Contact -->
                    <ul class="top-link">
                        <li><a href="#">About</a></li>
                        <li><a href="#">Doctors</a></li>
                        <li><a href="#">Contact</a></li>
                        <li><a href="#">FAQ</a></li>
                    </ul>
                    <!-- End Contact -->
                </div>
                <div class="col-lg-6 col-md-7 col-12">
                    <!-- Top Contact -->
                    <ul class="top-contact">
                        <li><i class="fa fa-phone"></i>+880 1234 56789</li>
                        <li><i class="fa fa-envelope"></i><a href="mailto:support@yourmail.com">support@yourmail.com</a></li>
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

                                    <li class="active"><a href="showAllDoctorByDoctor.jsp">医生介绍<i class="icofont-rounded-down"></i></a>
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
                                        <li><a href="scheduleController/showScheduleByDoctorId">个人中心 <i class="icofont-rounded-down"></i></a>
                                            <ul class="dropdown">
                                                <li><a href="scheduleController/showScheduleByDoctorId">个人信息</a></li>
                                                <li><a href="ordercontroller/selectbydoctor">查看我收到的预约</a></li>
                                                <li><a href="doctorController/logOut" > 退出</a></li>
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
                    <h2>医生详情</h2>
                    <ul class="bread-list">
                        <li><a href="doctorIndex.jsp">主页</a></li>
                        <li><i class="icofont-simple-right"></i></li>
                        <li class="active">医生详情</li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- End Breadcrumbs -->

<!-- 查看一个医生的排班信息 -->
<!-- Start Doctor Calendar Area -->
<section class="doctor-calendar-area section">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="section-title">
                    <h2>医生排班表</h2>
                    <img src="img/section-img.png" alt="#">

                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-12">
                <div class="doctor-calendar-table table-responsive">
                    <table class="table">
                        <thead>
                        <tr>
                            <th>doctor</th>
                            <th>Time</th>
                            <th>Monday</th>
                            <th>Tuesday</th>
                            <th>Wednesday</th>
                            <th>Thursday</th>
                            <th>Friday</th>
                            <th>Saturday</th>
                            <th>Sunday</th>
                        </tr>
                        </thead>
                        <tbody>

                        <tr>
                            <td rowspan="2">${show.doctor_name}</td>
                            <td><span class="time">上午</span></td>
                            <td>
                                <c:if test="${scheduleList.schedule_mon == 1 or scheduleList.schedule_mon == 3}">
                                    <a>上班</a>
                                </c:if>

                            </td>
                            <td>
                                <c:if test="${scheduleList.schedule_tue == 1 or scheduleList.schedule_tue == 3}">
                                    <a>上班</a>
                                </c:if>
                            </td>
                            <td>
                                <c:if test="${scheduleList.schedule_wed == 1 or scheduleList.schedule_wed == 3}">
                                    <a>上班</a>
                                </c:if>
                            </td>
                            <td>
                                <c:if test="${scheduleList.schedule_thu == 1 or scheduleList.schedule_thu == 3}">
                                    <a>上班</a>
                                </c:if>
                            </td>
                            <td>
                                <c:if test="${scheduleList.schedule_fri == 1 or scheduleList.schedule_fri == 3}">
                                    <a>上班</a>
                                </c:if>
                            </td>
                            <td>
                                <c:if test="${scheduleList.schedule_sat == 1 or scheduleList.schedule_sat == 3}">
                                    <a>上班</a>
                                </c:if>
                            </td>
                            <td>
                                <c:if test="${scheduleList.schedule_sun == 1 or scheduleList.schedule_sun == 3}">
                                    <a>上班</a>
                                </c:if>
                            </td>
                        </tr>

                        <tr>
                            <td><span class="time">下午</span></td>
                            <td>
                                <c:if test="${scheduleList.schedule_mon == 2 or scheduleList.schedule_mon == 3}">
                                     <a>上班</a>
                                </c:if>
                            </td>
                            <td>
                                <c:if test="${scheduleList.schedule_tue == 2 or scheduleList.schedule_tue == 3}">
                                    <a>上班</a>
                                </c:if>
                            </td>
                            <td>
                                <c:if test="${scheduleList.schedule_wed == 2 or scheduleList.schedule_wed == 3}">
                                    <a>上班</a>
                                </c:if>
                            </td>
                            <td>
                                <c:if test="${scheduleList.schedule_thu == 2 or scheduleList.schedule_thu == 3}">
                                  <a>上班</a>
                                </c:if>
                            </td>
                            <td>
                                <c:if test="${scheduleList.schedule_fri == 2 or scheduleList.schedule_fri == 3}">
                                    <a>上班</a>
                                </c:if>
                            </td>
                            <td>
                                <c:if test="${scheduleList.schedule_sat == 2 or scheduleList.schedule_sat == 3}">
                                    <a>上班</a>
                                </c:if>
                            </td>
                            <td>
                                <c:if test="${scheduleList.schedule_sun == 2 or scheduleList.schedule_sun == 3}">
                                   <a>上班</a>
                                </c:if>
                            </td>
                        </tr>

                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- End Doctor Calendar Area -->


<!-- Doctor Details -->
<div class="doctor-details-area section">
    <div class="container">
        <div class="row">
            <div class="col-lg-5">
                <div class="doctor-details-item doctor-details-left">
                    <!--医生照片-->
                    <img src="<%=basePath%>${show.doctor_img}" alt="#">

                    <div class="doctor-details-contact">
                        <h3>联系方式</h3>
                        <ul class="basic-info">
                            <li>
                                <i class="icofont-ui-call"></i>
                                电话 : ${show.doctor_phone}
                            </li>

                        </ul>


                        <!-- End Social -->
                        <div class="doctor-details-work">
                            <h3>Working hours</h3>
                            <ul class="time-sidual">
                                <li class="day">Monday - Fridayp <span>8.00-20.00</span></li>
                                <li class="day">Saturday <span>9.00-18.30</span></li>
                                <li class="day">Monday - Thusday <span>9.00-15.00</span></li>
                                <li class="day">Monday - Fridayp <span>8.00-20.00</span></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-7">
                <div class="doctor-details-item">
                    <div class="doctor-details-right">
                        <div class="doctor-name">
                            <h3 class="name" name="doctor_name">医生信息</h3>
                            <%--<p class="deg" name="doctor_dept">部门：${show.dept_name}</p>--%>

                            <%--<p class="degree">MBBS in Neurology, PHD in Neurosurgeon.</p>--%>
                        </div>

                        <div class="doctor-details-biography">
                            <h3>医生姓名</h3>
                            <p>${show.doctor_name}</p>
                        </div>
                        <div class="doctor-details-biography">
                            <h3>部门</h3>
                            <p>${show.dept_name}</p>
                        </div>
                        <div class="doctor-details-biography">
                            <h3>职称</h3>
                            <p>${show.rank_name}</p>
                        </div>
                        <div class="doctor-details-biography">
                            <h3>业务专长</h3>
                            <p>${show.doctor_specialty}</p>
                        </div>
                        <div class="doctor-details-biography">
                            <h3>个人简介</h3>

                            <textarea id="myeditor"  style="height: 100px;width: 500px" readonly="readonly">
                                ${show.doctor_resume}
                            </textarea>


                            <!--创建富文本器-->
                            <script>

                                var ue=UE.getEditor("myeditor");

                            </script>

                            <%--<textarea id="myeditor"  readonly="readonly" style="height: 100px;width: 500px">--%>
                            <%--${show.doctor_resume}--%>
                            <%--</textarea>--%>

                            <%--<script type="text/plain" id="editor" name="solcontent" style="height: 500px;width:800px">--%>
                            <%--${smsServiceSolutionprogram.solcontent}</script>--%>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- End Doctor Details -->

<!-- Footer Area -->
<footer id="footer" class="footer ">
    <!-- Footer Top -->
    <div class="footer-top">
        <div class="container">
            <div class="row">
                <div class="col-lg-3 col-md-6 col-12">
                    <div class="single-footer">
                        <h2>About Us</h2>
                        <p>Lorem ipsum dolor sit am consectetur adipisicing elit do eiusmod tempor incididunt ut labore dolore magna.</p>
                        <!-- Social -->
                        <ul class="social">
                            <li><a href="#"><i class="icofont-facebook"></i></a></li>
                            <li><a href="#"><i class="icofont-google-plus"></i></a></li>
                            <li><a href="#"><i class="icofont-twitter"></i></a></li>
                            <li><a href="#"><i class="icofont-vimeo"></i></a></li>
                            <li><a href="#"><i class="icofont-pinterest"></i></a></li>
                        </ul>
                        <!-- End Social -->
                    </div>
                </div>
                <div class="col-lg-3 col-md-6 col-12">
                    <div class="single-footer f-link">
                        <h2>Quick Links</h2>
                        <div class="row">
                            <div class="col-lg-6 col-md-6 col-12">
                                <ul>
                                    <li><a href="#"><i class="fa fa-caret-right" aria-hidden="true"></i>Home</a></li>
                                    <li><a href="#"><i class="fa fa-caret-right" aria-hidden="true"></i>About Us</a></li>
                                    <li><a href="#"><i class="fa fa-caret-right" aria-hidden="true"></i>Services</a></li>
                                    <li><a href="#"><i class="fa fa-caret-right" aria-hidden="true"></i>Our Cases</a></li>
                                    <li><a href="#"><i class="fa fa-caret-right" aria-hidden="true"></i>Other Links</a></li>
                                </ul>
                            </div>
                            <div class="col-lg-6 col-md-6 col-12">
                                <ul>
                                    <li><a href="#"><i class="fa fa-caret-right" aria-hidden="true"></i>Consuling</a></li>
                                    <li><a href="#"><i class="fa fa-caret-right" aria-hidden="true"></i>Finance</a></li>
                                    <li><a href="#"><i class="fa fa-caret-right" aria-hidden="true"></i>Testimonials</a></li>
                                    <li><a href="#"><i class="fa fa-caret-right" aria-hidden="true"></i>FAQ</a></li>
                                    <li><a href="#"><i class="fa fa-caret-right" aria-hidden="true"></i>Contact Us</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6 col-12">
                    <div class="single-footer">
                        <h2>Open Hours</h2>
                        <p>Lorem ipsum dolor sit ame consectetur adipisicing elit do eiusmod tempor incididunt.</p>
                        <ul class="time-sidual">
                            <li class="day">Monday - Fridayp <span>8.00-20.00</span></li>
                            <li class="day">Saturday <span>9.00-18.30</span></li>
                            <li class="day">Monday - Thusday <span>9.00-15.00</span></li>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6 col-12">
                    <div class="single-footer">
                        <h2>Newsletter</h2>
                        <p>subscribe to our newsletter to get allour news in your inbox.. Lorem ipsum dolor sit amet, consectetur adipisicing elit,</p>

                    </div>
                </div>
            </div>
        </div>
    </div>
    <!--/ End Footer Top -->
    <!-- Copyright -->
    <div class="copyright">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 col-md-12 col-12">
                    <div class="copyright-content">
                        <p>© Copyright 2018  |  All Rights Reserved by jq22 </p>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!--/ End Copyright -->
</footer>
<!--/ End Footer Area -->

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
</body>
</html>
