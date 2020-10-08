package com.huabei.weddingshop.service;
import com.huabei.weddingshop.dao.UserDao;
import com.huabei.weddingshop.entity.User;

import java.sql.SQLException;

/**
 * 用户的业务逻辑层
 */
public class UserService {

    private UserDao dao = new UserDao();

    //用户注册
    public boolean regist(User user){
        int i = 0;
        try {
            i = dao.insert(user);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return i>0 ? true : false;
    }

    //激活
    public boolean active(String code) {
        int i = 0;
        try {
            i = dao.updateState(code);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return i>0 ? true :false;
    }

    //校验用户名是否存在  true可用  false代表不可用
    public boolean validateName(String username){
        Long value = 0L;
        try {
            value = dao.selectOne(username);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return value>0?true:false;
    }
    //登录
    public User login(String username,String password){
        User user = null;
        try {
            user = dao.selectOne(username,password);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return user;
    }
}
