<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2021/3/11
  Time: 10:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="baseUri" value="${pageContext.request.contextPath }"
       scope="request"></c:set>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link rel="stylesheet" href="${baseUri}/static/layui/css/layui.css">
<%
    String path = request.getContextPath();

    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<html>
<head>
    <base href="<%=basePath%>" >
    <title>患者的个人中心</title>
    <script src="js/jquery.js" type="text/javascript"></script>
    <script src="js/ajaxfileupload.js" type="text/javascript"></script>
    <script type="text/javascript" src="/js/jquery.min.js"></script>
    <script type="text/javascript" charset="utf-8" src="/utf8-jsp/ueditor.config.js"></script>
    <script type="text/javascript" charset="utf-8" src="/utf8-jsp/ueditor.all.min.js"></script>
    <script type="text/javascript" charset="utf-8" src="/utf8-jsp/lang/zh-cn/zh-cn.js"></script>


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
<style>
    p#warning-message1{
        margin-bottom: 10px;
    }
    p#warning-message2 {
        margin-bottom: 10px;
    }
    p#warning-message3 {
        margin-bottom: 10px;
    }
</style>
<script>
    //上传头像
    function previewFile1() {
        var preview = document.getElementById("pic");
        var file = document.querySelector('input[type=file]').files[0];
        var reader = new FileReader();
        reader.onloadend = function () {
            preview.src = reader.result;
        }
        if (file) {
            reader.readAsDataURL(file);
        } else {
            preview.src = "";
        }
    }

    function checkall() {
        return checkpwd1() && checkpwd2();
        if (!confirm("确认要修改吗？")) {

            window.event.returnValue = false;//这句话关键，没有的话，还是会执行下一步的
        }
    }

    var falge1 = false;

    function checkpwd1() {
        var pwd1 = document.getElementById("pwd0");
        var pwd2 = document.getElementById("pwd1");
        var mes = document.getElementById("warning-message1");
        if (pwd2.value.trim() == pwd1.value.trim() || pwd2.value.trim() == "") {
            mes.innerHTML = "";
            falge1 = true;
        } else {
            mes.innerHTML = "原密码错误";
            mes.setAttribute("style", "font-size:9px;color:red");
            falge1 = false;
        }
        return falge1;
    }

    function checkpwd2() {
        var pwd0 = document.getElementById("pwd2");
        var pwd1 = document.getElementById("pwd3");
        var pwd2 = document.getElementById("pwd1");
        var pwd3 = document.getElementById("pwd0");
        var mes1 = document.getElementById("warning-message1");
        var mes = document.getElementById("warning-message2");
        if (pwd0.value.trim() != "" && pwd1.value.trim() != "" && pwd2.value.trim() == "") {
            mes1.innerHTML = "未输入原密码";
            mes1.setAttribute("style", "font-size:15px;color:red");
            falge1 = false;

        } else {
        }
        if (pwd0.value.trim() == pwd1.value.trim()) {
            mes.innerHTML = "";
            falge1 = true;
        } else {
            mes.innerHTML = "两次密码不一致";
            mes.setAttribute("style", "font-size:15px;color:red");
            falge1 = false;
        }
        if (pwd1.value.trim() == pwd3.value.trim()) {
            mes.innerHTML = "与原密码一致";
            falge1 = false;
            mes.setAttribute("style", "font-size:15px;color:red");
        } else {
        }
        return falge1;
    }

    /*function checkphone(op) {
        // var phone = document.getElementById("phone").value;
        var mes = document.getElementById("warning-message3");
        var re = /^1\d{10}$/;

        if (re.test(phone)) {
            mes.innerHTML = "";
            falge1 = true;
            $.get("PatientController/checkPhone", {op: op}, function (data) {

                if (data == 1) {
                    mes.innerHTML = "号码已存在";//
                    mes.setAttribute("style", "font-size:15px;color:red");
                    falge1 = false
                } else {
                    mes.innerHTML = "可以注册";//
                    mes.setAttribute("style", "font-size:15px;color:red");
                    falge1 = true
                }
            });
        } else {
            mes.innerHTML = "手机号格式有误";
            falge1 = false;
        }
        return falge1
    }*/


</script>

<script type="text/javascript">
    function showPreview(source) {
        var file = source.files[0];
        if (window.FileReader) {
            var fr = new FileReader();
            console.log(fr);
            var portrait = document.getElementById('portrait');
            fr.onloadend = function (e) {
                portrait.src = e.target.result;
            };
            fr.readAsDataURL(file);
            portrait.style.display = 'block';
        }
    }

    function queren() {
        if (!confirm("确认要修改吗？")) {

            window.event.returnValue = false;//这句话关键，没有的话，还是会执行下一步的
        }
    }
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
                                    <li><a href="index.jsp">主页 </a>
                                    </li>
                                    <li><a href="showScheduleDoctor.jsp">门诊预约<i class="icofont-rounded-down"></i></a>
                                        <ul class="dropdown">
                                            <li><a href="showScheduleDoctor.jsp">门诊预约</a></li>
                                        </ul>
                                    </li>
                                    <li><a href="showAllDoctor.jsp">医生介绍<i class="icofont-rounded-down"></i></a>
                                        <ul class="dropdown">
                                            <li><a href="showAllDoctor.jsp">所有医生</a></li>
                                        </ul>
                                    </li>
                                    <li><a href="showDept.jsp">科室介绍 <i class="icofont-rounded-down"></i></a>
                                        <ul class="dropdown">
                                            <li><a href="showDept.jsp">所有科室</a></li>
                                        </ul>
                                    </li>
                                    <li><a href="showRank.jsp">职称 <i class="icofont-rounded-down"></i></a>
                                        <ul class="dropdown">
                                            <li><a href="showRank.jsp">所有职称</a></li>
                                        </ul>
                                    </li>
                                    <c:if test="${user !=null}">
                                        <li class="active"><a href="patientInfo.jsp">个人中心 <i class="icofont-rounded-down"></i></a>
                                            <ul class="dropdown">
                                                <li class="active"><a href="patientInfo.jsp">个人信息</a></li>
                                                <li><a href="ordercontroller/selectbypatient">查看我的预约</a></li>
                                                <li><a href="doctorController/logOut" > 退出</a></li>
                                            </ul>
                                        </li>
                                    </c:if>
                                    <c:if test="${user ==null}">
                                        <li><a href="login.jsp">登录 </a>
                                        </li>
                                        <li><a href="register.jsp">注册 </a>
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
                    <h2>Contact Us</h2>
                    <ul class="bread-list">
                        <li><a href="index.html">Home</a></li>
                        <li><i class="icofont-simple-right"></i></li>
                        <li class="active">Contact Us</li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- End Breadcrumbs -->

<!-- 医生个人中心板块 -->
<section class="contact-us section col-lg-12">
    <div class="container">
        <div class="inner">
            <div class="row">

                <!--医生个人的信息-->
                <div class="col-lg-6">
                    <div class="contact-us-left">
                        <div class="col-lg-12">
                            <h2>患者的个人信息显示</h2>
                            <div class="form-group">
                                <img src="<%=basePath%>${user.patient_img}" class="img-circle"
                                                  border="0" height="150" id="pic1" width="150" />
                            </div>
                        </div>


                        <div class="col-lg-12">
                            <div class="form-group">
                                <p>姓名:${user.patient_name}</p>
                            </div>
                        </div>


                        <div class="col-lg-12">
                            <div class="form-group">
                                <p>性别:
                                    <c:if test="${user.patient_sex eq '0'}">
                                     男
                                    </c:if>
                                    <c:if test="${user.patient_sex eq '1'}">
                                        女
                                    </c:if>
                                </p>
                            </div>
                        </div>

                        <div class="col-lg-12">
                            <div class="form-group">
                                <p>生日:<fmt:formatDate value="${user.patient_birth}" pattern="yyyy-MM-dd" /></p>
                            </div>
                        </div>

                        <div class="col-lg-12">
                            <div class="form-group">
                                <p>手机号:${user.patient_phone}</p>
                            </div>
                        </div>


                        <!--Start Google-map -->
                        <div id="myMap"></div>
                        <!--/End Google-map -->
                    </div>
                </div>


                <!--医生修改的信息-->
                <div class="col-lg-6">
                    <div class="contact-us-form">
                        <h2>患者的个人中心修改</h2>

                        <!-- Form -->
                        <form class="form" method="post" action="PatientController/changeInfo"
                              enctype="multipart/form-data" >
                            <input type="hidden" name="patient_id" value="${user.patient_id }">
                            <div class="row">

                                    <div class="col-lg-12">
                                        <div class="form-group">
                                            <div class="img-circle"
                                                 style="margin: 0 auto; padding-top: 20px; background-color: white; width: 150px; height: 150px;">
                                                <c:if test="${!empty user.patient_img}">
                                                    <img src="<%=basePath%>${user.patient_img}"
                                                         id="pic" style="border-radius: 50%;height: 100px;width: 100px"/>
                                                </c:if>
                                                <c:if test="${empty user.patient_img}">
                                                    <img src="/img/noimg.jpg"
                                                         id="pic" style="border-radius: 50%;height: 100px;width: 100px"/>
                                                </c:if>
                                            </div>
                                            <button type="button"
                                                    style="background-color:#1A76D1; color: #F0F8FD; border: 0px; margin-left: 140px; margin-top: 10px; height: 40px;width: 130px" class="btn btn-default">上传头像
                                            </button>
                                            <input id="fileToUploadLink" onchange="previewFile1()" type="file"
                                                   style="cursor: pointer; opacity: 0; margin-left: 70px; margin-top: -25px; color: F0F8FD;"
                                                   size="25" name="patient_img"/>

                                        </div>
                                    </div>

                                <div class="col-lg-12">
                                    <div class="form-group">
                                        <p>姓名:
                                        <input type="text" name="patient_name" lay-verify="required"
                                               autocomplete="off" value="${user.patient_name }" readonly="readonly"></p>
                                    </div>
                                <%--</div>--%>

                                <%--<input type="hidden" id="pwd0" value="${patient.patient_pwd}">--%>
                                <%--<div class="col-lg-12">--%>
                                    <div class="form-group">
                                        <p>原密码:<input type="password" name="patient_pwd1" id="pwd1" autocomplete="off" onblur="checkpwd1()"></p>
                                        <p style="color:red" id="warning-message1"></p>
                                    </div>
                                <%--</div>--%>

                                <%--<div class="col-lg-5">--%>

                                    <div class="form-group">
                                        <p>修改密码(如果为空则不修改密码):<input type="password" name="patient_pwd" id="pwd2" autocomplete="off"></p>
                                    </div>
                                <%--</div>--%>

                                <%--<div class="col-lg-5">--%>

                                    <div class="form-group">
                                       <p>确认密码:<input type="password" name="repatient_pwd" id="pwd3" autocomplete="off" onblur="checkpwd2()"></p>
                                        <p style="color:red" id="warning-message2"></p>
                                    </div>
                                <%--</div>--%>

                                <%--<div class="col-lg-5">--%>

                                    <%--<div class="form-group ">
                                       <p>电话:<input type="text" name="patient_phone" autocomplete="off"
                                                         value="${user.patient_phone}" id="phone" onblur="checkphone(this.value)" readonly></p>
                                        <p style="color:red" id="warning-message3"></p>
                                    </div>--%>
                                <%--</div>--%>

                                    <%--<div class="col-lg-5">--%>

                                        <div class="form-group ">
                                            <p>生日:<input type="date" name="patient_birth1" value="<fmt:formatDate value="${user.patient_birth}" pattern="yyyy-MM-dd" />" autocomplete="off"  disabled></p>
                                        </div>
                                    <%--</div>--%>

                                    <%--<div class="col-lg-5">--%>

                                        <div class="form-group ">
                                            <p>修改生日:<input type="date" name="patient_birth" pattern="yyyy-MM-DD" autocomplete="off"></p>

                                        </div>
                                    <%--</div>--%>


                                    <%--<div class="col-lg-5">--%>
                                    <div>
                                        性别: <input type="radio" name="patient_sex" id="nv" value="1"
                                                     autocomplete="off"
                                                     <c:if test="${user.patient_sex=='1'}">checked="checked"</c:if>>女
                                        <input type="radio" name="patient_sex"  id="nan" value="0"
                                               autocomplete="off"
                                               <c:if test="${user.patient_sex=='0'}">checked="checked"</c:if>>男
                                    </div>
                                <%--</div>--%>


                                <%--<div class="col-lg-11">--%>
                                    <div>
                                        <button type="submit" onClick="return checkall()"
                                                style="background-color:#1A76D1; color: #F0F8FD; border: 0px; margin-left: 0px; margin-top: 10px; height: 40px;width: 100px">立即提交
                                        </button>
                                        <button type="reset" style="background-color:#0b0b0b; color: #F0F8FD; border: 0px; margin-left: 0px; margin-top: 10px; height: 40px;width: 100px">重置</button>
                                    </div>
                                </div>
                            </div>

                        </form>
                        <!--/ End Form -->
                    </div>
                </div>


            </div>
        </div>
        <div class="contact-info">
            <div class="row">
                <!-- single-info -->
                <div class="col-lg-4 col-12 ">
                    <div class="single-info">
                        <i class="icofont icofont-ui-call"></i>
                        <div class="content">
                            <h3>+(000) 1234 56789</h3>
                            <p>info@company.com</p>
                        </div>
                    </div>
                </div>
                <!--/End single-info -->
                <!-- single-info -->
                <div class="col-lg-4 col-12 ">
                    <div class="single-info">
                        <i class="icofont-google-map"></i>
                        <div class="content">
                            <h3>2 Fir e Brigade Road</h3>
                            <p>Chittagonj, Lakshmipur</p>
                        </div>
                    </div>
                </div>
                <!--/End single-info -->
                <!-- single-info -->
                <div class="col-lg-4 col-12 ">
                    <div class="single-info">
                        <i class="icofont icofont-wall-clock"></i>
                        <div class="content">
                            <h3>Mon - Sat: 8am - 5pm</h3>
                            <p>Sunday Closed</p>
                        </div>
                    </div>
                </div>
                <!--/End single-info -->
            </div>
        </div>
    </div>
</section>
<!--/ End Contact Us -->

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
<!-- Google Map API Key JS -->
<script src="https://ditu.google.cn/maps/api/js?key=AIzaSyDGqTyqoPIvYxhn_Sa7ZrK5bENUWhpCo0w"></script>
<!-- Gmaps JS -->
<script src="js/gmaps.min.js"></script>
<!-- Map Active JS -->
<script src="js/map-active.js"></script>
<!-- Bootstrap JS -->
<script src="https://www.jq22.com/jquery/bootstrap-4.2.1.js"></script>
<!-- Main JS -->
<script src="js/main.js"></script>
</body>
</html>
