package com.etc.hospital.fl.controller;

import com.etc.hospital.fl.dto.DoctorCondition;
import com.etc.hospital.fl.dto.DoctorShow;
import com.etc.hospital.fl.entity.Doctor;
import com.etc.hospital.fl.entity.Schedule;
import com.etc.hospital.fl.feigninterface.Call_provider_doctorcontroller;
import com.etc.hospital.fl.feigninterface.Call_provider_schedulecontroller;
import org.apache.commons.io.FilenameUtils;
import org.apache.http.HttpResponse;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.UUID;

@Controller
@RequestMapping("/doctorController")
public class DoctorController {


    @Resource
    private Call_provider_doctorcontroller call;

    @Resource
    private Call_provider_schedulecontroller call2;

    //新增一个doctor信息
    @RequestMapping("/insertADoctor")
    public void insertADoctor(HttpSession session,String doctor_name, Integer doctor_dept, String doctor_phone,
                              Integer doctor_sex, Integer doctor_rank, HttpServletResponse response)throws Exception{
        response.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
        PrintWriter out = response.getWriter();

       if("0".equals(doctor_dept.toString())||"0".equals(doctor_rank.toString())){
           out.print("<script>alert('未选择职称或科室,添加医生信息失败！');history.go(-1);</script>");

        }
        else {
           Doctor doctor = new Doctor();
           doctor.setDoctor_name(doctor_name);
           doctor.setDoctor_dept(doctor_dept);
           doctor.setDoctor_phone(doctor_phone);
           doctor.setDoctor_sex(doctor_sex);
           doctor.setDoctor_rank(doctor_rank);
           boolean t = call.insertADoctor(doctor);
           if (t) {

               List<DoctorCondition> doctorList = call.selectAllDoctorByAdmin();
               session.setAttribute("doctorList", doctorList);

               out.print("<script>alert('成功添加该医生信息！');location.href='../managerDoctor.jsp';</script>");
           } else {
               out.print("<script>alert('该医生电话已存在,添加医生信息失败！');history.go(-1);</script>");

           }
       }
        out.flush();
        out.close();
    }


    //判断医生登录
    //doctor登录
    @RequestMapping("/checkDoctorLogin")
    public void checkDoctorLogin(String doctor_phone, String doctor_pwd,HttpSession session,HttpServletResponse response)throws Exception{

        //DoctorCondition condition=new DoctorCondition();

        response.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
        PrintWriter out = response.getWriter();
        DoctorCondition condition=call.checkDoctorLogin(doctor_phone,doctor_pwd);
        if(condition!=null){
            session.setAttribute("user",condition);
            session.setAttribute("doctor",condition);
            out.print("<script>alert('登录成功！');location.href='../doctorIndex.jsp';</script>");
        }else{
            out.print("<script>alert('密码和账号错误,登录失败！');history.go(-1);</script>");
        }

    }


    //管理员查询所有医生的信息
    @RequestMapping("/selectAllDoctorByAdmin")
    public void selectAllDoctorByAdmin(HttpSession session,HttpServletResponse response)throws Exception{
        response.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
        PrintWriter out = response.getWriter();

        List<DoctorCondition> doctorList= call.selectAllDoctorByAdmin();
        session.setAttribute("doctorList",doctorList);

        out.print("<script>location.href='../managerDoctor.jsp';</script>");

    }

    //管理员根据条件查询医生的信息
    @RequestMapping("/selectDoctorByCondition")
    public void selectDoctorByCondition(HttpSession session, HttpServletResponse response,String doctor_name,
                                                         String doctor_phone,Integer doctor_sex,
                                                         Integer doctor_dept,Integer doctor_rank)throws Exception{
        response.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
        PrintWriter out = response.getWriter();

        DoctorCondition condition=new DoctorCondition();
            if("0".equals(doctor_dept.toString())){
                doctor_dept=null;
            }if("0".equals(doctor_rank.toString())){
                doctor_rank=null;
            }
            if("2".equals(doctor_sex.toString())){
                doctor_sex=null;
            }
             condition.setDoctor_name(doctor_name);
            condition.setDoctor_phone(doctor_phone);
            condition.setDoctor_sex(doctor_sex);
            condition.setDoctor_dept(doctor_dept);
            condition.setDoctor_rank(doctor_rank);

        List<DoctorCondition> doctorList= call.selectDoctorByCondition(condition);
            session.setAttribute("doctorList",doctorList);
        out.print("<script>location.href='../managerDoctor.jsp';</script>");

    }


    //患者医生那边显示所有的doctor信息,无密码
    @RequestMapping("/selectAllDoctor")
    @ResponseBody
    public List<DoctorShow> selectAllDoctor(){
        return call.selectAllDoctor();
    }


    //医生修改个人的信息
    @RequestMapping("/updateDoctorInfo")
    public void updateDoctorInfo(HttpSession session, HttpServletResponse response, HttpServletRequest request, String doctor_name,
                               String phone,String pwd, Integer doctor_id, String doctor_pwd, Integer doctor_sex,
                                 MultipartFile doctor_img, String doctor_specialty, String doctor_resume)throws Exception{
        response.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
        PrintWriter out = response.getWriter();

        DoctorCondition condition=new DoctorCondition();

        if(doctor_img!=null) {
            if (!doctor_img.isEmpty()) {
                String name = UUID.randomUUID().toString().replaceAll("-", "");

                //获取文件的扩展名
                String ext = FilenameUtils.getExtension(doctor_img.getOriginalFilename());
                //设置图片上传路径
                String url = request.getSession().getServletContext().getRealPath("/upload");
                System.out.println(url);
                //以绝对路径保存重名命后的图片
                doctor_img.transferTo(new File(url + "/" + name + "." + ext));
                //把图片存储路径保存到数据库
                condition.setDoctor_img("upload/" + name + "." + ext);

            }
        }else{

            condition.setDoctor_img(null);
        }

        condition.setDoctor_id(doctor_id);
        condition.setDoctor_name(doctor_name);
//        condition.setDoctor_phone(doctor_phone);
        condition.setDoctor_sex(doctor_sex);
        condition.setDoctor_pwd(doctor_pwd);
        condition.setDoctor_specialty(doctor_specialty);

        //String doctor_resume1=request.getParameter("doctor_resume");
        condition.setDoctor_resume(doctor_resume);


        Boolean t = call.updateDoctorInfo(condition);
       // session.setAttribute("doctorList",doctorList);
        if (t) {
           if(doctor_pwd.length()>0){
               out.print("<script>alert('修改成功！');location.href='../login.jsp';</script>");
           }
           else{
               //condition.setDoctor_img("upload/" + name + "." + ext);
               //condition.setDoctor_name(doctor_name);
               //condition.setDoctor_sex(doctor_sex);
              // condition.setDoctor_specialty(doctor_specialty);
               //condition.setDoctor_resume(doctor_resume);
               DoctorCondition doctor=call.checkDoctorLogin(phone,pwd);
               session.setAttribute("user",doctor);
               session.setAttribute("doctor",doctor);
               out.print("<script>alert('修改成功！');location.href='../doctorInfo.jsp';</script>");
           }


        }else{
            out.print("<script>alert('修改失败！');history.go(-1);</script>");
        }

        out.flush();
        out.close();
    }


    //根据电话查询医生信息,看是否可以符合条件,修改的时候？
    @RequestMapping("/selectDoctorByPhone")
    @ResponseBody
    public String selectDoctorByPhone(String doctor_phone) {
        Integer t=call.selectDoctorByPhone(doctor_phone);
        if(t>0){
            return "find";
        }else{
            return "nofind";
        }
    }

    //通过id查询医生的信息显示在医生或患者页面
    @RequestMapping("/selectDoctorById")
    public void selectDoctorById(HttpSession session, HttpServletResponse response, HttpServletRequest request)throws Exception{
        response.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
        PrintWriter out = response.getWriter();
        String id=request.getParameter("doctor_id");

        Integer doctor_id=Integer.parseInt(id);
    //判断是跳转医生的还是患者的界面，0是医生，1是患者
        String check=request.getParameter("check");


        System.out.println("id"+doctor_id);

       DoctorShow show= call.selectDoctorById(doctor_id);
       session.setAttribute("show",show);
        if (show!=null) {
            //session.setAttribute("doctor");
            //查询医生的排班信息
            Schedule schedule = call2.showScheduleByDoctor(doctor_id);
            if(schedule!=null){
                System.out.println("查询成功");
                session.setAttribute("scheduleList",schedule);
            }
            if("1".equals(check)){
                out.print("<script>location.href='../showDoctorDetails.jsp';</script>");
            }
            else{
                out.print("<script>location.href='../showDoctorDetailsByDoctor.jsp';</script>");
            }
        }else{
            out.print("<script>alert('查询医生详情失败！');history.go(-1);</script>");
        }


        out.flush();
        out.close();

    }

    //通过部门id查询所有该部门下的医生信息显示在医生或患者页面
    @RequestMapping("/selectDoctorByDeptId")
    public void selectDoctorByDeptId(String check,Integer dept_id,HttpSession session,HttpServletResponse response)throws Exception{
        response.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
        PrintWriter out = response.getWriter();
        List<DoctorShow> doctorShowList= call.selectDoctorByDeptId(dept_id);
        session.setAttribute("doctorShowList",doctorShowList);

        if("1".equals(check)){//如果是患者
            out.print("<script>location.href='../showDoctorByCondition.jsp';</script>");
        }else {//如果是医生
            out.print("<script>location.href='../showDoctorByConditionByDoctor.jsp';</script>");
        }

    }


    //通过职称id查询该职称下的所有医生信息显示在医生或患者页面
    @RequestMapping("/selectDoctorByRankId")
    public void selectDoctorByRankId(String check,Integer rank_id,HttpSession session,HttpServletResponse response)throws Exception{
        response.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
        PrintWriter out = response.getWriter();
        List<DoctorShow> doctorShowList= call.selectDoctorByRankId(rank_id);
        session.setAttribute("doctorShowList",doctorShowList);
        if("1".equals(check)){//如果是患者
            out.print("<script>location.href='../showDoctorByCondition.jsp';</script>");
        }else {//如果是医生
            out.print("<script>location.href='../showDoctorByConditionByDoctor.jsp';</script>");
        }


    }


    @RequestMapping("/logOut")
    public void logOut(HttpSession session,HttpServletResponse response)throws Exception{
        response.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
        PrintWriter out = response.getWriter();
        session.setAttribute("doctor",null);
        session.setAttribute("user",null);
        session.setAttribute("admin",null);
        out.print("<script>location.href='../login.jsp';</script>");
    }




    //修改职称
    @RequestMapping("/updateDoctorByAdmin")
    public void updateDoctorByAdmin(HttpServletRequest request,Integer olddept,Integer oldrank,Integer doctor_id,Integer doctor_rank,Integer doctor_dept,HttpSession session,HttpServletResponse response)throws Exception{
        System.out.println(doctor_id);
        response.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
        PrintWriter out = response.getWriter();
        if("0".equals(doctor_rank.toString())){
            // String old= request.getParameter("oldRank_id");
            //rank_id=Integer.parseInt(old);
            doctor_rank=oldrank;
        }  if("0".equals(doctor_dept.toString())){

            doctor_dept=olddept;
        }

        if( call.updateDoctorRank(doctor_id,doctor_rank)&& call.updateDoctorDept(doctor_id,doctor_dept)){
            List<DoctorCondition> doctorList= call.selectAllDoctorByAdmin();
            session.setAttribute("doctorList",doctorList);
            out.print("<script>alert('成功修改医生信息！');location.href='../managerDoctor.jsp';</script>");
        }else{
            out.print("<script>alert('修改失败！');location.href='../managerDoctor.jsp';</script>");
        }
    }

//    //修改职称
//    @RequestMapping("/updateDoctorDept")
//    public void updateDoctorDept(HttpServletRequest request,Integer old,Integer doctor_id,Integer dept_id,HttpSession session,HttpServletResponse response)throws Exception{
//        response.setCharacterEncoding("utf-8");
//        response.setContentType("text/html;charset=utf-8");
//        PrintWriter out = response.getWriter();
//        if("0".equals(dept_id.toString())){
//
//            dept_id=old;
//        }
//        if( call.updateDoctorDept(doctor_id,dept_id)){
//            List<DoctorCondition> doctorList= call.selectAllDoctorByAdmin();
//            session.setAttribute("doctorList",doctorList);
//            out.print("<script>alert('成功修改部门！');location.href='../managerDoctor1.jsp';</script>");
//        }else{
//            out.print("<script>alert('修改部门失败！');location.href='../managerDoctor1.jsp';</script>");
//        }
//    }



}
