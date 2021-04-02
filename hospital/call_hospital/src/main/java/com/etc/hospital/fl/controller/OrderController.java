package com.etc.hospital.fl.controller;

import com.etc.hospital.fl.dto.DoctorCondition;
import com.etc.hospital.fl.dto.OrderShow;
import com.etc.hospital.fl.entity.Doctor;
import com.etc.hospital.fl.entity.Order;
import com.etc.hospital.fl.entity.Patient;
import com.etc.hospital.fl.entity.State;
import com.etc.hospital.fl.feigninterface.Call_provider_ordercontroller;
import com.etc.hospital.fl.feigninterface.Call_provider_statecontroller;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;


import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import static java.lang.System.out;

@Controller
@RequestMapping("/ordercontroller")

public class OrderController {
    @Resource
    private Call_provider_ordercontroller biz;

    @RequestMapping("/selectallorder")
    public void selectallstate(HttpSession session, HttpServletResponse response) throws IOException {
        PrintWriter out = response.getWriter();

        List list = biz.selectallorder();
        session.setAttribute("orderlist", list);

        //return  "managerSelectRank";
        out.print("<script>location.href='../manageOrder.jsp';</script>");
        out.flush();
        out.close();


    }
    @RequestMapping("/selectorderbycondition")
    public  void selectorderbycondition(HttpSession session, HttpServletResponse response,String doctor_name,
                                        String patient_name,String order_date,String order_time,Integer order_state
                                        )throws Exception{
        response.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
        PrintWriter out = response.getWriter();
        OrderShow orderShow = new OrderShow();
        SimpleDateFormat ft = new SimpleDateFormat("yyyy-MM-dd");
        if (order_date != null && order_date.length() != 0) {
        Date order_date1 = ft.parse(order_date);
            orderShow.setOrder_date(order_date1);}
        if (order_time != null && order_time.length() != 0) {
        Date order_time1 = ft.parse(order_time);
            orderShow.setOrder_time(order_time1);}
        DoctorCondition condition=new DoctorCondition();
        /*if("0".equals(doctor_rank.toString())){
            doctor_rank=null;
        }
        if("2".equals(doctor_sex.toString())){
            doctor_sex=null;
        }*/
        orderShow.setDoctor_name(doctor_name);
        orderShow.setPatient_name(patient_name);

        orderShow.setOrder_state(order_state);

        List list = biz.selectorderbycondition(orderShow);
        session.setAttribute("orderlist", list);

        //return  "managerSelectRank";
        out.print("<script>location.href='../manageOrder.jsp';</script>");

    }

    @RequestMapping("/addorder")
    public ModelAndView addorder(String order_comment, HttpSession session, Integer order_doctor, String order_date, HttpServletResponse response) throws Exception {
        response.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
        PrintWriter out = response.getWriter();

        Patient patient=(Patient) session.getAttribute("user");
        if(patient==null){
            out.print("<script>alert('请前往登录');location.href='../login.jsp';</script>");
        }
        else {
            Integer order_patient = patient.getPatient_id();

            System.out.println("时间："+order_date);
            SimpleDateFormat ft = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            Date order_date1 = ft.parse(order_date);
            Order order = new Order();
            order.setOrder_patient(order_patient);
            order.setOrder_comment(order_comment);

            order.setOrder_date(order_date1);
            order.setOrder_doctor(order_doctor);
            order.setOrder_state(100);
            int rs = biz.addorder(order);
            System.out.println(rs);
            if (rs == 1) {
                System.out.println("cg");
                //return  "managerSelectRank";
                out.print("<script>alert('预约成功')</script>");
                return new ModelAndView("redirect:/ordercontroller/selectbypatient");
            } else {
                System.out.println("失败");
                out.print("<script>alert('预约失败')</script>");
            }
        }
        out.flush();
        out.close();
        return null;



    }

    @RequestMapping("/selectorderbyid")
    public void selectorderbyid(Integer order_id, HttpSession session, HttpServletResponse response) throws IOException {
        response.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
        PrintWriter out = response.getWriter();
        Order order = biz.selectorderbyid(order_id);
        session.setAttribute("order", order);
        //return  "managerSelectRank";
        out.print("<script>location.href='../manageOrder.jsp';</script>");
        out.flush();
        out.close();
    }

    @RequestMapping("/updateorder")
    public ModelAndView updateorder(HttpServletResponse response, HttpServletRequest request) throws IOException {
        response.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
       /* PrintWriter out = response.getWriter();*/
        Order order = new Order();
        Integer order_id = Integer.parseInt(request.getParameter("order_id"));
        Integer order_state = Integer.parseInt(request.getParameter("order_state"));
        order.setOrder_id(order_id);
        order.setOrder_state(order_state);
        int rs = biz.updateorder(order);
        System.out.println(rs);
        if (rs == 1) {
          /*  out.print("<script>alert('修改成功')</script>");*/

        } else {
            System.out.println("失败");
         /*   out.print("<script>alert('失败')</script>");*/
        }

        return new ModelAndView("redirect:/ordercontroller/selectbydoctor");

    }
    @RequestMapping("/updateorder2")
    public ModelAndView updateorder2(HttpServletResponse response, HttpServletRequest request) throws IOException {
        response.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
        /* PrintWriter out = response.getWriter();*/
        Order order = new Order();
        Integer order_id = Integer.parseInt(request.getParameter("order_id"));
        Integer order_state = Integer.parseInt(request.getParameter("order_state"));
        order.setOrder_id(order_id);
        order.setOrder_state(order_state);
        int rs = biz.updateorder(order);
        System.out.println(rs);
        if (rs == 1) {
            /*  out.print("<script>alert('修改成功')</script>");*/

        } else {
            System.out.println("失败");
            /*   out.print("<script>alert('失败')</script>");*/
        }

        return new ModelAndView("redirect:/ordercontroller/selectbypatient");

    }
    @RequestMapping("/selectbydoctor")
    public void selectbydoctor(HttpSession session,HttpServletResponse response, HttpServletRequest request) throws IOException {
        PrintWriter out = response.getWriter();
        DoctorCondition doctor = (DoctorCondition)session.getAttribute("user");
        Integer order_doctor = doctor.getDoctor_id();
        OrderShow order = new OrderShow();
        order.setOrder_doctor(order_doctor);
        List list = biz.selectorderbycondition(order);
        session.setAttribute("orderlist", list);

        out.print("<script>location.href='../myrecipientappointment.jsp';</script>");
        out.flush();
        out.close();
    }
    @RequestMapping("/selectbypatient")
    public void selectbypatient(HttpSession session,HttpServletResponse response, HttpServletRequest request) throws IOException {
        PrintWriter out = response.getWriter();
        Patient patient = (Patient)session.getAttribute("user");
        Integer order_patient=patient.getPatient_id();
        OrderShow order = new OrderShow();
        order.setOrder_patient(order_patient);
        List list = biz.selectorderbycondition(order);
        session.setAttribute("orderlist", list);
        out.print("<script>location.href='../myappointment.jsp';</script>");
        out.flush();
        out.close();
    }
    @ResponseBody
    @RequestMapping("/selectordersum")
    public Integer selectordersum(String order_date,Integer order_doctor, HttpSession session, HttpServletResponse response) throws Exception {
        SimpleDateFormat ft = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        System.out.println("预约医生："+order_doctor);
        System.out.println("预约时间："+order_date);
        Date order_date1 = ft.parse(order_date);
        out.println(order_date1);
        Integer rs = biz.selectordersum(order_date, order_doctor);
        System.out.println("预约人数："+rs);
        return rs;
    }


}


