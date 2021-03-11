package com.yaofen.controller;

import com.google.gson.Gson;
import com.yaofen.bean.LayuiData;
import com.yaofen.bean.SystemLog;
import com.yaofen.servicelog.impl.LoginService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@Controller
@RequestMapping("/action")
public class ActionController {

    @Autowired
    private LoginService loginService;

    @RequestMapping(value = "/getAction", produces = "text/plain;charset=utf-8")
    @ResponseBody
    public Object getAction(HttpServletRequest request, HttpServletResponse response) throws IOException {
        List<SystemLog> list = loginService.getAction();
        LayuiData layuiData = new LayuiData();
        layuiData.setMsg("");
        layuiData.setCode(0);
        layuiData.setData(list);
        System.out.println("hello");
        return new Gson().toJson(layuiData);
    }

    @RequestMapping(value = "/delAction", produces = "text/plain;charset=utf-8")
    @ResponseBody
    public Object delAction(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String id = request.getParameter("id");
        Integer num = loginService.delAction(Integer.parseInt(id));
        if (num != null) {
            return "删除成功";
        } else {
            return "删除失败，请重试";
        }
    }
}
