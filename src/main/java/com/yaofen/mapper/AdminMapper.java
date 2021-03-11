package com.yaofen.mapper;

import com.yaofen.bean.Admin;
import com.yaofen.bean.Params;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface AdminMapper {
    public Admin login(Admin admin);

    public Admin checkAdmin(@Param("account") String account);

    public Integer addAdmin(Admin admin);

    public List<Admin> findAdmin(@Param("time1") String time1, @Param("time2") String time2, @Param("account") String account, @Param("curPage") Integer curPage, @Param("pageSize") Integer pageSize);

    public Integer findCount(@Param("time1") String time1, @Param("time2") String time2, @Param("account") String account);

    public Integer delAdmin(@Param("account") String account);

    public Integer fixAdmin(@Param("newname") String newname, @Param("newlevel") String newlevel, @Param("oldname") String oldname);

    public List<Params> getQuan();
}
