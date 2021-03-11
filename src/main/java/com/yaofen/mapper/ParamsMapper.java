package com.yaofen.mapper;

import com.yaofen.bean.Params;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ParamsMapper {
    public List<Params> getValue(@Param("page") Integer page, @Param("limit") Integer limit);

    public Integer findCountValue();

    public Integer fixValue(@Param("id") String id, @Param("name") String document, @Param("value") String point);

    public Integer delValue(@Param("id") String id);
}
