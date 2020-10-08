package com.huabei.weddingshop.dao;


import com.huabei.weddingshop.entity.*;
import com.huabei.weddingshop.utils.DataSourceUtils;
import com.huabei.weddingshop.vo.HomeVO;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.MapListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

public class AdminDao {

    //通过姓名和密码查询信息
    public Admin selectOne(String name, String pwd) throws SQLException {
        QueryRunner runner = new QueryRunner();
        String sql = "select * from t_admin where adminName = ? and adminPwd = ?";
        Admin admin = runner.query(DataSourceUtils.getConnection(), sql, new BeanHandler<>(Admin.class), name , pwd);
        return admin;
    }

    //查询本年度每月订单总数
    public List<HomeVO> selectNumByMonth() throws SQLException {
        QueryRunner runner = new QueryRunner();
        String sql = "select count(*) num , month(ordertime) month " +
                " from orders where year(ordertime)=year(now()) " +
                " group by month(ordertime) order by month";
        List<HomeVO> list = runner.query(DataSourceUtils.getConnection(), sql, new BeanListHandler<>(HomeVO.class));
        return list;
    }

    //查询指定表的总记录数
    public int selectCounts(String tableName, String query) throws SQLException {
        QueryRunner runner = new QueryRunner();
        String sql = "";
        if(tableName.equals("user")){
            sql = "select count(*) from user where username like concat('%',?,'%')";
        }else if(tableName.equals("order")){
            sql = "select count(*) from orders where name like concat('%',?,'%')";
        }else if(tableName.equals("product")){
            sql = "select count(*) from product where pname like concat('%',?,'%') and pflag=0 ";
        }else if(tableName.equals("category")){
            sql = "select count(*) from category where cname like concat('%',?,'%')";
        }
        Long counts = (Long)runner.query(DataSourceUtils.getConnection(), sql, new ScalarHandler(),query);
        return counts.intValue();
    }

    //查询指定表中的数据
    public List<? extends Object> selectAll(String tableName, String query, int begin) throws SQLException {
        QueryRunner runner = new QueryRunner();
        String sql = "";
        if(tableName.equals("user")){
            sql = "select * from user where username like concat('%',?,'%') limit ?,5";
            List<User> userList = runner.query(DataSourceUtils.getConnection(), sql, new BeanListHandler<>(User.class), query, begin);
            return userList;
        }else if(tableName.equals("order")){
            sql = "select * from orders where name like concat('%',?,'%') limit ?,5";
            List<Orders> orderList = runner.query(DataSourceUtils.getConnection(), sql, new BeanListHandler<>(Orders.class), query, begin);
            return orderList;
        }else if(tableName.equals("product")){
            sql = "select * from product where pname like concat('%',?,'%') and pflag=0 order by pid+0 limit ?,5";
            List<Product> productList = runner.query(DataSourceUtils.getConnection(), sql, new BeanListHandler<>(Product.class), query, begin);
            return productList;
        }else{
            sql = "select * from category where cname like concat('%',?,'%') order by cid+0 limit ?,5";
            List<Category> categoryList = runner.query(DataSourceUtils.getConnection(), sql, new BeanListHandler<>(Category.class), query, begin);
            return categoryList;
        }
    }

    //查询用户编号查询用户拥有的订单信息
    public List<Map<String, Object>> selectOneById(String tableName, String id) throws SQLException {
        QueryRunner runner = new QueryRunner();
        List<Map<String, Object>> list = null;
        String sql = null;
        if(tableName.equals("user")) {
            sql = "select * from user u ,orders o where u.uid = o.uid and u.uid=?";
        }else if(tableName.equals("product")){
            sql = "select * from product p , category c where p.cid = c.cid and p.pid=?";
        }else if(tableName.equals("order")){
            sql = "select * from orders o , product p , orderitem i  where o.oid=i.oid and i.pid=p.pid and o.oid=?";
        }else{
            sql = "select * from category where cid=?";
        }
        list = runner.query(DataSourceUtils.getConnection(), sql, new MapListHandler(), id);
        return list;
    }

    //删除
    public void delete(String tableName, String id) throws SQLException {
        QueryRunner runner = new QueryRunner();
        String sql = "";
        String sql1 = "";
        if(tableName.equals("user")){
            sql = "delete from user where uid=?";
        }else if(tableName.equals("order")){
            sql1 = "delete from orderitem where oid = ?";
            runner.update(DataSourceUtils.getConnection(), sql1, id);
            sql = "delete from orders where oid=?";
        }else if(tableName.equals("product")){
            sql = "update product set pflag = 1 where pid = ?";
        }else{
            sql = "delete from category where cid=?";
        }
        runner.update(DataSourceUtils.getConnection(), sql, id);
    }

    //上架商品
    public void add(Product product) throws SQLException {
        QueryRunner runner = new QueryRunner();
        String sql = "insert into product values(?,?,?,?,?,?,?,?,?,?)";
        runner.update(DataSourceUtils.getConnection(), sql, product.getPid(),
                product.getPname() , product.getMarket_price() , product.getShop_price() ,
                product.getPimage() , product.getPdate() , 0 ,
                product.getPdesc() , 0 , product.getCategory().getCid());
    }

    //查询所有商品类别
    public List<Category> selectAllCategory() throws SQLException {
        QueryRunner runner = new QueryRunner();
        String sql = "select * from category";
        List<Category> categoryList = runner.query(DataSourceUtils.getConnection(), sql, new BeanListHandler<>(Category.class));
        return categoryList;
    }

    //修改商品
    public void update(Product product) throws SQLException {
        QueryRunner runner = new QueryRunner();
        String sql = "update product set pname=?,market_price=?,shop_price=?,pimage=?,pdate=?,pdesc=?,cid=? where pid=?";
        runner.update(DataSourceUtils.getConnection(), sql,
                product.getPname() , product.getMarket_price() , product.getShop_price() ,
                product.getPimage() , product.getPdate() ,
                product.getPdesc() , product.getCategory().getCid() ,product.getPid());
    }

    //添加或修改商品类别
    public void updateCategory(String code, Category category) throws SQLException {
        QueryRunner runner = new QueryRunner();
        String sql = null;
        if(code.equals("add")){
            sql = "insert into category values(?,?)";
            runner.update(DataSourceUtils.getConnection(), sql, category.getCid() , category.getCname());
        }else if(code.equals("update")){
            sql = "update category set cname = ? where cid = ?";
            runner.update(DataSourceUtils.getConnection(), sql , category.getCname() , category.getCid());
        }
    }
}
