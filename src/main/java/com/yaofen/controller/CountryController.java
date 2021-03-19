package com.yaofen.controller;

import com.google.gson.Gson;
import com.yaofen.bean.Country;
import com.yaofen.bean.LayuiData;
import com.yaofen.service.CountryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;


import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
@RequestMapping("/country")
public class CountryController {

    @Autowired
    CountryService countryService;

    @RequestMapping(value = "/getCountryStory", produces = "text/plain;charset=utf-8")
    @ResponseBody
    public String getCountryStory(HttpServletRequest request, HttpServletRequest resp){

        String page = request.getParameter("page");
        Integer limit = Integer.parseInt(request.getParameter("limit"));
        Integer page1 = Integer.parseInt(page);
        page1 = (page1 - 1) * limit;
        List<Country> list = countryService.getCountryStory(page1,limit);
        LayuiData layuiData = new LayuiData();
        layuiData.setMsg("");
        layuiData.setCode(0);
        layuiData.setCount(100);
        layuiData.setData(list);
        return new Gson().toJson(layuiData);
    }

    @RequestMapping(value = "/getCountryEat", produces = "text/plain;charset=utf-8")
    @ResponseBody
    public String getCountryEat(HttpServletRequest request, HttpServletRequest resp){

        String page = request.getParameter("page");
        Integer limit = Integer.parseInt(request.getParameter("limit"));
        Integer page1 = Integer.parseInt(page);
        page1 = (page1 - 1) * limit;
        List<Country> list = countryService.getCountryEat(page1,limit);
        LayuiData layuiData = new LayuiData();
        layuiData.setMsg("");
        layuiData.setCode(0);
        layuiData.setCount(100);
        layuiData.setData(list);
        return new Gson().toJson(layuiData);
    }

    @RequestMapping(value = "/getCountryView", produces = "text/plain;charset=utf-8")
    @ResponseBody
    public String getCountryView(HttpServletRequest request, HttpServletRequest resp){

        String page = request.getParameter("page");
        Integer limit = Integer.parseInt(request.getParameter("limit"));
        Integer page1 = Integer.parseInt(page);
        page1 = (page1 - 1) * limit;
        List<Country> list = countryService.getCountryView(page1,limit);
        LayuiData layuiData = new LayuiData();
        layuiData.setMsg("");
        layuiData.setCode(0);
        layuiData.setCount(100);
        layuiData.setData(list);
        return new Gson().toJson(layuiData);
    }
}
