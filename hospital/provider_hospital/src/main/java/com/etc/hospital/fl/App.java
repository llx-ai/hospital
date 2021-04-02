package com.etc.hospital.fl;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.netflix.eureka.EnableEurekaClient;


@SpringBootApplication
@EnableEurekaClient
@MapperScan("com.etc.hospital.fl.dao")
public class App {

    public static void main(String[] args) {
        SpringApplication.run(App.class);
    }
}
