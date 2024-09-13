package com.example.devops001hello;


import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.time.LocalDateTime;

@RestController
@RequestMapping
public class DevOpsController {

    @GetMapping
    public String devopsHello(){
        return "Hello World " + LocalDateTime.now();
    }

    @GetMapping("/info")
    public String devopsInfo(){
        return "INFO " + LocalDateTime.now();
    }

}
