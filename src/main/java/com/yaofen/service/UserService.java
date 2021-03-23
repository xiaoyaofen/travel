package com.yaofen.service;

import com.yaofen.bean.Admin;
import com.yaofen.bean.User;

import java.util.HashMap;
import java.util.List;

public interface UserService {


    public User login(String acc,String pwd);


    public boolean addUser(HashMap hashMap);


}

