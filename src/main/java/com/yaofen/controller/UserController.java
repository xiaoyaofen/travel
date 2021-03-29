package com.yaofen.controller;

import com.google.gson.Gson;
import com.yaofen.bean.Admin;
import com.yaofen.bean.LayuiData;
import com.yaofen.bean.User;
import com.yaofen.service.AdminService;
import com.yaofen.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;

@Controller
@RequestMapping("/user")
public class UserController {

    @Autowired
    private AdminService loginService;

    @Autowired
    private UserService userService;


    @RequestMapping(value = "/login", produces = "text/plain;charset=utf-8")
    @ResponseBody
    public Object adminlogin(HttpServletRequest request, HttpServletRequest resp) throws IOException {
        String coachPhone = request.getParameter("coachPhone");
        String coachPwd = request.getParameter("coachPwd");
        User user = userService.login(coachPhone,coachPwd);
        String msg = "";
        if (user != null && !"".equals(user)) {
            msg = "登陆成功";
            System.out.println("用户登陆成功！");
            request.getSession().setAttribute("userLogin", user);
        } else {
            msg = "登陆失败";
        }
        return msg;
    }


    @RequestMapping(value = "/addUser",produces = "text/plain;charset=utf-8")
    //用户注册方法
    @ResponseBody
    public Object addCoach(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String coachPhone = request.getParameter("coachPhone");
        String coachSex = request.getParameter("coachSex");
        String coachPwd = request.getParameter("coachPwd");
        String coachName = request.getParameter("coachName");
        //判断该手机号是否被注册过
        boolean flags = true;
        List<User> list = loginService.userList(0,100,null,null);
        for (int i = 0; i < list.size(); i++) {
            if (list.get(i).getTel().equals(coachPhone)){
                flags = false;
                break;
            }
        }
        String msg = "";
        if (flags){
            HashMap hashMap = new HashMap();
            hashMap.put("userPhone",coachPhone);
            hashMap.put("userSex",coachSex);
            hashMap.put("userName",coachName);
            hashMap.put("userPass",coachPwd);
            boolean flag = userService.addUser(hashMap);
            if (flag){
                msg = "成功";
            }else{
                msg = "添加失败";
            }
        }else{
            msg = "该手机号已经被注册过！";
        }
        return msg;
    }

//    @RequestMapping(value = "/adminMenu", produces = "text/plain;charset=utf-8")
//    public String adminMenu(HttpServletRequest request,HttpServletRequest resp){
//        String account = request.getParameter("account");
//        request.getSession().setAttribute("account", account);
//        return "AdminMenu";
//    }
//
//    @RequestMapping(value = "/adminList", produces = "text/plain;charset=utf-8")
//    @ResponseBody
//    public String adminList(HttpServletRequest request,HttpServletRequest resp){
//        String page = request.getParameter("page");
//        Integer limit = Integer.parseInt(request.getParameter("limit"));
//        Integer page1 = Integer.parseInt(page);
//        page1 = (page1 - 1) * limit;
//        List<User> list = adminService.userList(page1,limit);
//        LayuiData layuiData = new LayuiData();
//        layuiData.setMsg("");
//        layuiData.setCode(0);
//        layuiData.setCount(100);
//        layuiData.setData(list);
//        return new Gson().toJson(layuiData);
//    }


}
