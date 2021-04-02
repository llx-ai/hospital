<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2021/3/11
  Time: 10:27
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
    <base href="<%=basePath%>" >
    <title>医生的个人中心</title>
    <script src="js/jquery.js" type="text/javascript"></script>


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




<script>
    //上传头像
    function previewFile() {
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



    var falge1 = false;


    function checkname() {
        var name = document.getElementById("name");
        var mes = document.getElementById("warning-message0");
        if (name.value.length>0) {
            mes.innerHTML ="";
            falge1 = true;
        } else {
            mes.innerHTML = "修改的姓名不能为空";
            mes.setAttribute("style", "font-size:9px;color:red");
            falge1 = false;
        }
        return falge1;
    }

    function checkpwd1() {

        var pwd1 = document.getElementById("pwd0");
        var pwd2 = document.getElementById("pwd1");
        var mes = document.getElementById("warning-message1");
        if (pwd2.value.trim() == pwd1.value.trim() || pwd2.value.trim() == "") {
            mes.innerHTML ="";
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
            mes1.setAttribute("style", "font-size:9px;color:red");
            falge1 = false;

        }

        if(pwd0.value.length<6){
            mes.innerHTML = "修改的密码位数不能小于6位";
            mes.setAttribute("style", "font-size:9px;color:red");
            falge1 = false;
        }

         if(pwd0.value.trim() != pwd1.value.trim()) {
            mes.innerHTML = "两次密码不一致";
            mes.setAttribute("style", "font-size:9px;color:red");
            falge1 = false;
        }

        if(pwd1.value.length<6){
            mes.innerHTML = "修改的密码位数不能小于6位";
            mes.setAttribute("style", "font-size:9px;color:red");
            falge1 = false;
        }

        if(pwd0.value.trim() == "" && pwd1.value.trim() == ""){
            mes.innerHTML ="";
            falge1 = true;
        }

        if (pwd1.value.trim() == pwd3.value.trim()) {
            mes.innerHTML = "与原密码一致";
            falge1 = false;
            mes.setAttribute("style", "font-size:9px;color:red");
        }



        if (pwd0.value.trim() == pwd1.value.trim()&&pwd1.value.length>5) {
            mes.innerHTML ="";
            falge1 = true;
        }

        return falge1;
    }

    //var f=false;

    /*function checkphone() {
        var phone = document.getElementById("phone").value;
        var mes = document.getElementById("warning-message3");
        var re = /^1\d{10}$/;

        if (re.test(phone)) {
            mes.innerHTML ="";
            falge1 = true;
        } else if(phone.length==0){
            mes.innerHTML = "";
            falge1 = true;
        }else{
            mes.innerHTML = "手机号输入违法";
            falge1 = false;
        }

        $.get("doctorController/selectDoctorByPhone",{doctor_phone:phone},function(data){

            if(data=='nofind'&&re.test(phone)){
                //可以使用
                mes.innerHTML ="";
                flag1=true;
            }else if(data=='find'&&re.test(phone)){
                mes.innerHTML = "已经存在该手机号";
                flag1=false;
            }

        });
        console.log("123456"+flag1);
        return falge1
    }*/

    function checkall() {

        //return falge1;
        return checkpwd1()&&checkpwd2()&&checkname();

    }

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


<section class="doctor-calendar-area section">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="section-title">
                    <h2>排班时间表</h2>
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
                                    <a onclick="gotoappointment(${doctor.doctor_id},1,1)">上班</a>
                                </c:if>

                            </td>
                            <td>
                                <c:if test="${scheduleList.schedule_tue == 1 or scheduleList.schedule_tue == 3}">
                                    <a onclick="gotoappointment(${doctor.doctor_id},2,1)">上班</a>
                                </c:if>
                            </td>
                            <td>
                                <c:if test="${scheduleList.schedule_wed == 1 or scheduleList.schedule_wed == 3}">
                                    <a onclick="gotoappointment(${doctor.doctor_id},3,1)">上班</a>
                                </c:if>
                            </td>
                            <td>
                                <c:if test="${scheduleList.schedule_thu == 1 or scheduleList.schedule_thu == 3}">
                                    <a onclick="gotoappointment(${doctor.doctor_id},4,1)">上班</a>
                                </c:if>
                            </td>
                            <td>
                                <c:if test="${scheduleList.schedule_fri == 1 or scheduleList.schedule_fri == 3}">
                                    <a onclick="gotoappointment(${doctor.doctor_id},5,1)">上班</a>
                                </c:if>
                            </td>
                            <td>
                                <c:if test="${scheduleList.schedule_sat == 1 or scheduleList.schedule_sat == 3}">
                                    <a onclick="gotoappointment(${doctor.doctor_id},6,1)">上班</a>
                                </c:if>
                            </td>
                            <td>
                                <c:if test="${scheduleList.schedule_sun == 1 or scheduleList.schedule_sun == 3}">
                                    <a onclick="gotoappointment(${doctor.doctor_id},7,1)">上班</a>
                                </c:if>
                            </td>
                        </tr>

                        <tr>
                            <td><span class="time">下午</span></td>
                            <td>
                                <c:if test="${scheduleList.schedule_mon == 2 or scheduleList.schedule_mon == 3}">
                                    <a onclick="gotoappointment(${doctor.doctor_id},1,2)">上班</a>
                                </c:if>
                            </td>
                            <td>
                                <c:if test="${scheduleList.schedule_tue == 2 or scheduleList.schedule_tue == 3}">
                                    <a onclick="gotoappointment(${doctor.doctor_id},2,2)">上班</a>
                                </c:if>
                            </td>
                            <td>
                                <c:if test="${scheduleList.schedule_wed == 2 or scheduleList.schedule_wed == 3}">
                                    <a onclick="gotoappointment(${doctor.doctor_id},3,2)">上班</a>
                                </c:if>
                            </td>
                            <td>
                                <c:if test="${scheduleList.schedule_thu == 2 or scheduleList.schedule_thu == 3}">
                                    <a onclick="gotoappointment(${doctor.doctor_id},4,2)">上班</a>
                                </c:if>
                            </td>
                            <td>
                                <c:if test="${scheduleList.schedule_fri == 2 or scheduleList.schedule_fri == 3}">
                                    <a onclick="gotoappointment(${doctor.doctor_id},5,2)">上班</a>
                                </c:if>
                            </td>
                            <td>
                                <c:if test="${scheduleList.schedule_sat == 2 or scheduleList.schedule_sat == 3}">
                                    <a onclick="gotoappointment(${doctor.doctor_id},6,2)">上班</a>
                                </c:if>
                            </td>
                            <td>
                                <c:if test="${scheduleList.schedule_sun == 2 or scheduleList.schedule_sun == 3}">
                                    <a onclick="gotoappointment(${doctor.doctor_id},7,2)">上班</a>
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


<!-- 医生个人中心板块 -->
<section class="contact-us section col-lg-10">
    <div class="container">
        <div class="inner">
            <div class="row">

                <!--医生个人的信息-->
                <div class="col-lg-6">
                    <div class="contact-us-left">

                        <h2>医生的个人信息显示</h2>

                        <div class="col-lg-12">
                            <div class="form-group">
                                <p>头像:</p>   <img src="<%=basePath%>${doctor.doctor_img}" class="img-circle"
                                                  border="0" height="150" id="pic1" width="150" />
                            </div>
                        </div>


                        <div class="col-lg-12">
                            <div class="form-group">
                                <p>姓名:${doctor.doctor_name}</p>
                            </div>
                        </div>

                        <div class="col-lg-12">

                            <div class="form-group col-lg-6">
                                <p>部门:</p>${doctor.dept_name}
                            </div>

                            <div class="form-group col-lg-6">
                                <p>职称:</p>${doctor.rank_name}
                            </div>

                        </div>

                        <div class="col-lg-12">
                            <div class="form-group">
                                <p>性别:</p>
                                    <c:if test="${doctor.doctor_sex eq '0'}">
                                     男
                                    </c:if>
                                    <c:if test="${doctor.doctor_sex eq '1'}">
                                        女
                                    </c:if>

                            </div>
                        </div>

                        <div class="col-lg-12">
                            <div class="form-group">

                                <p>电话:</p>${doctor.doctor_phone}

                            </div>
                        </div>

                        <div class="col-lg-12">
                            <div class="form-group">
                                <p>专长:</p>${doctor.doctor_specialty}
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
                        <h2>医生的个人中心修改</h2>

                        <!-- Form -->
                        <form class="form" method="post" action="doctorController/updateDoctorInfo"
                              enctype="multipart/form-data" >
                            <input type="hidden" name="doctor_id" value="${doctor.doctor_id}">
                            <div class="row">

                                <%--οnsubmit="return checkall()"--%>


                                <div class="col-lg-12">
                                    <div class="form-group">
                                        <p>姓名:</p>     <input type="text" id="name" name="doctor_name" value="${doctor.doctor_name}" onblur="checkname()" >
                                        <p style="color:red" id="warning-message0"></p>
                                        <input type="hidden" value="${doctor.doctor_phone}" name="phone">
                                    </div>
                                </div>

                                <input type="hidden" id="pwd0" value="${doctor.doctor_pwd}">
                                <div class="col-lg-12">

                                    <div class="form-group">
                                        <p>原密码:</p>
                                        <input type="password" name="doctor_pwd0" id="pwd1" onblur="checkpwd1()">
                                        <p style="color:red" id="warning-message1"></p>
                                    </div>
                                </div>

                                <div class="col-lg-5">

                                    <div class="form-group">
                                        <input type="hidden" name="pwd" value="${doctor.doctor_pwd}">
                                        修改密码(为空则不修改)
                                        <input type="password" name="doctor_pwd" id="pwd2" >
                                    </div>
                                </div>

                                <div class="col-lg-5">

                                    <div class="form-group">
                                        确认密码:
                                        <input type="password" name="doctor_pwd1" id="pwd3" onblur="checkpwd2()">
                                        <p style="color:red" id="warning-message2"></p>
                                    </div>
                                </div>

                                <%--<div class="col-lg-5">
                                   <input type="hidden" name="phone" value="${doctor.doctor_phone}">
                                    <div class="form-group ">
                                        修改绑定的电话:(为空则不修改) <input type="text" name="doctor_phone"  id="phone" onblur="checkphone()">
                                        <p style="color:red" id="warning-message3"></p>
                                    </div>
                                </div>--%>

                                <div class="col-lg-5">
                                    <div class="form-group ">
                                        性别:  <input class="col-lg-3" type="radio" name="doctor_sex" value="0"  <c:if test="${doctor.doctor_sex=='0'}">checked="checked"</c:if>>男
                                        <input class="col-lg-3" type="radio" name="doctor_sex" value="1"  <c:if test="${doctor.doctor_sex=='1'}">checked="checked"</c:if>>女
                                    </div>
                                </div>



                                <div class="col-lg-11">


                                    <div class="form-group">
                                        照片:
                                        <div class="img-circle"
                                             style="margin: 0 auto; padding-top: 10px; background-color: white; width: 150px; height: 150px;">
                                            <c:if test="${!empty doctor.doctor_img}">
                                                <img src="<%=basePath%>${doctor.doctor_img}"
                                                     id="pic" style="border-radius: 50%;height: 100px;width: 100px"/>
                                            </c:if>
                                            <%--<c:if test="${empty doctor.doctor_img}">--%>
                                                <%--<img src="/img/noimg.jpg"--%>
                                                     <%--id="pic" style="border-radius: 50%;height: 100px;width: 100px"/>--%>
                                            <%--</c:if>--%>
                                        </div>

                                        <button type="button"
                                                style="background-color: #196BA2; color: #F0F8FD; border: 0px; margin-left: 70px; margin-top: 20px; height: 50px;width: 200px"
                                                class="btn btn-default">上传头像</button>
                                        <input onchange="previewFile()"  type="file"
                                               style="cursor: pointer; opacity: 0; margin-left: 70px; margin-top: -25px; color: skyblue;"
                                               size="25" name="doctor_img" />

                                    </div>
                                </div>

                                <div class="col-lg-12">
                                    个人专长
                                    <div class="form-group">
                                        <input type="text" name="doctor_specialty" value="${doctor.doctor_specialty}">
                                    </div>
                                </div>



                                <div class="col-lg-12">

                                    <div class="form-group">
                                        个人简介
                                        <%--<div style="width: 100px;height: 100px;padding-bottom: 50px">--%>

                                        <textarea name="doctor_resume" id="myeditor"  style="height: 100px;width: 500px">
                                            ${doctor.doctor_resume}
                                        </textarea>

                                        <%--<script id="myeditor" name="doctor_resume" type="text/plain" >--%>
                                        <%--${doctor.doctor_resume}--%>
                                        <%--</script>--%>

                                        <!--创建富文本器-->
                                        <script>
                                            // var ue = new UE.ui.Editor({ initialFrameHeight:100,initialFrameWidth:300 });
                                            // editor.render("myeditor");

                                            var ue=UE.getEditor("myeditor");
                                        </script>
                                        <%--</div>--%>
                                    </div>

                                </div>


                                <div class="col-lg-11">
                                    <div class="form-group login-btn">
                                        <input class="btn" id="change" onclick="return checkall()" type="submit" value="确认修改" >
                                    </div>
                                </div>

                                <div class="col-lg-11">
                                    <div class="form-group login-btn">
                                        <input class="btn" type="reset" value="重置">
                                    </div>
                                </div>



                                <div class="col-lg-12">
                                    <div class="form-group login-btn">

                                    </div>
                                </div>



                            </div>



                        </form>
                        <!--/ End Form -->
                    </div>
                </div>


            </div>
        </div>

    </div>
</section>
<!--/ End Contact Us -->


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
