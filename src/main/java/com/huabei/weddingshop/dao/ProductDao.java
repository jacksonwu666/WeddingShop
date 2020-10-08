package com.huabei.weddingshop.dao;



import com.huabei.weddingshop.entity.Product;

import java.sql.SQLException;
import java.util.List;

/**
 * 商品的数据交互层
 */
public class ProductDao extends BaseDao<Product>{

    //根据is_hot=1查询热门商品
    public List<Product> selectAllByIsHot() throws SQLException {
        String sql ="select * from product where is_hot=1 limit 0,?";
        List<Product> productList = this.getBeanList(Product.class, sql, 8);
        return productList;
    }

    //根据pdate降序查询最新商品
    public List<Product> selectAllByPdate() throws SQLException {
        String sql = "select * from product order by pdate desc limit 0,?";
        List<Product> productList = this.getBeanList(Product.class, sql, 8);
        return productList;
    }

    //通过商品 类别编号+商品名称 模糊 分页 查询商品信息
    public List<Product> selectProductsByCidPname(String cid,String query,int begin) throws SQLException {
        String sql = "";
        List<Product> productList = null;
        //直接表单条件搜索
        if(cid==null || cid.equals("")){
           sql = "select * from product where pname like concat('%',?,'%') limit ?,12";
            productList = this.getBeanList(Product.class, sql, query, begin);
        }
        //点击商品类别进行查询+表单搜索
        else if(cid!=null && !cid.equals("")){
            sql = "select * from product where cid=? and pname like concat('%',?,'%') limit ?,12";
            productList = this.getBeanList(Product.class,sql,cid,query,begin);
        }

        return productList;
    }

    //通过商品 类别编号+商品名称 模糊查询总记录数
    public int selectCountsByCidPname(String cid,String query) throws SQLException {
        String sql = "";
        Long counts = 0L;
        //直接表单条件搜索
        if(cid==null || cid.equals("")){
            sql = "select count(*) from product where pname like concat('%',?,'%')";
            counts = (Long)this.getSingleValue(sql, query);
        }
        //点击商品类别进行查询+表单搜索
        else if(cid!=null && !cid.equals("")){
            sql = "select count(*) from product where cid=? and pname like concat('%',?,'%')";
            counts = (Long)this.getSingleValue(sql, cid , query);
        }
        return counts.intValue();
    }

    //根据编号id查询商品信息
    public Product selectProductById(String id) throws SQLException {
        String sql = "select * from product where pid = ?";
        Product product = this.getBean(Product.class, sql, id);
        return product;
    }
}
