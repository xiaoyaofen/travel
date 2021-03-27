package com.yaofen.mapper;


import com.yaofen.bean.Country;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface CountryMapper {

    //查询乡村故事
    public List<Country> getCountryStory(@Param("name") String name,@Param("img") String img,@Param("page") Integer page, @Param("limit") Integer limit);

    //查询乡村特产
    public List<Country> getCountryEat(@Param("name") String name,@Param("img") String img,@Param("page") Integer page, @Param("limit") Integer limit);

    //查询乡村风景
    public List<Country> getCountryView(@Param("name") String name,@Param("img") String img,@Param("page") Integer page, @Param("limit") Integer limit);

    public List<Country> findCountryName();

    public String findCountryIdByName(@Param("country") String country);

    public void updateCountryView(@Param("name") String name,@Param("img") String img,@Param("time") String time,@Param("country") String country,@Param("id") String id);

    public void addCountryView(@Param("name") String name,@Param("img") String img,@Param("time") String time,@Param("countryid") String countryid);

    public void delCountry(@Param("id") String id);

    public void updateCountryStory(@Param("name") String name,@Param("img") String img,@Param("time") String time,@Param("story") String story,@Param("id") String id);

    public void addCountryStory(@Param("name") String name,@Param("img") String img,@Param("time") String time,@Param("story") String story);

    public void delCountryStory(@Param("id") String id);

    public void updateCountryEat(@Param("name") String name,@Param("img") String img,@Param("detail") String detail,@Param("country") String country,@Param("id") String id);

    public void addCountryEat(@Param("name") String name,@Param("img") String img,@Param("detail") String detail,@Param("countryid") String countryid);

    public void delCountryEat(@Param("id") String id);

    public List<Country> getCountryNew(@Param("name") String name,@Param("img") String img,@Param("page") Integer page, @Param("limit") Integer limit);

    public void updateCountryNew(@Param("name") String name,@Param("img") String img,@Param("time") String time,@Param("country") String country,@Param("id") String id);

    public void addCountryNew(@Param("name") String name,@Param("img") String img,@Param("time") String time,@Param("countryid") String countryid);

    public void delCountryNew(@Param("id") String id);

    public List<Country> getResource(@Param("id") String id,@Param("type") String type);

    public List<Country> getResourceList(@Param("type") String type );

    public void updateCountryClick(@Param("id") String id,@Param("type") String type);

    public void updateCountryGood(@Param("id") String id,@Param("type") String type);

}
