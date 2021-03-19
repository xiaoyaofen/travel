package com.yaofen.mapper;


import com.yaofen.bean.Country;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface CountryMapper {

    //查询乡村故事
    public List<Country> getCountryStory(@Param("page") Integer page, @Param("limit") Integer limit);

    //查询乡村特产
    public List<Country> getCountryEat(@Param("page") Integer page, @Param("limit") Integer limit);

    //查询乡村风景
    public List<Country> getCountryView(@Param("page") Integer page, @Param("limit") Integer limit);
}
