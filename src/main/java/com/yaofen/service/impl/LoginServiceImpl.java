package com.yaofen.service.impl;

import com.yaofen.aoplog.Log;
import com.yaofen.bean.*;
import com.yaofen.mapper.*;
import com.yaofen.servicelog.impl.LoginService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service("loginServiceImpl")
public class LoginServiceImpl implements LoginService {
    @Autowired
    private AdminMapper adminMapper;
    @Autowired
    private MenuMapper menuMapper;
    @Autowired
    private ActionMapper actionMapper;
    @Autowired
    private DocumentMapper documentMapper;
    @Autowired
    private UserMapper userMapper;
    @Autowired
    private ParamsMapper paramsMapper;

    @Log(operationType = "登录", operationName = "管理员")

    @Override
    public User checkUser(String account, String pwd) {
        User user = null;
        user = userMapper.login(account, pwd);
        return user;
    }

    @Override
    public User checkAccount(String account) {
        User user = null;
        user = userMapper.checkAccount(account);
        return user;
    }

    @Override
    public Integer addUser(User user) {
        Integer num = null;
        num = userMapper.addUser(user);
        return num;
    }

    @Override
    public String findRoleByAccount(String account) {
        String role = null;
        role = userMapper.findRoleByAccount(account);
        return role;
    }

    @Override
    public Admin checkAdmin(String account, String pwd) {
        Admin admin = new Admin();
        admin.setAccount(account);
        admin.setPwd(pwd);
        admin = adminMapper.login(admin);
        return admin;
    }

    @Override
    public Map<String, List<Menu>> findMenuByidMan(String rolesid) {
        Menu menu = new Menu();
        menu.setPid(String.valueOf(0));
        menu.setRoleid(rolesid);
        Map<String, List<Menu>> map = new HashMap<>();
        List<Menu> list = menuMapper.findMenuByid(menu);

        for (int i = 0; i < list.size(); i++) {
            Menu menu1 = list.get(i);
            menu1.setRoleid(rolesid);
            menu1.setPid(String.valueOf(menu1.getId()));
            List<Menu> list1 = menuMapper.findMenuByid(menu1);
            map.put(menu1.getMenuname(), list1);
        }
        return map;
    }

    @Override
    public Params findNamebyValue(String type, String value) {
        Params params = null;
        params = menuMapper.getPar(type, value);
        return params;
    }

    @Override
    public List<Admin> findAdmin(String time1, String time2, String account, Integer curPage, Integer pageSize) {
        List<Admin> list = new ArrayList<>();
        list = adminMapper.findAdmin(time1, time2, account, curPage, pageSize);
        return list;
    }

    @Override
    public Integer findCount(String time1, String time2, String account) {
        Integer count = null;
        count = adminMapper.findCount(time1, time2, account);
        return count;
    }


    @Override
    public Admin checkAdmin(String account) {
        Admin admin = null;
        admin = adminMapper.checkAdmin(account);
        return admin;
    }

    @Override
    public Integer addAdmin(Admin admin) {
        Integer num = null;
        num = adminMapper.addAdmin(admin);
        return num;
    }

    @Override
    public Integer delAdmin(String account) {
        Integer num = null;
        num = adminMapper.delAdmin(account);
        return num;
    }

    @Override
    public Integer fixAdmin(String newname, String newlevel, String oldname) {
        Integer num = null;
        num = adminMapper.fixAdmin(newname, newlevel, oldname);
        return num;
    }

    @Override
    public Integer addScoreTab(String userid, String fileid, String type, String score) {
        Integer num = null;
        num = userMapper.addScoreTab(userid, fileid, type, score);
        return num;
    }

    @Override
    public List<Document> findDoc(String time1, String time2, String people, String title, String type, Integer page1, Integer limit) {
        List<Document> list = new ArrayList<>();
        list = documentMapper.findDoc(time1, time2, people, title, type, page1, limit);
        return list;
    }

    @Override
    public Integer findCountDoc(String time1, String time2, String people, String title, String type) {
        Integer num = null;
        num = documentMapper.findCountDoc(time1, time2, people, title, type);
        return num;
    }

    @Override
    public List<Document> getDoc(String doc) {
        List<Document> list = new ArrayList<>();
        list = documentMapper.getDoc(doc);
        return list;
    }

    @Override
    public List<User> getManUser(Integer page, Integer limit) {
        List<User> list = new ArrayList<>();
        list = userMapper.getManUser(page, limit);
        return list;
    }

    @Override
    public Integer getManUserCount() {
        Integer count = null;
        count = userMapper.getManUserCount();
        return count;
    }

    @Override
    public Integer checkUser(String id) {
        Integer num = null;
        num = userMapper.checkUser(id);
        return num;
    }

    @Override
    public List<Member> getUserLevel() {
        List<Member> list = null;
        list = userMapper.getUserLevel();
        return list;
    }

    @Override
    public Integer fixLevel(String id, String level, String upload, String download) {
        Integer num = null;
        num = userMapper.fixLevel(id, level, upload, download);
        return num;
    }

    @Override
    public Integer delUserLevel(String id) {
        Integer num = null;
        num = userMapper.delUserLevel(id);
        return num;
    }

    @Override
    public Member checkUserLevel(String level) {
        Member member = null;
        member = userMapper.checkUserLevel(level);
        return member;
    }

    @Override
    public String findValueByLevel(String level) {
        String value = null;
        value = userMapper.findValueByLevel(level);
        return value;
    }

    @Override
    public Integer addUserLevel(Integer value, String level, String upload, String download) {
        Integer num = null;
        num = userMapper.addUserLevel(value, level, upload, download);
        return num;
    }

    @Override
    public List<SystemLog> getAction() {
        List<SystemLog> list = new ArrayList<>();
        list = actionMapper.getAction();
        return list;
    }

    @Override
    public Integer delAction(Integer id) {
        Integer num = null;
        num = actionMapper.delAction(id);
        return num;
    }

    @Override
    public List<Params> getValue(Integer page, Integer limit) {
        List<Params> list = new ArrayList<>();
        list = paramsMapper.getValue(page, limit);
        return list;
    }

    @Override
    public Integer findCountValue() {
        Integer num = null;
        num = paramsMapper.findCountValue();
        return num;
    }

    @Override
    public Integer fixValue(String id, String document, String point) {
        Integer num = null;
        num = paramsMapper.fixValue(id, document, point);
        return num;
    }

    @Override
    public Integer delValue(String id) {
        Integer num = null;
        num = paramsMapper.delValue(id);
        return num;
    }

    @Override
    public List<Params> getQuan() {
        List<Params> list = adminMapper.getQuan();
        return list;
    }

    @Override
    public Integer addDocuemnt(Document document) {
        Integer num = documentMapper.addDocuemnt(document);
        return num;
    }

    @Override
    public List<Document> getDownloadDoc() {
        List<Document> list = documentMapper.getDownloadDoc();
        return list;
    }

    @Override
    public String findPoint(String name) {
        String point = userMapper.findPoint(name);
        return point;
    }

    @Override
    public String findUrlById(String id) {
        String url = documentMapper.findUrlById(id);
        return url;
    }

    @Override
    @Transactional
    public TreeNode findAllMenu(String roleid) {
        TreeNode treeRootNode = new TreeNode();
        List<TreeNode> rootchildren = new ArrayList<>();
        treeRootNode.setId(0);
        treeRootNode.setTitle("系统全部菜单");
        treeRootNode.setChildren(rootchildren);
        treeRootNode.setSpread(true);
        List<Menu> list = menuMapper.findAllMenu(0);
        List<Menu> list2 = menuMapper.findRoleMenu(roleid, 0);
        for (int i = 0; i < list.size(); i++) {
            TreeNode treeNode = new TreeNode();
            treeNode.setTitle(list.get(i).getMenuname());
            treeNode.setId(list.get(i).getId());
            treeNode.setSpread(true);
            List<TreeNode> children = new ArrayList<>();
            treeNode.setChildren(children);

            List<Menu> list1 = menuMapper.findAllMenu(list.get(i).getId());
            for (int j = 0; j < list1.size(); j++) {
                TreeNode twoTreeNode = new TreeNode();
                twoTreeNode.setTitle(list1.get(j).getMenuname());
                twoTreeNode.setId(list1.get(j).getId());
                for (int jj = 0; jj < list2.size(); jj++) {
                    List<Menu> list3 = menuMapper.findRoleMenu(roleid, list2.get(jj).getId());
                    for (int jjj = 0; jjj < list3.size(); jjj++) {
                        if (list3.get(jjj).getMenuname().equals(list1.get(j).getMenuname())) {
                            twoTreeNode.setChecked(true);
                        }
                    }
                }

                children.add(twoTreeNode);
            }
            rootchildren.add(treeNode);
        }
        return treeRootNode;
    }

    @Override
    public Integer deleteAllMenuByid(String roleid) {
        Integer num = menuMapper.deleteAllMenuByid(roleid);
        return num;
    }

    @Override
    public void addMenuByid(String mid, String roleid) {
        menuMapper.addMenuByid(mid, roleid);
    }


}
