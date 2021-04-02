package com.etc.hospital.fl.entity;

import java.util.Date;

public class Patient {
    private Integer patient_id;

    private String patient_name;

    private String patient_phone;

    private String patient_pwd;

    private Integer patient_sex;

    private Date patient_birth;

    private String patient_idcard;

    private Integer patient_power;

    private String patient_img;

    private Date patient_time;

    public Integer getPatient_id() {
        return patient_id;
    }

    public void setPatient_id(Integer patient_id) {
        this.patient_id = patient_id;
    }

    public String getPatient_name() {
        return patient_name;
    }

    public void setPatient_name(String patient_name) {
        this.patient_name = patient_name;
    }

    public String getPatient_phone() {
        return patient_phone;
    }

    public void setPatient_phone(String patient_phone) {
        this.patient_phone = patient_phone;
    }

    public String getPatient_pwd() {
        return patient_pwd;
    }

    public void setPatient_pwd(String patient_pwd) {
        this.patient_pwd = patient_pwd;
    }

    public Integer getPatient_sex() {
        return patient_sex;
    }

    public void setPatient_sex(Integer patient_sex) {
        this.patient_sex = patient_sex;
    }

    public Date getPatient_birth() {
        return patient_birth;
    }

    public void setPatient_birth(Date patient_birth) {
        this.patient_birth = patient_birth;
    }

    public String getPatient_idcard() {
        return patient_idcard;
    }

    public void setPatient_idcard(String patient_idcard) {
        this.patient_idcard = patient_idcard;
    }

    public Integer getPatient_power() {
        return patient_power;
    }

    public void setPatient_power(Integer patient_power) {
        this.patient_power = patient_power;
    }

    public String getPatient_img() {
        return patient_img;
    }

    public void setPatient_img(String patient_img) {
        this.patient_img = patient_img;
    }

    public Date getPatient_time() {
        return patient_time;
    }

    public void setPatient_time(Date patient_time) {
        this.patient_time = patient_time;
    }
}