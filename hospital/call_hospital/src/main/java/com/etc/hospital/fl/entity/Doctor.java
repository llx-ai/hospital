package com.etc.hospital.fl.entity;

import java.util.Date;

public class Doctor {
    private Integer doctor_id;

    private String doctor_pwd;

    private String doctor_name;

    private Integer doctor_dept;

    private String doctor_phone;

    private Integer doctor_sex;

    private String doctor_img;

    private Date doctor_time;

    private String doctor_specialty;

    private Integer doctor_rank;

    private String doctor_resume;

    public void setDoctor_resume(String doctor_resume) {
        this.doctor_resume = doctor_resume;
    }

    public Integer getDoctor_id() {
        return doctor_id;
    }

    public void setDoctor_id(Integer doctor_id) {
        this.doctor_id = doctor_id;
    }

    public String getDoctor_pwd() {
        return doctor_pwd;
    }

    public void setDoctor_pwd(String doctor_pwd) {
        this.doctor_pwd = doctor_pwd;
    }

    public String getDoctor_name() {
        return doctor_name;
    }

    public void setDoctor_name(String doctor_name) {
        this.doctor_name = doctor_name;
    }

    public Integer getDoctor_dept() {
        return doctor_dept;
    }

    public void setDoctor_dept(Integer doctor_dept) {
        this.doctor_dept = doctor_dept;
    }

    public String getDoctor_phone() {
        return doctor_phone;
    }

    public void setDoctor_phone(String doctor_phone) {
        this.doctor_phone = doctor_phone;
    }

    public Integer getDoctor_sex() {
        return doctor_sex;
    }

    public void setDoctor_sex(Integer doctor_sex) {
        this.doctor_sex = doctor_sex;
    }

    public String getDoctor_img() {
        return doctor_img;
    }

    public void setDoctor_img(String doctor_img) {
        this.doctor_img = doctor_img;
    }

    public Date getDoctor_time() {
        return doctor_time;
    }

    public void setDoctor_time(Date doctor_time) {
        this.doctor_time = doctor_time;
    }

    public String getDoctor_specialty() {
        return doctor_specialty;
    }

    public void setDoctor_specialty(String doctor_specialty) {
        this.doctor_specialty = doctor_specialty;
    }

    public Integer getDoctor_rank() {
        return doctor_rank;
    }

    public void setDoctor_rank(Integer doctor_rank) {
        this.doctor_rank = doctor_rank;
    }


}