package com.yaofen.servicelog.impl;

import com.yaofen.bean.*;

import java.util.List;
import java.util.Map;

public interface LoginService {
        public User checkUser(String account, String pwd);

        public User checkAccount(String account);

        public Integer addUser(User user);

        public String findRoleByAccount(String account);

        public Admin checkAdmin(String account, String pwd);

        public Map<String, List<Menu>> findMenuByidMan(String rolesid);

        public Params findNamebyValue(String type, String value);

        public List<Admin> findAdmin(String time1, String time2, String account, Integer curPage, Integer pageSize);

        public Integer findCount(String time1, String time2, String account);

        public Admin checkAdmin(String account);

        public Integer addAdmin(Admin admin);

        public Integer delAdmin(String account);

        public Integer fixAdmin(String newname, String newlevel, String oldname);

        public Integer addScoreTab(String userid, String fileid, String type, String score);

        public List<Document> findDoc(String time1, String time2, String people, String title, String type, Integer page1, Integer limit);

        public Integer findCountDoc(String time1, String time2, String people, String title, String type);

        public List<Document> getDoc(String doc);

        public List<User> getManUser(Integer page, Integer limit);

        public Integer getManUserCount();

        public Integer checkUser(String id);

        public List<Member> getUserLevel();

        public Integer fixLevel(String id, String level, String upload, String download);

        public Integer delUserLevel(String id);

        public Member checkUserLevel(String level);

        public String findValueByLevel(String level);

        public Integer addUserLevel(Integer value, String level, String upload, String download);

        public List<SystemLog> getAction();

        public Integer delAction(Integer id);

        public List<Params> getValue(Integer page, Integer limit);

        public Integer findCountValue();

        public Integer fixValue(String id, String document, String point);

        public Integer delValue(String id);

        public List<Params> getQuan();

        public Integer addDocuemnt(Document document);

        public List<Document> getDownloadDoc();

        public String findPoint(String name);

        public String findUrlById(String id);

        public TreeNode findAllMenu(String roleid);

        public Integer deleteAllMenuByid(String roleid);

        public void addMenuByid(String mid, String roleid);
    }

