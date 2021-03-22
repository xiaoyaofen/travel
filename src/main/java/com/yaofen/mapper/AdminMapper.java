package com.yaofen.mapper;

import com.yaofen.bean.Admin;
import com.yaofen.bean.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface AdminMapper {
    public Admin login(Admin admin);

    public List<User> userList(@Param("page") Integer page, @Param("limit") Integer limit,@Param("account") String account, @Param("sex") String sex);

    public void updateUserInfo(@Param("account") String account, @Param("email") String email, @Param("sex") String sex, @Param("tel") String tel,@Param("id") String id);

    public void addUser(@Param("account") String account, @Param("email") String email, @Param("sex") String sex, @Param("tel") String tel);

    public void delUser(@Param("id") String id);
}
