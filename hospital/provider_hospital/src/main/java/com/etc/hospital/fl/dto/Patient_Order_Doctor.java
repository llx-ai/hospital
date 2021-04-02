package com.etc.hospital.fl.dto;

import java.util.Date;

public class Patient_Order_Doctor {
    private Integer patient_id;
    private String patient_name;
    private String patient_phone;
    private Integer patient_sex;
    private Date patient_birth;
    private Date patient_time;
    private Integer age;

    private Integer IsOld;

    public Date getPatient_time() {
        return patient_time;
    }

    public void setPatient_time(Date patient_time) {
        this.patient_time = patient_time;
    }

    public Integer getPatient_id() {
        return patient_id;
    }

    public void setPatient_id(Integer patient_id) {
        this.patient_id = patient_id;
    }

    public Integer getIsOld() {
        return IsOld;
    }

    public void setIsOld(Integer isOld) {
        IsOld = isOld;
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

    public Integer getAge() {
        return age;
    }

    public void setAge(Integer age) {
        this.age = age;
    }
}
