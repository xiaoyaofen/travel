package com.yaofen.service;

import com.yaofen.bean.Country;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface CountryService {
    //查询乡村故事
    public List<Country> getCountryStory(String name,String img,Integer page,Integer limit);

    public List<Country> getCountryEat(String name,String img,Integer page,Integer limit);

    public List<Country> getCountryView(String name,String img,Integer page, Integer limit);

    public List<Country> getCountryNew(String name,String img,Integer page, Integer limit);

    public List<Country> findCountryName();

    public String findCountryIdByName(String country);

    public void updateCountryView(String name,String img,String time,String country,String id);

    public void addCountryView(String name,String img,String time,String countryid);

    public void delCountry(String id);

    public void updateCountryStory(String name,String img,String time,String story,String id);

    public void addCountryStory(String name,String img,String time,String story);

    public void delCountryStory(String id);

    public void updateCountryEat(String name,String img,String detail,String country,String id);

    public void addCountryEat(String name,String img,String detail,String countryid);

    public void delCountryEat(String id);

    public void updateCountryNew(String name,String img,String time,String country,String id);

    public void addCountryNew(String name,String img,String time,String countryid);

    public void delCountryNew(String id);


    public  List<Country> getResource(String id,String type);

    public List<Country> getResourceList(String type);

    public void updateCountryClick(String id,String type);

    public void updateCountryGood(String id,String type);
}
