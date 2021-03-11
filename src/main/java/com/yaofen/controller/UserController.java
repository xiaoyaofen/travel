package com.yaofen.controller;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.reflect.TypeToken;
import com.yaofen.bean.LayuiData;
import com.yaofen.bean.Member;
import com.yaofen.bean.Menu;
import com.yaofen.bean.User;
import com.yaofen.servicelog.impl.LoginService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
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
@RequestMapping("/user")
public class UserController {

    @Autowired
    private LoginService loginService;

    @RequestMapping(value = "/login", produces = "text/plain;charset=utf-8")
    @ResponseBody
    public Object login(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String num = request.getParameter("num");
        String account = request.getParameter("account");
        String pwd = request.getParameter("pwd");
        String code = request.getParameter("code");
        if (num.toUpperCase().equals(code.toUpperCase())) {
            User user = loginService.checkUser(account, pwd);
            if (user != null) {
                request.getSession().setAttribute("user", user);
                return "登录成功";
            } else {
                return "账号或密码错误";
            }
        } else {
            return "验证码错误";
        }
    }

    @RequestMapping(value = "/getMenu", produces = "text/plain;charset=utf-8")
    public ModelAndView getMenu(HttpServletRequest request, HttpServletResponse response) {
        User user = (User) request.getSession().getAttribute("user");
        Map<String, List<Menu>> map = loginService.findMenuByidMan(String.valueOf(user.getRoleid()));
        String role = loginService.findRoleByAccount(user.getName());
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("Map", map);
        modelAndView.addObject("account", user.getName());
        modelAndView.addObject("role", role);
        modelAndView.addObject("email", user.getEmail());
        modelAndView.setViewName("Menu");
        return modelAndView;
    }

    @RequestMapping(value = "/getManUser", produces = "text/plain;charset=utf-8")
    @ResponseBody
    public Object getManUser(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String param = request.getParameter("param");
        GsonBuilder gb = new GsonBuilder();
        Gson g = gb.create();
        Map<String, String> map = g.fromJson(param, new TypeToken<Map<String, String>>() {
        }.getType());
        String page = map.get("pageIndex");
        String limit = map.get("pageSize");
        Integer page1 = Integer.parseInt(page);
        page1 = (page1 - 1) * Integer.parseInt(limit);
        List<User> data = loginService.getManUser(page1, Integer.parseInt(limit));
        Integer count = loginService.getManUserCount();
        List list1 = new ArrayList();
        list1.add(data);
        list1.add(count);
        Gson gson = new Gson();
        return gson.toJson(list1);
    }

    @RequestMapping(value = "/checkUser", produces = "text/plain;charset=utf-8")
    @ResponseBody
    public Object checkUser(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String id = request.getParameter("id");
        Integer num = loginService.checkUser(id);
        Gson gson = new Gson();
        if (num != 0) {
            return "审核通过";
        } else {
            return "审核失败";
        }
    }

    @RequestMapping(value = "/register", produces = "text/plain;charset=utf-8")
    @ResponseBody
    public Object register(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String account = request.getParameter("account");
        String password = request.getParameter("password");
        String sex = request.getParameter("sex");
        String tel = request.getParameter("tel");
        String email = request.getParameter("email");
        User user = loginService.checkAccount(account);
        if (user != null) {
            return "该账号已经存在！";
        } else {
            User user1 = new User();
            user1.setName(account);
            user1.setPwd(password);
            user1.setSex(sex);
            user1.setTel(tel);
            user1.setEmail(email);
            user1.setPoint("0");
            user1.setRoleid("1");
            user1.setLevel(1);
            user1.setState("注册待审核");
            Integer num = loginService.addUser(user1);
            loginService.addScoreTab(String.valueOf(user1.getId()), "0", "注册", "50");
            if (num != null) {
                return "注册成功";
            } else {
                return "注册失败，请重试";
            }
        }
    }

    @RequestMapping(value = "/getUserLevel", produces = "text/plain;charset=utf-8")
    @ResponseBody
    public Object getUserLevel(HttpServletRequest request, HttpServletResponse response) throws IOException {
        List<Member> list = loginService.getUserLevel();
        LayuiData layuiData = new LayuiData();
        layuiData.setMsg("");
        layuiData.setCode(0);
        layuiData.setData(list);
        return new Gson().toJson(layuiData);
    }

    @RequestMapping(value = "/delUserLevel", produces = "text/plain;charset=utf-8")
    @ResponseBody
    public Object delUserLevel(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String id = request.getParameter("id");
        Integer num = loginService.delUserLevel(id);
        if (num != 0) {
            return "删除成功";
        } else {
            return "删除失败";
        }
    }

    @RequestMapping(value = "/addUserLevel", produces = "text/plain;charset=utf-8")
    @ResponseBody
    public Object addUserLevel(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String level = request.getParameter("level");
        String upload = request.getParameter("upload");
        String download = request.getParameter("download");
        Member membe = loginService.checkUserLevel(level);
        if (membe == null) {
            String value = loginService.findValueByLevel(level);
            Integer num = loginService.addUserLevel(Integer.parseInt(value), level, upload, download);
            if (num != 0) {
                return "添加成功";
            } else {
                return "添加失败";
            }
        } else {
            return "此等级已注册";
        }
    }

    @RequestMapping(value = "/fixLevel", produces = "text/plain;charset=utf-8")
    @ResponseBody
    public Object fixLevel(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String level = request.getParameter("level");
        String upload = request.getParameter("upload");
        String download = request.getParameter("download");
        String id = request.getParameter("id");
        Integer num = loginService.fixLevel(id, level, upload, download);
        if (num != 0) {
            return "修改成功";
        } else {
            return "修改失败";
        }
    }

    @RequestMapping(value = "/getMsg", produces = "text/plain;charset=utf-8")
    public ModelAndView getMsg(HttpServletRequest request, HttpServletResponse response) {
        User user = (User) request.getSession().getAttribute("user");
        String role = loginService.findRoleByAccount(user.getName());
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("account", user.getName());
        modelAndView.addObject("sex", user.getSex());
        modelAndView.addObject("tel", user.getTel());
        modelAndView.addObject("email", user.getEmail());
        modelAndView.addObject("role", role);
        modelAndView.addObject("point", user.getPoint());
        modelAndView.setViewName("Person");
        return modelAndView;
    }
}
