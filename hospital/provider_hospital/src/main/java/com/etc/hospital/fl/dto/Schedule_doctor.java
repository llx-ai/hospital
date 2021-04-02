package com.etc.hospital.fl.dto;

import org.springframework.stereotype.Component;

@Component
public class Schedule_doctor {
    private Integer schedule_number;
    private Integer doctor_id;
    private String doctor_name;
    private String doctor_img;
    private String doctor_specialty;
    private String doctor_rank;
    private String doctor_dept;
    private Integer schedule_mon;

    private Integer schedule_tue;

    private Integer schedule_wed;

    private Integer schedule_thu;

    private Integer schedule_fri;

    private Integer schedule_sat;

    private Integer schedule_sun;

    public Integer getSchedule_mon() {
        return schedule_mon;
    }

    public void setSchedule_mon(Integer schedule_mon) {
        this.schedule_mon = schedule_mon;
    }

    public Integer getSchedule_tue() {
        return schedule_tue;
    }

    public void setSchedule_tue(Integer schedule_tue) {
        this.schedule_tue = schedule_tue;
    }

    public Integer getSchedule_wed() {
        return schedule_wed;
    }

    public void setSchedule_wed(Integer schedule_wed) {
        this.schedule_wed = schedule_wed;
    }

    public Integer getSchedule_thu() {
        return schedule_thu;
    }

    public void setSchedule_thu(Integer schedule_thu) {
        this.schedule_thu = schedule_thu;
    }

    public Integer getSchedule_fri() {
        return schedule_fri;
    }

    public void setSchedule_fri(Integer schedule_fri) {
        this.schedule_fri = schedule_fri;
    }

    public Integer getSchedule_sat() {
        return schedule_sat;
    }

    public void setSchedule_sat(Integer schedule_sat) {
        this.schedule_sat = schedule_sat;
    }

    public Integer getSchedule_sun() {
        return schedule_sun;
    }

    public void setSchedule_sun(Integer schedule_sun) {
        this.schedule_sun = schedule_sun;
    }

    public Integer getSchedule_number() {
        return schedule_number;
    }

    public void setSchedule_number(Integer schedule_number) {
        this.schedule_number = schedule_number;
    }

    public Integer getDoctor_id() {
        return doctor_id;
    }

    public void setDoctor_id(Integer doctor_id) {
        this.doctor_id = doctor_id;
    }

    public String getDoctor_name() {
        return doctor_name;
    }

    public void setDoctor_name(String doctor_name) {
        this.doctor_name = doctor_name;
    }

    public String getDoctor_img() {
        return doctor_img;
    }

    public void setDoctor_img(String doctor_img) {
        this.doctor_img = doctor_img;
    }

    public String getDoctor_specialty() {
        return doctor_specialty;
    }

    public void setDoctor_specialty(String doctor_specialty) {
        this.doctor_specialty = doctor_specialty;
    }

    public String getDoctor_rank() {
        return doctor_rank;
    }

    public void setDoctor_rank(String doctor_rank) {
        this.doctor_rank = doctor_rank;
    }

    public String getDoctor_dept() {
        return doctor_dept;
    }

    public void setDoctor_dept(String doctor_dept) {
        this.doctor_dept = doctor_dept;
    }
}
