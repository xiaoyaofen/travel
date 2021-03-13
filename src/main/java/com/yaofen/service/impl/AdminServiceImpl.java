package com.yaofen.service.impl;

import com.yaofen.bean.*;
import com.yaofen.mapper.*;
import com.yaofen.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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


}
