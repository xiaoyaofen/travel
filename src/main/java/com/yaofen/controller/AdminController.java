package com.yaofen.controller;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import com.yaofen.bean.*;
import com.yaofen.servicelog.impl.LoginService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/admin")
public class AdminController {

    @Autowired
    private LoginService loginService;

    @RequestMapping(value = "/login/{account}/{pwd}", produces = "text/plain;charset=utf-8")
    @ResponseBody
    public Object managelogin(@PathVariable(value = "account") String account, @PathVariable(value = "pwd") String pwd, HttpServletRequest request) throws IOException {
        Admin admin = loginService.checkAdmin(account, pwd);
        Gson gson = new Gson();
        if (admin != null) {
            request.getSession().setAttribute("admin", admin);
            return "登录成功";
        } else {
            return "账号或密码错误";
        }
    }

    @RequestMapping(value = "/mangerMenu", produces = "text/plain;charset=utf-8")
    public ModelAndView mangerMenu(HttpServletRequest request, HttpServletResponse response) {
        Admin admin = (Admin) request.getSession().getAttribute("admin");
        Map<String, List<Menu>> map = loginService.findMenuByidMan(String.valueOf(admin.getRoleid()));
        Params params = loginService.findNamebyValue("worker", String.valueOf(admin.getRoleid()));
        request.setAttribute("role", params.getName());
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("Map", map);
        modelAndView.addObject("account", admin.getAccount());
        modelAndView.setViewName("MangerMenu");
        return modelAndView;
    }

    @RequestMapping(value = "/getManMsg", produces = "text/plain;charset=utf-8")
    @ResponseBody
    public Object getManMsg(HttpServletRequest request, HttpServletResponse response) throws IOException {

        String page = request.getParameter("page");
        Integer limit = Integer.parseInt(request.getParameter("limit"));
        Integer page1 = Integer.parseInt(page);
        String time1 = request.getParameter("key[start]");
        String time2 = request.getParameter("key[end]");
        String account = request.getParameter("key[manage]");
        page1 = (page1 - 1) * limit;
        List<Admin> list = loginService.findAdmin(time1, time2, account, page1, limit);
        Integer count = loginService.findCount(time1, time2, account);
        LayuiData layuiData = new LayuiData();
        layuiData.setMsg("");
        layuiData.setCode(0);
        layuiData.setCount(count);
        layuiData.setData(list);
        return new Gson().toJson(layuiData);
    }

    @RequestMapping(value = "/delAdmin", produces = "text/plain;charset=utf-8")
    @ResponseBody
    public Object delAdmin(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String account = request.getParameter("account");
        Integer num = loginService.delAdmin(account);
        if (num != null) {
            return "删除成功";
        } else {
            return "删除失败，请重试";
        }
    }

    @RequestMapping(value = "/addAdmin", produces = "text/plain;charset=utf-8")
    @ResponseBody
    public Object addAdmin(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String account = request.getParameter("account");
        String password = request.getParameter("password");
        String juese = request.getParameter("juese");
        Admin admin = loginService.checkAdmin(account);
        if (admin != null) {
            return "该账号已存在";
        } else {
            Admin admin1 = new Admin();
            admin1.setAccount(account);
            admin1.setPwd(password);
            admin1.setRoleid(Integer.parseInt(juese));
            Integer num = loginService.addAdmin(admin1);
            if (num != 0) {
                return "注册成功";
            } else {
                return "注册失败，请重试";
            }
        }

    }

    @RequestMapping(value = "/fixAdmin", produces = "text/plain;charset=utf-8")
    @ResponseBody
    public Object fixAdmin(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String newname = request.getParameter("newname");
        String newlevel = request.getParameter("newlevel");
        String hidename = request.getParameter("hidename");
        Admin admin = loginService.checkAdmin(newname);
        if (admin != null) {
            return "该账号已经存在，请修改";
        } else {
            Integer num = loginService.fixAdmin(newname, newlevel, hidename);
            if (num != null) {
                return "修改成功";
            } else {
                return "修改失败，请重试";
            }
        }
    }

    @RequestMapping(value = "/getQuan", produces = "text/plain;charset=utf-8")
    @ResponseBody
    public Object getQuan(HttpServletRequest request, HttpServletResponse response) {
        List<Params> list = loginService.getQuan();
        LayuiData layuiData = new LayuiData();
        layuiData.setMsg("");
        layuiData.setCode(0);
        layuiData.setCount(10);
        layuiData.setData(list);
        return new Gson().toJson(layuiData);
    }


    @ResponseBody
    public Object getQuanxian(HttpServletRequest request, HttpServletResponse response) {
        String roleid = request.getParameter("roleid");
        System.out.println(roleid + "角色===");
        TreeNode rootTreeNode = loginService.findAllMenu(roleid);
        return new Gson().toJson(rootTreeNode);
    }

    @RequestMapping(value = "/fixQuanxian", produces = "text/plain;charset=utf-8")
    @ResponseBody
    public Object fixQuanxian(HttpServletRequest request, HttpServletResponse response) {
        String permList = request.getParameter("permList");
        String roleid = request.getParameter("roleid");
        Gson gson = new Gson();
        List<String> list = gson.fromJson(permList, new TypeToken<ArrayList<String>>() {
        }.getType());
        Integer num = loginService.deleteAllMenuByid(roleid);
        if (num != 0) {
            for (int i = 0; i < list.size(); i++) {
                loginService.addMenuByid(list.get(i), roleid);
            }
            return "权限修改成功";
        }
        return "修改失败，请重试";
    }
}
