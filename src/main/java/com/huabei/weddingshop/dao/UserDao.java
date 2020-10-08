package com.huabei.weddingshop.dao;
import com.huabei.weddingshop.entity.User;
import java.sql.SQLException;

/**
 * 用户数据交互层
 */
public class UserDao extends BaseDao<User> {

    //插入用户信息
    public int insert(User user) throws SQLException {
        String sql = "insert into user values(?,?,?,?,?,?,?,?,?,?,?)";
        int i = this.update(sql, user.getUid(), user.getUsername(), user.getPassword(), user.getName(),
                user.getEmail(), user.getTelephone(), user.getBirthday(),
                user.getSex(), user.getState(), user.getCode(), user.getAddress());
        return i;
    }

    //根据code修改state
    public int updateState(String code) throws SQLException {
            String sql = "update user set state=1 where code=?";
        int i = this.update(sql, code);
        return i;
    }

    //根据姓名查询信息
    public Long selectOne(String username) throws SQLException {
        String sql = "select count(*) from user where username = ?";
        Long value = this.getSingleValue(sql, username);
        return value;
    }
    //根据姓名和密码查询用户信息
    public User selectOne(String username,String password) throws SQLException {
        String sql = "select * from user where username = ? and password = ?";
        User user = this.getBean(User.class, sql, username, password);
        return user;
    }


}
