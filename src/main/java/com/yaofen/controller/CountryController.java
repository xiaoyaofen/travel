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
        String name = request.getParameter("name");
        String img = request.getParameter("img");
        String page = request.getParameter("page");
        Integer limit = Integer.parseInt(request.getParameter("limit"));
        Integer page1 = Integer.parseInt(page);
        page1 = (page1 - 1) * limit;
        List<Country> list = countryService.getCountryStory(name,img,page1,limit);
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
        String name = request.getParameter("name");
        String img = request.getParameter("img");
        String page = request.getParameter("page");
        Integer limit = Integer.parseInt(request.getParameter("limit"));
        Integer page1 = Integer.parseInt(page);
        page1 = (page1 - 1) * limit;
        List<Country> list = countryService.getCountryEat(name,img,page1,limit);
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
        String name = request.getParameter("name");
        String img = request.getParameter("img");
        String page = request.getParameter("page");
        Integer limit = Integer.parseInt(request.getParameter("limit"));
        Integer page1 = Integer.parseInt(page);
        page1 = (page1 - 1) * limit;
        List<Country> list = countryService.getCountryView(name,img,page1,limit);
        LayuiData layuiData = new LayuiData();
        layuiData.setMsg("");
        layuiData.setCode(0);
        layuiData.setCount(100);
        layuiData.setData(list);
        return new Gson().toJson(layuiData);
    }

    @RequestMapping(value = "/findCountryName", produces = "text/plain;charset=utf-8")
    @ResponseBody
    public String findCountryName(HttpServletRequest request, HttpServletRequest resp){
         List<Country> list = countryService.findCountryName();
         return new Gson().toJson(list);
    }

    @RequestMapping(value = "/updateCountryView", produces = "text/plain;charset=utf-8")
    @ResponseBody
    public String updateCountryView(HttpServletRequest request, HttpServletRequest resp){
        String id = request.getParameter("id");
        String name = request.getParameter("name");
        String img = request.getParameter("img");
        String time = request.getParameter("time");
        String country = request.getParameter("country");
        String countryid = countryService.findCountryIdByName(country);
        countryService.updateCountryView(name,img,time,countryid,id);
        return "success";
    }

    @RequestMapping(value = "/addCountryView", produces = "text/plain;charset=utf-8")
    @ResponseBody
    public String addCountryView(HttpServletRequest request, HttpServletRequest resp){
        String name = request.getParameter("name");
        String img = request.getParameter("img");
        String time = request.getParameter("time");
        String country = request.getParameter("country");
        String countryid = countryService.findCountryIdByName(country);
        countryService.addCountryView(name,img,time,countryid);
        return "success";
    }

    @RequestMapping(value = "/delCountry", produces = "text/plain;charset=utf-8")
    @ResponseBody
    public String delCountry(HttpServletRequest request, HttpServletRequest resp){
        String id = request.getParameter("id");
        countryService.delCountry(id);
        return "success";
    }

    @RequestMapping(value = "/updateCountryStory", produces = "text/plain;charset=utf-8")
    @ResponseBody
    public String updateCountryStory(HttpServletRequest request, HttpServletRequest resp){
        String id = request.getParameter("id");
        String img = request.getParameter("img");
        String time = request.getParameter("time");
        String story = request.getParameter("story");
        String name = request.getParameter("name");
        countryService.updateCountryStory(name,img,time,story,id);
        return "success";
    }

    @RequestMapping(value = "/addCountryStory", produces = "text/plain;charset=utf-8")
    @ResponseBody
    public String addCountryStory(HttpServletRequest request, HttpServletRequest resp){
        String name = request.getParameter("name");
        String img = request.getParameter("img");
        String time = request.getParameter("time");
        String story = request.getParameter("story");
        countryService.addCountryStory(name,img,time,story);
        return "success";
    }

    @RequestMapping(value = "/delCountryStory", produces = "text/plain;charset=utf-8")
    @ResponseBody
    public String delCountryStory(HttpServletRequest request, HttpServletRequest resp){
        String id = request.getParameter("id");
        countryService.delCountryStory(id);
        return "success";
    }

    @RequestMapping(value = "/updateCountryEat", produces = "text/plain;charset=utf-8")
    @ResponseBody
    public String updateCountryEat(HttpServletRequest request, HttpServletRequest resp){
        String id = request.getParameter("id");
        String name = request.getParameter("name");
        String img = request.getParameter("img");
        String detail = request.getParameter("detail");
        String country = request.getParameter("country");
        String countryid = countryService.findCountryIdByName(country);
        countryService.updateCountryEat(name,img,detail,countryid,id);
        return "success";
    }

    @RequestMapping(value = "/addCountryEat", produces = "text/plain;charset=utf-8")
    @ResponseBody
    public String addCountryEat(HttpServletRequest request, HttpServletRequest resp){
        String name = request.getParameter("name");
        String img = request.getParameter("img");
        String detail = request.getParameter("detail");
        String country = request.getParameter("country");
        String countryid = countryService.findCountryIdByName(country);
        countryService.addCountryEat(name,img,detail,countryid);
        return "success";
    }

    @RequestMapping(value = "/delCountryEat", produces = "text/plain;charset=utf-8")
    @ResponseBody
    public String delCountryEat(HttpServletRequest request, HttpServletRequest resp){
        String id = request.getParameter("id");
        countryService.delCountryEat(id);
        return "success";
    }

    @RequestMapping(value = "/getCountryNew", produces = "text/plain;charset=utf-8")
    @ResponseBody
    public String getCountryNew(HttpServletRequest request, HttpServletRequest resp){
        String name = request.getParameter("name");
        String img = request.getParameter("img");
        String page = request.getParameter("page");
        Integer limit = Integer.parseInt(request.getParameter("limit"));
        Integer page1 = Integer.parseInt(page);
        page1 = (page1 - 1) * limit;
        List<Country> list = countryService.getCountryNew(name,img,page1,limit);
        LayuiData layuiData = new LayuiData();
        layuiData.setMsg("");
        layuiData.setCode(0);
        layuiData.setCount(100);
        layuiData.setData(list);
        return new Gson().toJson(layuiData);
    }

    @RequestMapping(value = "/updateCountryNew", produces = "text/plain;charset=utf-8")
    @ResponseBody
    public String updateCountryNew(HttpServletRequest request, HttpServletRequest resp){
        String id = request.getParameter("id");
        String name = request.getParameter("name");
        String img = request.getParameter("img");
        String time = request.getParameter("time");
        String country = request.getParameter("country");
        String countryid = countryService.findCountryIdByName(country);
        countryService.updateCountryNew(name,img,time,countryid,id);
        return "success";
    }

    @RequestMapping(value = "/addCountryNew", produces = "text/plain;charset=utf-8")
    @ResponseBody
    public String addCountryNew(HttpServletRequest request, HttpServletRequest resp){
        String name = request.getParameter("name");
        String img = request.getParameter("img");
        String time = request.getParameter("time");
        String country = request.getParameter("country");
        String countryid = countryService.findCountryIdByName(country);
        countryService.addCountryNew(name,img,time,countryid);
        return "success";
    }

    @RequestMapping(value = "/delCountryNew", produces = "text/plain;charset=utf-8")
    @ResponseBody
    public String delCountryNew(HttpServletRequest request, HttpServletRequest resp){
        String id = request.getParameter("id");
        countryService.delCountryNew(id);
        return "success";
    }
}
