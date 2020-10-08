package com.huabei.weddingshop.service;



import com.huabei.weddingshop.dao.ProductDao;
import com.huabei.weddingshop.entity.Product;
import com.huabei.weddingshop.vo.PageVO;

import java.sql.SQLException;
import java.util.List;

/**
 * 商品的交互层
 */
public class ProductService {

    private ProductDao dao = new ProductDao();

    //查询热门商品
    public List<Product> viewHot(){
        List<Product> list = null;
        try {
            list = dao.selectAllByIsHot();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    //查询最新商品
    public List<Product> viewNew(){
        List<Product> list = null;
        try {
            list = dao.selectAllByPdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    //分页+条件模糊查询+商品类别 查询商品列表
    public PageVO<Product> viewProductListByCid(String cid, String query, Integer pageNow){
        PageVO<Product> vo = null;
        try {
            //获得总记录数
            int counts = dao.selectCountsByCidPname(cid, query);

            //总页数
            int myPages = (int)(counts%8==0?counts/8:counts/8+1);

            //计算起始值
            int begin = (pageNow-1)*8;

            //查询商品数据
            List<Product> list = dao.selectProductsByCidPname(cid,query,begin);

            //封装PageVO
            vo = new PageVO<Product>(pageNow,myPages,query,list);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return vo;
    }

    //通过商品ID查询商品信息
    public Product viewProductById(String id){
        Product product = null;
        try {
            product = dao.selectProductById(id);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return product;
    }
}
