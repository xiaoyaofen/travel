package com.yaofen.controller;

import com.yaofen.bean.*;
import com.yaofen.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;

@Controller
@RequestMapping("/admin")
public class AdminController {

    @Autowired
    private AdminService loginService;

    @RequestMapping(value = "/login", produces = "text/plain;charset=utf-8")
    @ResponseBody
    public String adminlogin( HttpServletRequest request,HttpServletRequest resp) throws IOException {
        String num = request.getParameter("num");
        String account = request.getParameter("account");
        String pwd = request.getParameter("pwd");
        String code = request.getParameter("code");
        if (num.toUpperCase().equals(code.toUpperCase())) {
            Admin admin = loginService.login(account, pwd);
            if (admin != null) {
                request.getSession().setAttribute("admin", admin);
                return "登录成功";
            } else {
                return "账号或密码错误";
            }
        } else {
            return "验证码错误";
        }
    }

    @RequestMapping(value = "/adminMenu", produces = "text/plain;charset=utf-8")
    public String adminMenu(HttpServletRequest request,HttpServletRequest resp){
        String account = request.getParameter("account");
        request.getSession().setAttribute("account", account);
        return "AdminMenu";

    }

}
