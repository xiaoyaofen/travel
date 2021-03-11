package com.yaofen.mapper;

import com.yaofen.bean.SystemLog;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ActionMapper {
    public void addAction(SystemLog log);

    public List<SystemLog> getAction();

    public Integer delAction(@Param("id") Integer id);
}
