package com.yaofen.service.impl;

import com.yaofen.bean.Admin;
import com.yaofen.bean.User;
import com.yaofen.mapper.AdminMapper;
import com.yaofen.mapper.UserMapper;
import com.yaofen.service.AdminService;
import com.yaofen.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;

@Service
public class UserServiceImpl implements UserService {
    @Autowired
    private UserMapper userMapper;



    @Override
    public User login(String account, String pwd) {
        User user = new User();
        user.setTel(account);
        user.setPassword(pwd);
        user = userMapper.login(user);
        return user;
    }

    @Override
    public boolean addUser(HashMap hashMap) {
        boolean flag = false;
        flag = userMapper.addUser(hashMap);
        return flag;
    }
}
