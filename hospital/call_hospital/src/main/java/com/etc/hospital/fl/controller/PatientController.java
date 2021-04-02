package com.etc.hospital.fl.controller;

import com.etc.hospital.fl.dto.Patient_Order_Doctor;
import com.etc.hospital.fl.entity.Dept;
import com.etc.hospital.fl.entity.Patient;
import com.etc.hospital.fl.feigninterface.Call_PatientController;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.catalina.User;
import org.apache.commons.io.FilenameUtils;
import org.apache.http.HttpRequest;
import org.apache.http.HttpResponse;
import org.hibernate.validator.constraints.pl.REGON;
import org.springframework.context.annotation.Configuration;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.*;

import static java.lang.System.out;

@RestController
@RequestMapping("/PatientController")
public class PatientController {

    @Resource
    private Call_PatientController call;

    //患者登录
    @RequestMapping("/checkLogin")
    public void checkLogin(String patient_phone, String patient_pwd, HttpServletResponse response, HttpSession session, HttpServletRequest request) throws Exception {
        response.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
        Patient patient = new Patient();
        Integer patient_id = patient.getPatient_id();
        patient.setPatient_phone(patient_phone);
        patient.setPatient_pwd(patient_pwd);
        Patient loginpatient = call.checkLogin(patient);
        PrintWriter out = response.getWriter();

        System.out.println(patient_phone);
        System.out.println(patient_pwd);
        System.out.println(patient_pwd);
        if (loginpatient != null) {
            session.setAttribute("user", loginpatient);
            out.print("<script>alert('登录成功');location.href='../index.jsp';</script>");
        } else {
            out.print("<script>alert('该账号不存在请检查输入');history.go(-1);</script>");
        }
        out.flush();
        out.close();
    }

    /*@RequestMapping("/check")
    public */

    //验证手机号
    /*@RequestMapping("/checkPhone")
    public void checkPhone(HttpServletRequest request, String patient_name, Integer patient_sex, String patient_birth, MultipartFile patient_img, String patient_phone, String patient_pwd, HttpServletResponse response) throws Exception {
        response.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
        PrintWriter out = response.getWriter();
        System.out.println(patient_phone);
        Patient patient1 = call.queryPatientByPhone(patient_phone);
        if (patient1 == null) {
            System.out.println("进入return");
            Patient patient = new Patient();
            SimpleDateFormat ft = new SimpleDateFormat("yyyy-MM-dd");
            if (patient_birth != null && patient_birth.length() != 0) {
                Date patient_birth1 = ft.parse(patient_birth);
                patient.setPatient_birth(patient_birth1);

            } else {
                Date patient_birth1 = new Date();
            }
            if (patient_img != null) {

                String name = UUID.randomUUID().toString().replaceAll("-", "");
                String ext = FilenameUtils.getExtension(patient_img.getOriginalFilename());
                String url = request.getSession().getServletContext().getRealPath("/upload");
                patient_img.transferTo(new File(url + "/" + name + "." + ext));
                patient.setPatient_img("upload/" + name + "." + ext);
            }
            patient.setPatient_img(null);
            patient.setPatient_name(patient_name);
            patient.setPatient_pwd(patient_pwd);
            patient.setPatient_phone(patient_phone);
            patient.setPatient_sex(patient_sex);
            patient.setPatient_power(0);
            int registerPatient = call.register(patient);
            out.println(registerPatient);
            if (registerPatient != 0) {
                out.print("<script>location.href='../login.jsp';</script>");
            } else {
                out.print("<script>alert('注册失败');history.go(-1);</script>");
            }
        } else {
            out.print("<script>alert('手机号已被注册');history.go(-1);</script>");
        }
        out.flush();
        out.close();
    }
*/
    @RequestMapping("/register")
    public void register(String patient_name, String patient_phone, String patient_pwd, Integer patient_sex, String patient_birth, MultipartFile patient_img, HttpServletResponse response, HttpServletRequest request) throws Exception {
        out.println("进入register");
        out.println(patient_phone);
        PrintWriter out = response.getWriter();
        response.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
        response.setContentType("text/html");
        Patient patient1 = call.queryPatientByPhone(patient_phone);
        if (patient1 != null) {
            out.print("<script>alert('手机号已被注册');history.go(-1);</script>");
        } else {
            Patient patient = new Patient();
//            out.println(patient_name);
//            out.println(patient_phone);
//            out.println(patient_pwd);
//            out.println(patient_sex);
//            out.println(patient_birth);
//            out.println(patient_img);
            SimpleDateFormat ft = new SimpleDateFormat("yyyy-MM-dd");
            if (patient_birth != null && patient_birth.length() != 0) {
                Date patient_birth1 = ft.parse(patient_birth);
                patient.setPatient_birth(patient_birth1);

            } else {
                Date patient_birth1 = new Date();
            }
//        if (patient_phone == "") {
//            patient_phone = null;
//        }

            if (patient_img != null) {

                String name = UUID.randomUUID().toString().replaceAll("-", "");
                String ext = FilenameUtils.getExtension(patient_img.getOriginalFilename());
                String url = request.getSession().getServletContext().getRealPath("/upload");
                patient_img.transferTo(new File(url + "/" + name + "." + ext));
                patient.setPatient_img("upload/" + name + "." + ext);
            }
            patient.setPatient_name(patient_name);
            patient.setPatient_pwd(patient_pwd);
            patient.setPatient_phone(patient_phone);
            patient.setPatient_sex(patient_sex);
            patient.setPatient_power(0);
            int registerPatient = call.register(patient);
//            out.println(registerPatient);
            if (registerPatient != 0) {
                out.print("<script>alert('注册成功');location.href='../login.jsp';</script>");
            } else {
                out.print("<script>alert('注册失败');history.go(-1);</script>");
            }
        }
        out.flush();
        out.close();
    }

    @RequestMapping("/queryAllDept")
    public void queryAllDept(HttpSession session, HttpServletResponse response) throws Exception {
        response.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
        PrintWriter out = response.getWriter();
        List<Dept> deptList = call.queryAllDept();
        session.setAttribute("deptList", deptList);
        System.out.println(deptList);
        out.print("<script>location.href='../showDept.jsp';</script>");
        out.flush();
        out.close();
    }

    @RequestMapping("/queryAllPatient")
    public void queryAllPatient(HttpSession session, HttpServletResponse response) throws Exception {
        response.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
        PrintWriter out = response.getWriter();
        List<Dept> patientList = call.queryAllDept();
        session.setAttribute("patientList", patientList);
        System.out.println(patientList);
        out.print("<script>location.href='../managePatient.jsp';</script>");
        out.flush();
        out.close();
    }

    @RequestMapping("/changeInfo")
    public void changeInfo(Integer patient_id, String patient_name, String patient_phone, String patient_pwd, String patient_birth, Integer patient_sex, MultipartFile patient_img, HttpSession session, HttpServletResponse response, HttpServletRequest request) throws Exception {
        response.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
        Patient patient = new Patient();
        if (!patient_img.isEmpty()) {
            String name = UUID.randomUUID().toString().replaceAll("-", "");
            String ext = FilenameUtils.getExtension(patient_img.getOriginalFilename());
            String url = request.getSession().getServletContext().getRealPath("/upload");
            patient_img.transferTo(new File(url + "/" + name + "." + ext));
            patient.setPatient_img("upload/" + name + "." + ext);
        } else {
            patient.setPatient_img(null);
        }
        SimpleDateFormat ft = new SimpleDateFormat("yyyy-MM-dd");


        if (patient_birth != null && patient_birth.length() != 0) {
            Date patient_birth1 = ft.parse(patient_birth);
            patient.setPatient_birth(patient_birth1);
        } else {
            Date patient_birth1 = new Date();
        }
        patient.setPatient_id(patient_id);
        patient.setPatient_phone(patient_phone);
        patient.setPatient_pwd(patient_pwd);
        patient.setPatient_name(patient_name);
        patient.setPatient_sex(patient_sex);
//        patient.setUser_power(user_power);
        int changeInfo = call.changeInfo(patient);
        PrintWriter out = response.getWriter();
        if (changeInfo != 0) {
            Patient patient1 = call.queryPatientById(patient_id);
            session.setAttribute("user", patient1);
            out.print("<script>alert('修改成功');location.href='../patientInfo.jsp';</script>");
        } else {
            out.print("<script>alert('修改失败');history.go(-1);</script>");
        }
        out.flush();
        out.close();

    }


    @RequestMapping("/queryPatientByName")
    public void queryPatientByName(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception {
        response.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
        PrintWriter out = response.getWriter();
        String patient_name = request.getParameter("patient_name");
        Patient patient = new Patient();
        patient.setPatient_name(patient_name);
        System.out.println(patient_name);
        List<Patient> patientList = call.queryPatientByName(patient_name);
        session.setAttribute("patientList", patientList);
        out.print("<script>location.href='../patientIndex.jsp';</script>");
        out.flush();
        out.close();
    }


    @RequestMapping("/queryPatientByAge")
    public void queryPatientByAge(Integer IsOld, HttpServletResponse response, HttpSession session) throws Exception {
        response.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
        System.out.println(IsOld);
        PrintWriter out = response.getWriter();
        List<Patient_Order_Doctor> patientList = call.queryPatientByAge(IsOld);

        session.setAttribute("patientlist", patientList);
        out.print("<script>location.href='../managePatient.jsp';</script>");
        out.flush();
        out.close();
    }


    @RequestMapping("/queryPatientBySex")
    public void queryPatientBySex(Integer patient_sex, HttpServletResponse response, HttpSession session) throws Exception {
        response.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
        PrintWriter out = response.getWriter();
        Patient patient = new Patient();
        patient.setPatient_sex(patient_sex);
        System.out.println(patient_sex);
        List<Patient> patientList = call.queryPatientBySex(patient_sex);
        session.setAttribute("patientList", patientList);
        out.print("<script>location.href='../patientIndex.jsp';</script>");
        out.flush();
        out.close();
    }


    @RequestMapping("/selectpatientcondition")
    public void selectpatientcondition(HttpSession session, HttpServletResponse response, String patient_idcard,
                                       String patient_name, String patient_phone, Integer patient_id, Integer patient_sex
    ) throws Exception {
        response.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
        PrintWriter out = response.getWriter();
        Patient patient = new Patient();
        patient.setPatient_id(patient_id);
        patient.setPatient_name(patient_name);
        patient.setPatient_phone(patient_phone);
        patient.setPatient_idcard(patient_idcard);
        patient.setPatient_sex(patient_sex);


        List list = call.selectpatientcondition(patient);
        session.setAttribute("patientlist", list);

        //return  "managerSelectRank";
        out.print("<script>location.href='../managePatient.jsp';</script>");

    }
}
