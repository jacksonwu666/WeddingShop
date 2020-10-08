package com.huabei.weddingshop.service;



import com.huabei.weddingshop.dao.CategoryDao;
import com.huabei.weddingshop.entity.Category;

import java.sql.SQLException;
import java.util.List;

/**
 * 商品类别的业务逻辑层
 */
public class CategoryService {

    private CategoryDao dao = new CategoryDao();

    //查询所有商品类别
    public List<Category> viewAllCategory(){
        List<Category> categoryList = null;
        try {
            categoryList = dao.selectAllCategorys();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return categoryList;
    }

    //获取类别名称
    public String viewCname(String cid){
        String cname = "";
        try {
            cname = dao.selectCname(cid);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return cname;
    }
}
