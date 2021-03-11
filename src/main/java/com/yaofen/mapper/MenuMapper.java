package com.yaofen.mapper;

import com.yaofen.bean.Menu;
import com.yaofen.bean.Params;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface MenuMapper {
    public List<Menu> findMenuByid(Menu menu);

    public Params getPar(@Param("type") String type, @Param("value") String value);

    public List<Menu> findAllMenu(@Param("pid") Integer pid);

    public List<Menu> findRoleMenu(@Param("roleid") String roleid, @Param("pid") Integer pid);

    public Integer deleteAllMenuByid(@Param("roleid") String roleid);

    public void addMenuByid(@Param("mid") String mid, @Param("roleid") String roleid);
}
