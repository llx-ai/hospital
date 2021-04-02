package com.etc.hospital.fl.entity;

import java.util.Date;

public class Order {
    private Integer order_id;

    private Integer order_patient;

    private Date order_time;

    private Integer order_state;

    private String order_comment;

    private Date order_date;

    private Integer order_doctor;

    public Integer getOrder_id() {
        return order_id;
    }

    public void setOrder_id(Integer order_id) {
        this.order_id = order_id;
    }

    public Integer getOrder_patient() {
        return order_patient;
    }

    public void setOrder_patient(Integer order_patient) {
        this.order_patient = order_patient;
    }

    public Date getOrder_time() {
        return order_time;
    }

    public void setOrder_time(Date order_time) {
        this.order_time = order_time;
    }

    public Integer getOrder_state() {
        return order_state;
    }

    public void setOrder_state(Integer order_state) {
        this.order_state = order_state;
    }

    public String getOrder_comment() {
        return order_comment;
    }

    public void setOrder_comment(String order_comment) {
        this.order_comment = order_comment;
    }

    public Date getOrder_date() {
        return order_date;
    }

    public void setOrder_date(Date order_date) {
        this.order_date = order_date;
    }

    public Integer getOrder_doctor() {
        return order_doctor;
    }

    public void setOrder_doctor(Integer order_doctor) {
        this.order_doctor = order_doctor;
    }
}