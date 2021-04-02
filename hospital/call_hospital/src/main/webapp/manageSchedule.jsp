<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="baseUri" value="${pageContext.request.contextPath }"
       scope="request"></c:set>
<!DOCTYPE html>
<html>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<base href="<%=basePath%>" >
<head>
    <meta charset="utf-8">
    <title>春日医院预约网站</title>
    <link rel="stylesheet" href="${baseUri}/static/layui/css/layui.css">
    <script src="/static/layui/lay/modules/jquery.js" type="text/javascript"></script>
    <script src="${baseUri}/static/layui/layui.js"></script>

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
    <!--
    .pageshow {

        float: right;
        line-height: 50px;
        margin-right: 100px;
    }

    .wjl {
        width: 1500px;
        height: 45px;
        float: left
    }

    input,select {
        float: left;
        margin:4px;
        height: 25px;
        bpatient-radius: 5px;
        bpatient-color: grey;
    }
    select{
        width: 80px;


    }
    ::selection{
        color: darkgrey;
    }



    -->
</style>
<script>
    function getScheduleByDoctorName() {
        alert("进入getScheduleByDoctorName")
        var doctor_name = document.getElementById("doctor_name").innerText;
        $.ajax({
            url:"/scheduleController/showScheduleByDoctorName",
            data:{
                doctor_name:doctor_name
            },
            success:function (data) {
                alert("成功查询")
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
</script>
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

<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">

    <!-- 引入头部导航 -->
    <c:import url="nav/titlenav.jsp"></c:import>

    <!-- 引入左边导航 -->
    <c:import url="nav/leftnav.jsp"></c:import>


    <div class="layui-body">
        <!-- 内容主体区域 -->
        <fieldset class="layui-elem-field layui-field-title"
                  style="margin-top: 20px;">
            <legend>排班信息</legend>
        </fieldset>

        <!-- 模糊查询字段-->

        <!-- 查看一个科室的医生的排班信息 -->
        <!-- Start Doctor Calendar Area -->
        <section class="doctor-calendar-area section">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="section-title">
                            <h2>查看一个科室的医生的排班信息</h2>
                        </div>
                    </div>
                </div>
                <div  >
                    <form class="form" >
                        <div class="row">
                            <div class="col-lg-3 col-md-3 col-3">
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
                            <div class="col-lg-3 col-md-3 col-3">
                                <div class="form-group">
                                    <div class="button">
                                        <button type="button" onclick="getScheduleByDept();" class="btn" >查询</button>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-6">
                                <div class="form-group">
                                    <input type="text" name="doctor_name" placeholder="医生姓名" id="doctor_name">
                                </div>
                            </div>
                            <div class="col-lg-3 col-md-3 col-3">
                                <div class="form-group">
                                    <div class="button">
                                        <button type="button" onclick="getScheduleByDoctorName();" class="btn" >查找</button>
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


                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- End Doctor Calendar Area -->





    </div>


    <!-- 引入底部导航 -->
    <c:import url="nav/bottom.jsp"></c:import>
</div>



<script>
    //JavaScript代码区域
    layui.use('element', function () {
        var element = layui.element;

    });
    layui.use('carousel', function () {
        var carousel = layui.carousel;
        //建造实例
        carousel.render({
            elem: '#test1',
            width: '100%' //设置容器宽度
            ,
            arrow: 'always' //始终显示箭头
            //,anim: 'updown' //切换动画方式
        });
    });
    layer.open({
        type: 4,
        content: ['已下架', '#soldBook']
        //数组第二项即吸附元素选择器或者DOM
    });
</script>
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