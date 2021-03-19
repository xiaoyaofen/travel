package com.yaofen.service;

import com.yaofen.bean.Country;

import java.util.List;

public interface CountryService {
    //查询乡村故事
    public List<Country> getCountryStory(Integer page,Integer limit);

    public List<Country> getCountryEat(Integer page,Integer limit);

    public List<Country> getCountryView(Integer page, Integer limit);
}
