package com.yaofen.controller;

import com.yaofen.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/action")
public class ActionController {

    @Autowired
    private AdminService loginService;




}
