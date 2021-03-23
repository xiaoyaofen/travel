package com.yaofen.service.impl;

import com.yaofen.bean.*;
import com.yaofen.mapper.*;
import com.yaofen.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("loginServiceImpl")
public class AdminServiceImpl implements AdminService {
    @Autowired
    private AdminMapper adminMapper;

    @Override
    public Admin login(String account, String pwd) {
        Admin admin = new Admin();
        admin.setAccount(account);
        admin.setPassword(pwd);
        admin = adminMapper.login(admin);
        return admin;
    }

    @Override
    public List<User> userList(Integer page, Integer limit,String account,String sex) {
        return adminMapper.userList(page,limit,account,sex);
    }

    @Override
    public void updateUserInfo(String account, String email, String sex, String tel, String id) {
        adminMapper.updateUserInfo(account,email,sex,tel,id);
    }

    @Override
    public void addUser(String account, String email, String sex, String tel) {
        adminMapper.addUser(account,email,sex,tel);
    }

    @Override
    public void delUser(String id) {
        adminMapper.delUser(id);
    }


}
