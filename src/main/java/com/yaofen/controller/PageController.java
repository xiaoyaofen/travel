package com.yaofen.controller;

import com.google.gson.Gson;
import com.yaofen.bean.Country;
import com.yaofen.bean.LayuiData;
import com.yaofen.service.CountryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
@RequestMapping("/page")
public class PageController {

    @Autowired
    CountryService countryService;

    @RequestMapping(value = "/getViewList", produces = "text/plain;charset=utf-8")
    @ResponseBody
    public ModelAndView getViewList(HttpServletRequest request, HttpServletRequest resp){
        List<Country> list = countryService.getCountryView(0,100);
        ModelAndView modelAndView = new ModelAndView("page1");
        modelAndView.addObject("viewList",list);
        return modelAndView;
    }

    @RequestMapping(value = "/getCountryEat", produces = "text/plain;charset=utf-8")
    @ResponseBody
    public ModelAndView getCountryEat(HttpServletRequest request, HttpServletRequest resp){
        List<Country> list = countryService.getCountryEat(0,100);
        ModelAndView modelAndView = new ModelAndView("page1");
        modelAndView.addObject("viewList",list);
        return modelAndView;
    }

    @RequestMapping(value = "/getCountryStory", produces = "text/plain;charset=utf-8")
    @ResponseBody
    public ModelAndView getCountryStory(HttpServletRequest request, HttpServletRequest resp){
        List<Country> list = countryService.getCountryStory(0,100);
        ModelAndView modelAndView = new ModelAndView("page1");
        modelAndView.addObject("viewList",list);
        return modelAndView;
    }



}
