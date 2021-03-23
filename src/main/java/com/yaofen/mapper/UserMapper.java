package com.yaofen.mapper;

import com.yaofen.bean.Admin;
import com.yaofen.bean.User;
import org.apache.ibatis.annotations.Param;

import java.util.HashMap;
import java.util.List;

public interface UserMapper {


    public User login(User user);

    public boolean addUser(HashMap hashMap);
}
