package com.huabei.weddingshop.service;


import com.huabei.weddingshop.dao.AdminDao;
import com.huabei.weddingshop.entity.Admin;
import com.huabei.weddingshop.entity.Category;
import com.huabei.weddingshop.entity.Product;
import com.huabei.weddingshop.vo.HomeVO;
import com.huabei.weddingshop.vo.PageVO;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

public class AdminService {

    private AdminDao dao = new AdminDao();

    //登录
    public Admin login(String name , String pwd){
        Admin admin = null;
        try {
            admin = dao.selectOne(name, pwd);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return admin;
    }

    //查询本年度每月订单总数
    public List<HomeVO> findNumByMonth() {
        List<HomeVO> voList = null;
        try {
            voList = dao.selectNumByMonth();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return voList;
    }

    //分页查询
    public PageVO findAll(String tableName , String query , int pageNow){
       PageVO vo = new PageVO();

        //给当前页传值
        vo.setPageNow(pageNow);

        //查询总记录数
        int myCounts = 0;
        try {
            myCounts = dao.selectCounts(tableName,query);
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

        //计算总页数
        int myPages = (int)(myCounts%5==0 ? myCounts/5 : (myCounts/5)+1);
        vo.setMyPages(myPages);

        //当页的数据记录
        int begin =  (pageNow - 1)*5;
        List<? extends Object> list = null;
        try {
            list = dao.selectAll(tableName , query, begin);
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        vo.setList(list);

        //返回分页的辅助类对象
        return vo;
    }

    //查询编号查询信息
    public List<Map<String, Object>> findOneById(String code , String id){
        List<Map<String, Object>> mapList = null;
        try {
            mapList = dao.selectOneById(code, id);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return mapList;
    }

    //删除
    public void delete(String tableName, String[] ids){
        for (String uid : ids) {
            try {
                dao.delete(tableName, uid);
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    //上架商品
    public void add(Product product) {
        try {
            dao.add(product);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    //查询所有商品类别
    public List<Category> findAllCategory(){
        List<Category> categoryList = null;
        try {
            categoryList = dao.selectAllCategory();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return categoryList;
    }

    //修改商品
    public void update(Product product){
        try {
            dao.update(product);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    //添加或修改商品类别
    public void updateCategory(String code , Category category){
        try {
            dao.updateCategory(code , category);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
