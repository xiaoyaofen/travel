package com.yaofen.service;

import com.yaofen.bean.*;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface AdminService {
    public Admin login(String account, String pwd);

    public List<User> userList(Integer page, Integer limit,String account,String sex);

    public void updateUserInfo(String account,String email, String sex, String tel, String id);

    public void addUser(String account, String email, String sex, String tel);

    public void delUser(String id);
}

