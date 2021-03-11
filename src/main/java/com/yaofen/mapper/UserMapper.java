package com.yaofen.mapper;

import com.yaofen.bean.Member;
import com.yaofen.bean.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface UserMapper {
    public User login(@Param("name") String name, @Param("pwd") String pwd);

    public String findRoleByAccount(@Param("account") String account);

    public User checkAccount(@Param("account") String account);

    public Integer addUser(User user);

    public Integer addScoreTab(@Param("userid") String userid, @Param("fileid") String fileid, @Param("type") String type, @Param("score") String score);

    public List<User> getManUser(@Param("page") Integer page, @Param("limit") Integer limit);

    public Integer getManUserCount();

    public Integer checkUser(@Param("id") String id);

    public List<Member> getUserLevel();

    public Integer fixLevel(@Param("id") String id, @Param("level") String level, @Param("upload") String upload, @Param("download") String download);

    public Integer delUserLevel(@Param("id") String id);

    public Member checkUserLevel(@Param("level") String level);

    public String findValueByLevel(@Param("level") String level);

    public Integer addUserLevel(@Param("value") Integer value, @Param("level") String level, @Param("upload") String upload, @Param("download") String download);

    public String findPoint(@Param("name") String name);
}
