<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2021/3/11
  Time: 16:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html class="no-js" lang="zxx">
<head>
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
    function updateSchedule(doctor_id,dayId,dateId) {
        var arr = ['schedule_mon','schedule_tue','schedule_wed','schedule_thu','schedule_fri','schedule_sat','schedule_sun']

        var day = arr[dayId]
        $.ajax({
            url:"/scheduleController/updateSchedule",
            type:"get",
            data:{
                doctor_id:doctor_id,
                day:day,
                dateId:dateId
            },
            success:function (data) {
                getScheduleByDept()
            }
        })
    }
</script>
<script>
    function getScheduleByDept() {
        var dept=document.getElementById("deptContent1").innerText;
        var deptId;
        var flag = 0
        if(dept=="神经科"){
            deptId = 1
        }else if(dept=="内科"){
            deptId = 2
        }else if(dept=="骨科"){
            deptId = 3
        }else if(dept=="胸外科"){
            deptId = 4
        }else if(dept=="儿外科"){
            deptId = 5
        }else if(dept=="普外科"){
            deptId = 6
        }else if(dept=="妇科"){
            deptId = 7
        }else if(dept=="急诊科"){
            deptId = 8
        }else if(dept=="皮肤科"){
            deptId = 9
        }else{
            flag = 1;
            alert('请选择部门！')
        }
        if(flag == 0){
            $.ajax({
                url:"/scheduleController/showScheduleByDept",
                type:"get",
                data:{
                    deptId:deptId
                },
                success:function (data) {
                    var str = ''
                    var str2 = "<h3>出诊</h3>"
                    var str3_start = "<a href='javascript:;' onclick='updateSchedule("
                    var str3_end1 = ");return false'>添加出诊</a>"
                    var str3_end2 = ");return false'>取消出诊</a>"
                    for(var i= 0 ; i< data.length;i++){

                        str = str + "<tr>" +
                            "                            <td rowspan='2'>"+data[i].doctor_name+"</td>" +
                            "                            <td><span class='time'>上午</span></td>" +
                            "                            <td>"
                        if(data[i].schedule_mon == 1 ){
                            str = str + str2
                            str = str + str3_start + data[i].doctor_id+","+0 +","+ 0 + str3_end2
                        }else if( data[i].schedule_mon == 3){
                            str = str + str2
                            str = str + str3_start + data[i].doctor_id+","+0 +","+ 2 + str3_end2
                        }else{
                            if(data[i].schedule_mon == 2){//改成3
                                str = str + str3_start + data[i].doctor_id+","+0+","+3+str3_end1
                            }else{//改成1
                                str = str + str3_start + data[i].doctor_id+","+0+","+1+str3_end1
                            }
                        }
                        str = str +"</td><td>"
                        if(data[i].schedule_tue == 1 ){
                            str = str + str2
                            str = str + str3_start + data[i].doctor_id+","+1 +","+ 0 + str3_end2
                        }else if(data[i].schedule_tue == 3){
                            str = str + str2
                            str = str + str3_start + data[i].doctor_id+","+1 +","+ 2 + str3_end2
                        }
                        else{
                            if(data[i].schedule_tue == 2){//改成3
                                str = str + str3_start + data[i].doctor_id+","+1+","+3+str3_end1
                            }else{//改成1
                                str = str + str3_start + data[i].doctor_id+","+1+","+1+str3_end1
                            }
                        }
                        str = str +"</td><td>"
                        if(data[i].schedule_wed == 1 ){
                            str = str + str2
                            str = str + str3_start + data[i].doctor_id+","+2 +","+ 0 + str3_end2
                        }else if(data[i].schedule_wed == 3){
                            str = str + str2
                            str = str + str3_start + data[i].doctor_id+","+2 +","+ 2 + str3_end2
                        }
                        else{
                            if(data[i].schedule_wed == 2){//改成3
                                str = str + str3_start + data[i].doctor_id+","+2+","+3+str3_end1
                            }else{//改成1
                                str = str + str3_start + data[i].doctor_id+","+2+","+1+str3_end1
                            }
                        }
                        str = str +"</td><td>"
                        if(data[i].schedule_thu == 1 ){
                            str = str + str2
                            str = str + str3_start + data[i].doctor_id+","+3+","+ 0 + str3_end2
                        }else if(data[i].schedule_thu == 3){
                            str = str + str2
                            str = str + str3_start + data[i].doctor_id+","+3+","+ 2 + str3_end2
                        }
                        else{
                            if(data[i].schedule_thu == 2){//改成3
                                str = str + str3_start + data[i].doctor_id+","+3+","+3+str3_end1
                            }else{//改成1
                                str = str + str3_start + data[i].doctor_id+","+3+","+1+str3_end1
                            }
                        }
                        str = str +"</td><td>"
                        if(data[i].schedule_fri == 1 ){
                            str = str + str2
                            str = str + str3_start + data[i].doctor_id+","+4+","+ 0 + str3_end2
                        }else if(data[i].schedule_fri == 3){
                            str = str + str2
                            str = str + str3_start + data[i].doctor_id+","+4+","+ 2 + str3_end2
                        }
                        else{
                            if(data[i].schedule_fri == 2){//改成3
                                str = str + str3_start + data[i].doctor_id+","+4+","+3+str3_end1
                            }else{//改成1
                                str = str + str3_start + data[i].doctor_id+","+4+","+1+str3_end1
                            }
                        }
                        str = str +"</td><td>"
                        if(data[i].schedule_sat == 1 ){
                            str = str + str2
                            str = str + str3_start + data[i].doctor_id+","+5+","+ 0 + str3_end2
                        }else if(data[i].schedule_sat == 3){
                            str = str + str2
                            str = str + str3_start + data[i].doctor_id+","+5+","+ 2 + str3_end2
                        }
                        else{
                            if(data[i].schedule_sat == 2){//改成3
                                str = str + str3_start + data[i].doctor_id+","+5+","+3+str3_end1
                            }else{//改成1
                                str = str + str3_start + data[i].doctor_id+","+5+","+1+str3_end1
                            }
                        }
                        str = str +"</td><td>"
                        if(data[i].schedule_sun == 1 ){
                            str = str + str2
                            str = str + str3_start + data[i].doctor_id+","+6+","+ 0 + str3_end2
                        }else if(data[i].schedule_sun == 3){
                            str = str + str2
                            str = str + str3_start + data[i].doctor_id+","+6+","+ 2 + str3_end2
                        }
                        else{
                            if(data[i].schedule_sun == 2){//改成3
                                str = str + str3_start + data[i].doctor_id+","+6+","+3+str3_end1
                            }else{//改成1
                                str = str + str3_start + data[i].doctor_id+","+6+","+1+str3_end1
                            }
                        }
                        str = str +"</td></tr>"

                        str = str + "<tr>" +
                            "                            <td><span class='time'>下午</span></td>" +
                            "                            <td>"

                        if(data[i].schedule_mon == 2 ){
                            str = str + str2
                            str = str + str3_start + data[i].doctor_id+","+0+","+ 0 + str3_end2
                        }else if(data[i].schedule_mon == 3){
                            str = str + str2
                            str = str + str3_start + data[i].doctor_id+","+0+","+ 1 + str3_end2
                        }
                        else{
                            if(data[i].schedule_mon == 1){//改成3
                                str = str + str3_start + data[i].doctor_id+","+0+","+3+str3_end1
                            }else{//改成1
                                str = str + str3_start + data[i].doctor_id+","+0+","+2+str3_end1
                            }
                        }
                        str = str +"</td><td>"
                        if(data[i].schedule_tue == 2 ){
                            str = str + str2
                            str = str + str3_start + data[i].doctor_id+","+1+","+ 0 + str3_end2
                        }else if(data[i].schedule_tue == 3){
                            str = str + str2
                            str = str + str3_start + data[i].doctor_id+","+1+","+ 1 + str3_end2
                        }
                        else{
                            if(data[i].schedule_tue == 1){//改成3
                                str = str + str3_start + data[i].doctor_id+","+1+","+3+str3_end1
                            }else{//改成1
                                str = str + str3_start + data[i].doctor_id+","+1+","+2+str3_end1
                            }
                        }
                        str = str +"</td><td>"
                        if(data[i].schedule_wed == 2 ){
                            str = str + str2
                            str = str + str3_start + data[i].doctor_id+","+2+","+ 0 + str3_end2
                        }else if(data[i].schedule_wed == 3){
                            str = str + str2
                            str = str + str3_start + data[i].doctor_id+","+2+","+ 1 + str3_end2
                        }
                        else{
                            if(data[i].schedule_wed == 1){//改成3
                                str = str + str3_start + data[i].doctor_id+","+2+","+3+str3_end1
                            }else{//改成1
                                str = str + str3_start + data[i].doctor_id+","+2+","+2+str3_end1
                            }
                        }
                        str = str +"</td><td>"
                        if(data[i].schedule_thu == 2 ){
                            str = str + str2
                            str = str + str3_start + data[i].doctor_id+","+3+","+ 0 + str3_end2
                        }else if(data[i].schedule_thu == 3){
                            str = str + str2
                            str = str + str3_start + data[i].doctor_id+","+3+","+ 1 + str3_end2
                        }
                        else{
                            if(data[i].schedule_thu == 1){//改成3
                                str = str + str3_start + data[i].doctor_id+","+3+","+3+str3_end1
                            }else{//改成1
                                str = str + str3_start + data[i].doctor_id+","+3+","+2+str3_end1
                            }
                        }
                        str = str +"</td><td>"
                        if(data[i].schedule_fri == 2){
                            str = str + str2
                            str = str + str3_start + data[i].doctor_id+","+4+","+ 0 + str3_end2
                        }else if(data[i].schedule_fri == 3){
                            str = str + str2
                            str = str + str3_start + data[i].doctor_id+","+4+","+ 1 + str3_end2
                        }
                        else{
                            if(data[i].schedule_fri == 1){//改成3
                                str = str + str3_start + data[i].doctor_id+","+4+","+3+str3_end1
                            }else{//改成1
                                str = str + str3_start + data[i].doctor_id+","+4+","+2+str3_end1
                            }
                        }
                        str = str +"</td><td>"
                        if(data[i].schedule_sat == 2 ){
                            str = str + str2
                            str = str + str3_start + data[i].doctor_id+","+5+","+ 0 + str3_end2
                        }else if(data[i].schedule_sat == 3){
                            str = str + str2
                            str = str + str3_start + data[i].doctor_id+","+5+","+ 1 + str3_end2
                        }
                        else{
                            if(data[i].schedule_sat == 1){//改成3
                                str = str + str3_start + data[i].doctor_id+","+5+","+3+str3_end1
                            }else{//改成1
                                str = str + str3_start + data[i].doctor_id+","+5+","+2+str3_end1
                            }
                        }
                        str = str +"</td><td>"
                        if(data[i].schedule_sun == 2 ){
                            str = str + str2
                            str = str + str3_start + data[i].doctor_id+","+6+","+ 0 + str3_end2
                        }else if(data[i].schedule_sun == 3){
                            str = str + str2
                            str = str + str3_start + data[i].doctor_id+","+6+","+ 1 + str3_end2
                        }
                        else{
                            if(data[i].schedule_sun == 1){//改成3
                                str = str + str3_start + data[i].doctor_id+","+6+","+3+str3_end1
                            }else{//改成1
                                str = str + str3_start + data[i].doctor_id+","+6+","+2+str3_end1
                            }
                        }
                        str = str +"</td></tr>"
                    }
                    $("#showScheduleDoctorByDept").html(str)


                }
            })
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
                        <div class="logo">
                            <a href="index.html"><img src="img/logo.png" alt="#"></a>
                        </div>
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
                                    <li class="active"><a href="#">Home <i class="icofont-rounded-down"></i></a>
                                        <ul class="dropdown">
                                            <li><a href="index.html">Home Page 1</a></li>
                                            <li><a href="index2.html">Home Page 2</a></li>
                                        </ul>
                                    </li>
                                    <li><a href="#">Doctos <i class="icofont-rounded-down"></i></a>
                                        <ul class="dropdown">
                                            <li><a href="doctors.html">Doctor</a></li>
                                            <li><a href="doctor-details.html">Doctor Details</a></li>
                                        </ul>
                                    </li>
                                    <li><a href="#">Services <i class="icofont-rounded-down"></i></a>
                                        <ul class="dropdown">
                                            <li><a href="service.html">Service</a></li>
                                            <li><a href="service-details.html">Service Details</a></li>
                                        </ul>
                                    </li>
                                    <li><a href="#">Pages <i class="icofont-rounded-down"></i></a>
                                        <ul class="dropdown">
                                            <li><a href="about.html">About Us</a></li>
                                            <li><a href="appointment.html">Appointment</a></li>
                                            <li><a href="time-table.html">Time Table</a></li>
                                            <li><a href="testimonials.html">Testimonials</a></li>
                                            <li><a href="pricing.html">Our Pricing</a></li>
                                            <li><a href="register.html">Sign Up</a></li>
                                            <li><a href="login.html">Login</a></li>
                                            <li><a href="faq.html">Faq</a></li>
                                            <li><a href="mail-success.html">Mail Success</a></li>
                                            <li><a href="404.html">404 Error</a></li>
                                        </ul>
                                    </li>
                                    <li><a href="#">Blogs <i class="icofont-rounded-down"></i></a>
                                        <ul class="dropdown">
                                            <li><a href="blog-grid.html">Blog Grid</a></li>
                                            <li><a href="blog-single.html">Blog Details</a></li>
                                        </ul>
                                    </li>
                                    <li><a href="contact.html">Contact Us</a></li>
                                </ul>
                            </nav>
                        </div>
                        <!--/ End Main Menu -->
                    </div>
                    <div class="col-lg-2 col-12">
                        <div class="get-quote">
                            <a href="appointment.html" class="btn">Book Appointment</a>
                        </div>
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
                    <h2>Time Table</h2>
                    <ul class="bread-list">
                        <li><a href="index.html">Home</a></li>
                        <li><i class="icofont-simple-right"></i></li>
                        <li class="active">Time Table</li>
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
                            <td rowspan="2">${scheduleList.schedule_doctor}</td>
                            <td><span class="time">上午</span></td>
                            <td>
                                <c:if test="${scheduleList.schedule_mon == 1 or scheduleList.schedule_mon == 3}">
                                    <h3>出诊</h3>
                                </c:if>

                            </td>
                            <td>
                                <c:if test="${scheduleList.schedule_tue == 1 or scheduleList.schedule_tue == 3}">
                                    <h3>出诊</h3>
                                </c:if>
                            </td>
                            <td>
                                <c:if test="${scheduleList.schedule_wed == 1 or scheduleList.schedule_wed == 3}">
                                    <h3>出诊</h3>
                                </c:if>
                            </td>
                            <td></td>
                            <td>
                                <c:if test="${scheduleList.schedule_thu == 1 or scheduleList.schedule_thu == 3}">
                                    <h3>出诊</h3>
                                </c:if>
                            </td>
                            <td>
                                <c:if test="${scheduleList.schedule_fri == 1 or scheduleList.schedule_fri == 3}">
                                    <h3>出诊</h3>
                                </c:if>
                            </td
                            <td>
                                <c:if test="${scheduleList.schedule_sat == 1 or scheduleList.schedule_sat == 3}">
                                    <h3>出诊</h3>
                                </c:if>
                            </td>
                            <td>
                                <c:if test="${scheduleList.schedule_sun == 1 or scheduleList.schedule_sun == 3}">
                                    <h3>出诊</h3>
                                </c:if>
                            </td>
                        </tr>

                        <tr>
                            <td><span class="time">下午</span></td>
                            <td>
                                <c:if test="${scheduleList.schedule_mon == 2 or scheduleList.schedule_mon == 3}">
                                    <h3>出诊</h3>
                                </c:if>
                            </td>
                            <td>
                                <c:if test="${scheduleList.schedule_tue == 2 or scheduleList.schedule_tue == 3}">
                                    <h3>出诊</h3>
                                </c:if>
                            </td>
                            <td>
                                <c:if test="${scheduleList.schedule_wed == 2 or scheduleList.schedule_wed == 3}">
                                    <h3>出诊</h3>
                                </c:if>
                            </td>
                            <td>
                                <c:if test="${scheduleList.schedule_thu == 2 or scheduleList.schedule_thu == 3}">
                                    <h3>出诊</h3>
                                </c:if>
                            </td>
                            <td>
                                <c:if test="${scheduleList.schedule_fri == 2 or scheduleList.schedule_fri == 3}">
                                    <h3>出诊</h3>
                                </c:if>
                            </td>
                            <td>
                                <c:if test="${scheduleList.schedule_sat == 2 or scheduleList.schedule_sat == 3}">
                                    <h3>出诊</h3>
                                </c:if>
                            </td>
                            <td>
                                <c:if test="${scheduleList.schedule_sun == 2 or scheduleList.schedule_sun == 3}">
                                    <h3>出诊</h3>
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

<!-- 查看一个科室的医生的排班信息 -->
<!-- Start Doctor Calendar Area -->
<section class="doctor-calendar-area section">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="section-title">
                    <h2>查看一个科室的医生的排班信息</h2>
                    <img src="img/section-img.png" alt="#">
                    <p>Lorem ipsum dolor sit amet consectetur adipiscing elit praesent aliquet. pretiumts</p>
                </div>
            </div>
        </div>
        <div  >
            <form class="form" >
                <div class="row">
                    <div class="col-lg-6 col-md-6 col-6">
                        <div class="form-group">
                            <div class="nice-select form-control wide" tabindex="0"><span id="deptContent1" class="current">部门</span>
                                <ul class="list" id="dept1">
                                    <li data-value="1" class="option">神经科</li>
                                    <li data-value="2" class="option">内科</li>
                                    <li data-value="3" class="option">骨科</li>
                                    <li data-value="4" class="option">胸外科</li>
                                    <li data-value="5" class="option">儿外科</li>
                                    <li data-value="1" class="option">普外科</li>
                                    <li data-value="2" class="option">妇科</li>
                                    <li data-value="3" class="option">急诊科</li>
                                    <li data-value="4" class="option">皮肤科</li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6 col-md-6 col-6">
                        <div class="form-group">
                            <div class="button">
                                <button type="button" onclick="getScheduleByDept();" class="btn" >查询</button>
                            </div>
                        </div>
                    </div>
                </div>
            </form>


        </div>
        <!--显示医生列表信息 -->
        <div class="row">
            <div class="col-12">
                <div class="doctor-calendar-table table-responsive">
                    <table class="table" >
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
                        <tbody id="showScheduleDoctorByDept">
                        <tr>
                            <td rowspan="2">${scheduleList.schedule_doctor}</td>
                            <td><span class="time">上午</span></td>
                            <td>
                                <c:if test="${scheduleList.schedule_mon == 1 or scheduleList.schedule_mon == 3}">
                                    <h3>出诊</h3>
                                </c:if>

                            </td>
                            <td>
                                <c:if test="${scheduleList.schedule_tue == 1 or scheduleList.schedule_tue == 3}">
                                    <h3>出诊</h3>
                                </c:if>
                            </td>
                            <td>
                                <c:if test="${scheduleList.schedule_wed == 1 or scheduleList.schedule_wed == 3}">
                                    <h3>出诊</h3>
                                </c:if>
                            </td>
                            <td></td>
                            <td>
                                <c:if test="${scheduleList.schedule_thu == 1 or scheduleList.schedule_thu == 3}">
                                    <h3>出诊</h3>
                                </c:if>
                            </td>
                            <td>
                                <c:if test="${scheduleList.schedule_fri == 1 or scheduleList.schedule_fri == 3}">
                                    <h3>出诊</h3>
                                </c:if>
                            </td
                            <td>
                                <c:if test="${scheduleList.schedule_sat == 1 or scheduleList.schedule_sat == 3}">
                                    <h3>出诊</h3>
                                </c:if>
                            </td>
                            <td>
                                <c:if test="${scheduleList.schedule_sun == 1 or scheduleList.schedule_sun == 3}">
                                    <h3>出诊</h3>
                                </c:if>
                            </td>
                        </tr>

                        <tr>
                            <td><span class="time">下午</span></td>
                            <td>
                                <c:if test="${scheduleList.schedule_mon == 2 or scheduleList.schedule_mon == 3}">
                                    <h3>出诊</h3>
                                </c:if>
                            </td>
                            <td>
                                <c:if test="${scheduleList.schedule_tue == 2 or scheduleList.schedule_tue == 3}">
                                    <h3>出诊</h3>
                                </c:if>
                            </td>
                            <td>
                                <c:if test="${scheduleList.schedule_wed == 2 or scheduleList.schedule_wed == 3}">
                                    <h3>出诊</h3>
                                </c:if>
                            </td>
                            <td></td>
                            <td>
                                <c:if test="${scheduleList.schedule_thu == 2 or scheduleList.schedule_thu == 3}">
                                    <h3>出诊</h3>
                                </c:if>
                            </td>
                            <td>
                                <c:if test="${scheduleList.schedule_fri == 2 or scheduleList.schedule_fri == 3}">
                                    <h3>出诊</h3>
                                </c:if>
                            </td>
                            <td>
                                <c:if test="${scheduleList.schedule_sat == 2 or scheduleList.schedule_sat == 3}">
                                    <h3>出诊</h3>
                                </c:if>
                            </td>
                            <td>
                                <c:if test="${scheduleList.schedule_sun == 2 or scheduleList.schedule_sun == 3}">
                                    <h3>出诊</h3>
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


<!-- Start Newsletter Area -->
<section class="newsletter section">
    <div class="container">
        <div class="row ">
            <div class="col-lg-6  col-12">
                <!-- Start Newsletter Form -->
                <div class="subscribe-text ">
                    <h6>Sign up for newsletter</h6>
                    <p class="">Cu qui soleat partiendo urbanitas. Eum aperiri indoctum eu,<br> homero alterum.</p>
                </div>
                <!-- End Newsletter Form -->
            </div>
            <div class="col-lg-6  col-12">
                <!-- Start Newsletter Form -->
                <div class="subscribe-form ">

                </div>
                <!-- End Newsletter Form -->
            </div>
        </div>
    </div>
</section>
<!-- /End Newsletter Area -->

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