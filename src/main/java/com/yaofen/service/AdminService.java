package com.yaofen.service;

import com.yaofen.bean.*;

import java.util.List;
import java.util.Map;

public interface AdminService {
    public Admin login(String account, String pwd);

    public List<User> userList(Integer page, Integer limit);

}

