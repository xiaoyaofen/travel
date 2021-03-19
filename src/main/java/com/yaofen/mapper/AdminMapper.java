package com.yaofen.mapper;

import com.yaofen.bean.Admin;
import com.yaofen.bean.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface AdminMapper {
    public Admin login(Admin admin);

    public List<User> userList(@Param("page") Integer page, @Param("limit") Integer limit);

}
