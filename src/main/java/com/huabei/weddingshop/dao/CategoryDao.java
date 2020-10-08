package com.huabei.weddingshop.dao;



import com.huabei.weddingshop.entity.Category;

import java.sql.SQLException;
import java.util.List;

/**
 * 商品类别的数据交互层
 */
public class CategoryDao extends BaseDao<Category> {

    //查询所有商品类别
    public List<Category> selectAllCategorys() throws SQLException {
        String sql = "select * from category";
        List<Category> categoryList = this.getBeanList(Category.class, sql, null);
        return categoryList;
    }

    //通过类别编号获取类别名称
    public String selectCname(String cid) throws SQLException {
        String sql = "select cname from category where cid = ?";
        Object cname = this.getSingleValue(sql, cid);
        return cname.toString();
    }
}
