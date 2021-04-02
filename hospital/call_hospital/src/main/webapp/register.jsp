<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2021/3/10
  Time: 14:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<html>
<head>
    <!-- Meta Tags -->
    <base href="<%=basePath%>" >
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="keywords" content="Site keywords here">
    <meta name="description" content="">
    <meta name='copyright' content=''>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Title -->
    <title>Mediplus - Medical and Doctor Directory HTML Template.</title>

    <script src="js/jquery.js" type="text/javascript"></script>
    <script src="js/ajaxfileupload.js" type="text/javascript"></script>

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
    p#warning-message2 {
        margin-bottom: auto;
    }
</style>
<script src="js/jquery.js" type="text/javascript"></script>
<script>
    var falge1=false;
    /*var falge2=false;
    function checkregister(op) {

        var mes = document.getElementById("warning-message2");

        $.get("PatientController/checkPhone", {op: op}, function (data) {
            alert(122)

            if (data == 1) {
                mes.innerHTML = "手机号已被注册";//
                mes.setAttribute("style", "font-size:15px;color:red");
                falge1 = false
            } else {
                mes.innerHTML = "";//
                // mes.setAttribute("style", "font-size:15px;color:red");
                falge1 = true
            }
        });
        console.log("是否已注册："+flag1)

        return falge1;
    }*/
    function checkpwd2() {
        var pwd0 = document.getElementById("pwd0");
        var pwd1 = document.getElementById("pwd1");
        var mes = document.getElementById("warning-message3");
        if (pwd0.value.trim() == pwd1.value.trim()) {
            mes.innerHTML = "";
            falge2 = true;
        } else {
            mes.innerHTML = "两次密码不一致";
            mes.setAttribute("style", "font-size:15px;color:red");
            falge2 = false;
        }
        console.log("密码："+falge2)
        return falge2;
    }

</script>

<script>
    var flag=false
    function checkall() {
        var userCode = document.getElementById("userCode").value
        var codeMessage = document.getElementById("codeMessage")
        // document.getElementById("codeMessage").innerText ="111111"
        console.log("用户输入的验证码为："+userCode)
        console.log("系统发送的验证码为："+codeMes)
        if(userCode == null || userCode == ''){
            flag=false
            codeMessage.innerText = "请输入验证码"
            return false
        }else if(codeMes != userCode){
            flag=false
            codeMessage.innerText = "验证码错误"
            return false
        }
        else{
            flag=true
            codeMessage.innerText = "验证码通过"
            /*console.log("12"+checkregister())
            console.log("sh"+falge1)
            console.log("13"+checkregister(document.getElementById("u_tel").value))
            console.log("15"+flag)*/
        }
        return flag && checkpwd2()

        // return flag && checkregister()&& checkpwd2();


    }

</script>
<script>
    var codeMes = ""

    function sendCode() {
        var tel = document.getElementById("u_tel").value
        var codeMessage = document.getElementById("codeMessage")
        $.ajax({
            url:"changeController/sendCode",
            type:"post",
            data:{
                u_tel:tel
            },
            success:function (data) {
                console.log("返回数据："+data)
                if(data == 'fail'){
                    check();
                    codeMessage.innerText = "发送失败，请稍后再试"
                }else{
                    check();
                    codeMes = data
                    flag=true

                }

            },
            error:function (data) {
                console.log("ajax失败！"+data)

            }

        })
    }
</script>
<script type="text/javascript">
    //短信验证码倒计时
    function check(){
        var $button = $(".sendVerifyCode");
        var number = 60;
        var countdown = function(){
            if (number == 0) {
                $button.attr("disabled",false);
                $button.html("发送验证码");
                number = 60;
                return;
            } else {
                $button.attr("disabled",true);
                $button.html(number + "秒 重新发送");
                number--;
            }
            setTimeout(countdown,1000);
        }
        setTimeout(countdown,1000);
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
                                        <li class="active"><a href="register.jsp">注册 </a>
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
                    <h2>Register</h2>
                    <ul class="bread-list">
                        <li><a href="index.html">Home</a></li>
                        <li><i class="icofont-simple-right"></i></li>
                        <li class="active">Register</li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- End Breadcrumbs -->

<!-- Shop Register -->
<section class="register section">
    <div class="container">
        <div class="inner">
            <div class="row">
                <div class="col-lg-6">
                    <div class="register-left">
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="register-form">
                        <h2>注册</h2>
                        <p>已经有一个账号了 ? <a href="login.jsp">Login Here</a></p>
                        <form class="form" method="post"  action="PatientController/register" onsubmit="return checkall();" enctype="multipart/form-data">
                        <img src="img/noimg.jpg" id="pic" style="border-radius: 50%;height: 100px;width: 100px"/><br>
                        <button type="button" style="background-color:#1A76D1; color: #F0F8FD; border: 0px; margin-left: 0px; margin-top: 10px; height: 40px;width: 130px" class="btn btn-default"> 上传头像
                        </button>
                        <input id="fileToUploadLink" onchange="previewFile()" type="file" style="cursor: pointer; opacity: 0; margin-left: 70px; margin-top: -25px; color: F0F8FD;" size="25"  name="patient_img"/>
                        <!-- Form -->
                            <div class="row">
                                <div class="col-lg-8">
                                    <div class="form-group">
                                        <input type="text" name="patient_name" placeholder="姓名" required="required">
                                    </div>
                                    <div class="form-group">
                                        <input type="text" name="patient_phone" placeholder="电话" id="u_tel" required="required" pattern="[0-9]{11}" onblur="checkregister(this.value)" >
                                        <p style="color:red" id="warning-message2"></p>
                                    </div>
                                    <div class="form-group">
                                        <input type="text" name="code" placeholder="验证码" required="required" id="userCode"  >
                                        <button type="button" class="sendVerifyCode" onclick="sendCode()">获取短信验证码</button>
                                        <p style="color:red" id="codeMessage"></p>
                                    </div>

                                    <div class="form-group">
                                        <input type="date" name="patient_birth" placeholder="出生日期" required="">
                                    </div>
                                    <div  class="form-group">
                                        <input type="password" name="patient_pwd" placeholder="密码" required="required" id="pwd0">
                                    </div>
                                    <div class="form-group">
                                        <input type="password" name="repatient_pwd" placeholder="确认密码" required="required" onblur="checkpwd2()" id="pwd1">
                                        <p style="color:red" id="warning-message3"></p>
                                    </div>
                                    <div class="sex">
                                        <input type="radio" class="sex" name="patient_sex" id="sex1" value="1" checked>
                                        <label for="sex1" style="cursor:pointer">女</label>
                                        <input type="radio" class="sex" name="patient_sex" id="sex2" value="0">
                                        <label for="sex2" style="cursor:pointer">男</label>
                                    </div>
                                </div>
                                <div class="col-12">
                                    <div class="form-group login-btn">
                                        <button type="submit"  class="btn" >Register</button>
                                    </div>
                                </div>
                            </div>
                        <!--/ End Form -->
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!--/ End Register -->

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

<script>
    //上传头像
    var falge1 = false;

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
</script>

<script src="js/jquery.js" type="text/javascript"></script>
<script src="js/ajaxfileupload.js" type="text/javascript"></script>

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
