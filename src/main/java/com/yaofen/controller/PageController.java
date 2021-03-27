package com.yaofen.controller;

import com.google.gson.Gson;
import com.yaofen.bean.Country;
import com.yaofen.bean.LayuiData;
import com.yaofen.bean.User;
import com.yaofen.service.CountryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/page")
public class PageController {

    @Autowired
    CountryService countryService;

    @RequestMapping(value = "/getViewList", produces = "text/plain;charset=utf-8")
    @ResponseBody
    public ModelAndView getViewList(HttpServletRequest request, HttpServletRequest resp){
        String name = request.getParameter("name");
        String img = request.getParameter("img");
        List<Country> list = countryService.getResourceList( "1");
        ModelAndView modelAndView = new ModelAndView("page1");
        modelAndView.addObject("viewList",list);
        return modelAndView;
    }

    @RequestMapping(value = "/getCountryEat", produces = "text/plain;charset=utf-8")
    @ResponseBody
    public ModelAndView getCountryEat(HttpServletRequest request, HttpServletRequest resp){
        String name = request.getParameter("name");
        String img = request.getParameter("img");
        List<Country> list = countryService.getResourceList( "2" );
        ModelAndView modelAndView = new ModelAndView("page2");
        modelAndView.addObject("eatList",list);
        return modelAndView;
    }

    @RequestMapping(value = "/getCountryStory", produces = "text/plain;charset=utf-8")
    @ResponseBody
    public ModelAndView getCountryStory(HttpServletRequest request, HttpServletRequest resp){
        String name = request.getParameter("name");
        String img = request.getParameter("img");
        List<Country> list = countryService.getResourceList( "3" );
        ModelAndView modelAndView = new ModelAndView("page3");
        modelAndView.addObject("StoryList",list);
        return modelAndView;
    }

    @RequestMapping(value = "/getCountryNew", produces = "text/plain;charset=utf-8")
    @ResponseBody
    public ModelAndView getCountryNew(HttpServletRequest request, HttpServletRequest resp){
        String name = request.getParameter("name");
        String img = request.getParameter("img");
        List<Country> list = countryService.getResourceList("4" );
        ModelAndView modelAndView = new ModelAndView("page4");
        modelAndView.addObject("newList",list);
        return modelAndView;
    }

    @RequestMapping(value = "/getResource", produces = "text/plain;charset=utf-8")
    @ResponseBody
    public ModelAndView getResource(HttpServletRequest request, HttpServletRequest resp){
        String id = request.getParameter("id");
        String type = request.getParameter("type");
        updateCountryClick(id,type);
        ModelAndView modelAndView = new ModelAndView("read");
        List<Country> list = countryService.getResource(id,type);
        modelAndView.addObject("viewModel",list.get(0));
        return modelAndView;
    }


    @RequestMapping(value = "/getGood", produces = "text/plain;charset=utf-8")
    @ResponseBody
    public Object getGood(HttpServletRequest request, HttpServletRequest resp){
        Object user = request.getSession().getAttribute("userLogin");
        String flag = "0";
        if (user!=null){
            String id = request.getParameter("id");
            String type = request.getParameter("type");
            updateCountryGood(id,type);
            flag = "1";
        }
        return flag;
    }

    public void updateCountryClick(String id,String type ){
        countryService.updateCountryClick( id,type);
    }

    public void updateCountryGood(String id,String type ){
        countryService.updateCountryGood( id,type);
    }
}
