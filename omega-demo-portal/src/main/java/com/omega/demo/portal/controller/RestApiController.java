package com.omega.demo.portal.controller;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * Created by cuizheng on 2016/12/18.
 */

@RestController
public class RestApiController {

    @GetMapping("/rest/index")
    private String restIndex(){
        return "TestJust";
    }

    // 测试配置中心的某一项配置
    @Value("${configTestValue}")
    private String configTestValue;

    @RequestMapping("/configTestValue")
    public String configTestValue(){
        return this.configTestValue;
    }
}
