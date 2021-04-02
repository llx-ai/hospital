<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<html class="no-js" lang="zxx">
<head>
    <!-- Meta Tags -->
    <base href="<%=basePath%>">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="keywords" content="Site keywords here">
    <meta name="description" content="">
    <meta name='copyright' content=''>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <script type="text/javascript" src="js/jquery-1.11.2.min.js"></script>

    <!-- Title -->
    <title>主页</title>

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

<%--<script>
    function checkUser() {
        $.ajax({
            url:"/changeController/checkUser",
            success:function (data) {

            }
        })
    }
</script>--%>

<script type="text/javascript">

    //加载部门和日期
    $(document).ready(function(){
        /*$.ajax({
            url:"http://192.168.9.37:8234/PatientController/queryAllDept",
            type:"get",
            xhrFields:{
                withCredentials:true
            },
            datatype:"json",
            success: function(data){
                var str="";
                for(var i=0;i<data.length;i++){
                    str=str+"<li>"+data[i].dept_name+"</li>"
                }
                $("#dept").html(str);
            }
        });*/

        var d = new Date();
        //获取月份
        var month = d.getMonth() + 1
        //获取日期
        var month_day = d.getDate()
        //获取星期
        var month_week = d.getDay()
        var str_month_week = ''
        console.log(month_week)
        if(month <10){
            month = '0'+month
        }
        if(month_day <10){
            month_day = '0'+month_day
        }

        var str_date = ""
        for(var i = 0;i<7;i++){
            if(month_week == 1){
                str_month_week = '星期一'
            }else if(month_week == 2){
                str_month_week = '星期二'
            }else if(month_week == 3){
                str_month_week = '星期三'
            }else if(month_week == 4){
                str_month_week = '星期四'
            }else if(month_week == 5){
                str_month_week = '星期五'
            }else if(month_week == 6){
                str_month_week = '星期六'
            }else if(month_week == 0){
                str_month_week = '星期日'
            }

            str_date = str_date + "<li class=\"option\">"+month+"-"+month_day+"/"+str_month_week+"</li>"
            month_day = month_day +1;
            month_week = month_week +1;
            if(month_week == 7){
                month_week = 0
            }
            /*if(month == dd.getDate()){
                var dd = new Date(d.getFullYear(),month,0);
                console.log(dd.getDate());
            }*/
        }
        $("#week").html(str_date)
    })
</script>
<script>
    function getAppointment(doctor_id) {

        // checkUser();


        var time = ''
        var fm = new Date()
        var year = fm.getFullYear()

        //获取日期
        var date_time1=document.getElementById("weekContent").innerText;
        //获取时间（上午或下午）
        var date_time2 = document.getElementById("dateContent").innerText;

        if(date_time2 == "上午"){
            time = year+ '-' + date_time1.substring(0,5)+' 08:00:00'
        }else if(date_time2 == "下午"){
            time = year+ '-' + date_time1.substring(0,5)+' 14:00:00'
        }

        console.log("时间："+time)
        console.log("时间格式化："+new Date(time))

        //编写ajax
        $.ajax({
            url:'/changeController/gotoAppointment',
            type:'get',
            data:{
                time:time,
                doctor_id:doctor_id
            },
            success:function(){
                console.log("跳转成功")

                window.location = "${pageContext.request.contextPath}/appointment.jsp"
            }

        })

    }
</script>
<script>
    function getSchedule(form) {

        var flag = 0;

        var dept=document.getElementById("deptContent").innerText;
        console.log("部门："+dept)

        //部门号
        var deptId = 0;
        //时间：代表上午或下午
        var dateId = document.getElementById("dateContent").innerText;
        //星期
        var day = "";
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


        //获取选择的时间
        var date=document.getElementById("weekContent");
        console.log("日期："+date)
        var content_date = date.innerText;
        //获取星期
        var content_week = content_date.substring(content_date.length-3)

        console.log("获取选择的星期"+content_week)

        if(content_week == "星期一"){
            day = "schedule_mon"
        }else if(content_week == "星期二"){
            day = "schedule_tue"
        }else if(content_week == "星期三"){
            day = "schedule_wed"
        }else if(content_week == "星期四"){
            day = "schedule_thu"
        }else if(content_week == "星期五"){
            day = "schedule_fri"
        }else if(content_week == "星期六"){
            day = "schedule_sat"
        }else if(content_week == "星期日"){
            day = "schedule_sun"
        }else{
            if(flag == 0) {
                flag = 1;
                alert('请选择日期！')
            }
        }

        console.log('选择的时间：'+dateId)

        if(dateId == "上午"){
            dateId = 1
        }else if(dateId == "下午"){
            dateId = 2
        }else{
            if(flag == 0){
                flag = 1;
                alert('请选择时间！')
            }
        }

        if(flag == 0){
            $.ajax({
                url:"/scheduleController/showScheduleDoctor",
                type:"get",
                xhrFields:{
                    withCredentials:true
                },
                data:{
                    day:day,
                    dateId:dateId,
                    deptId:deptId
                },
                success:function (data) {
                    var str_doctorInfo =''
                    console.log("医生姓名："+data[0].doctor_name)
                    console.log("长度2"+data.length)
                    for(var i = 0 ; i<data.length;i++){
                        str_doctorInfo = str_doctorInfo + "<div class=\"col-lg-3 col-md-6 col-12 \" data-tilt>\n" +
                            "                <div class=\"single-team\">\n" +
                            "                    <div class=\"t-head\">\n" +
                            "                        <img src='"+data[i].doctor_img+"'  alt=\"#\">\n" +
                            "                        <div class=\"t-icon\">\n" +
                            "                            <a onclick='getAppointment("+data[i].doctor_id+")' class=\"btn\">预约</a>\n" +
                            "                        </div>\n" +
                            "                    </div>\n" +
                            "                    <div class=\"t-bottom\">\n" +
                            "                        <h2><a href=\"doctor-details.html\">"+data[i].doctor_name+"</a></h2>\n" +
                            "                        <p>"+data[i].doctor_rank+"</p>\n" +
                            "                        <p>"+data[i].doctor_dept+"</p>\n" +
                            "                        <p>"+data[i].doctor_specialty+"</p>\n" +
                            "                    </div>\n" +
                            "                </div>\n" +
                            "            </div>"

                    }
                    console.log('医生'+str_doctorInfo)
                    $("#doctorList").html(str_doctorInfo)
                }
            })
        }

    }


</script>
<script>
    //根据医生id查找医生排班表
    function selectSchedule() {
        $.ajax({
            url:"/scheduleController/showScheduleByDoctor",
            type:"get",
            success:function (data) {
                window.location = "${pageContext.request.contextPath}/scheduleTable.jsp";
            }
        })
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
                                    <li ><a href="index.jsp">主页 </a>
                                    </li>
                                    <li class="active"><a href="showScheduleDoctor.jsp">门诊预约<i class="icofont-rounded-down"></i></a>
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
                                        <li><a href="patientInfo.jsp">个人中心 <i class="icofont-rounded-down"></i></a>
                                            <ul class="dropdown">
                                                <li><a href="patientInfo.jsp">个人信息</a></li>
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

<!-- Start Feautes/查询排班信息模块 -->
<section class="Feautes section">
    <div class="container">
        <div class="row" style="height: 50px">

        </div>

        <!--查询排班信息模块 -->
        <div >

            <form class="form" >
                <div class="row">
                    <div class="col-lg-3 col-md-3 col-3">
                        <div class="form-group">
                            <div class="nice-select form-control wide" tabindex="0"><span id="deptContent" class="current">部门</span>
                                <ul class="list" id="dept">
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
                    <div class="col-lg-3 col-md-3 col-3">
                        <div class="form-group">
                            <div class="nice-select form-control wide" tabindex="0"><span id="weekContent" class="current">日期</span>
                                <ul class="list" id="week">

                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-3 col-3">
                        <div class="form-group">
                            <div class="nice-select form-control wide" tabindex="0"><span id="dateContent" class="current">时间</span>
                                <ul class="list" id="date">
                                    <li data-value="1" class="option">上午</li>
                                    <li data-value="2" class="option">下午</li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-3 col-3">
                        <div class="form-group">
                            <div class="button">
                                <button type="button" onclick="getSchedule(this);" class="btn" >查询</button>
                            </div>
                        </div>
                    </div>
                </div>
            </form>
            <!--显示医生列表信息 -->
            <div id="showScheduleDoctor">

            </div>
            <div>
                <ul id="showScheduleDoctor2">

                </ul>
            </div>

        </div>

    </div>
</section>
<!--/ End Feautes -->

<!-- Start Team -->
<section id="team" class="team section overlay" data-stellar-background-ratio="0.5">
    <div class="container">
        <div class="row" id="doctorList">

        </div>
    </div>
</section>
<!--/ End Team -->

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
