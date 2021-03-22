package com.yaofen.controller;

import com.yaofen.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/user")
public class UserController {

    @Autowired
    private AdminService adminService;

    @RequestMapping(value = "/updateUserInfo", produces = "text/plain;charset=utf-8")
    @ResponseBody
    public String updateUserInfo(HttpServletRequest request, HttpServletRequest resp){
        String id = request.getParameter("id");
        String email = request.getParameter("email");
        String tel = request.getParameter("tel");
        String account = request.getParameter("account");
        String sex = request.getParameter("sex");
        adminService.updateUserInfo(account,email,sex,tel,id);
        return "success";
    }

    @RequestMapping(value = "/addUser", produces = "text/plain;charset=utf-8")
    @ResponseBody
    public String addUser(HttpServletRequest request, HttpServletRequest resp){
        String account = request.getParameter("account");
        String tel = request.getParameter("tel");
        String sex = request.getParameter("sex");
        String email = request.getParameter("email");
        adminService.addUser(account,email,sex,tel);
        return "success";
    }

    @RequestMapping(value = "/delUser", produces = "text/plain;charset=utf-8")
    @ResponseBody
    public String delUser(HttpServletRequest request, HttpServletRequest resp){
        String id = request.getParameter("id");
        adminService.delUser(id);
        return "success";
    }
}
