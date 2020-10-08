package com.huabei.weddingshop.service;



import com.huabei.weddingshop.dao.OrderDao;
import com.huabei.weddingshop.entity.Orders;
import com.huabei.weddingshop.utils.DataSourceUtils;
import com.huabei.weddingshop.vo.PageVO;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

//订单业务逻辑层
public class OrderService {

    private OrderDao dao = new OrderDao();

    //提交订单
    public boolean submitOrder(Orders orders) {

        try {
            //开启事务
            DataSourceUtils.startTransaction();

            //要么连个动作都做，要么都不做
            //插入订单
            dao.insertOrder(orders);
            //插入订单明细
            dao.insertOrderItem(orders);

            //提交订单成功
            return true;
        } catch (SQLException e) {
            e.printStackTrace();

            //回滚事务
            try {
                DataSourceUtils.rollback();
            } catch (SQLException ex) {
                ex.printStackTrace();
            }

            //提交订单失败
            return false;
        } finally {
            //释放资源
            try {
                DataSourceUtils.commitAndRelease();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    //更新订单中的收货人信息
    public int updateOrderUser(Orders orders){
        int i = 0;
        try {
            i = dao.updateOrderUser(orders);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return i;
    }


    //修改订单状态
    public int updateOrderState(String oid)  {
        int i = 0;
        try {
            i = dao.updateOrderState(oid);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return i;
    }

    //分页展示订单列表
    public PageVO<Orders> viewMyOrders(String uid, int pageNow){
        //获得总记录数
        int counts = 0;
        try {
            counts = dao.selectCountsByUid(uid);
        } catch (SQLException e) {
            e.printStackTrace();
        }

        //计算总页数
        int myPages = (int)(counts%2==0?counts/2:counts/2+1);

        //计算begin起始值
        int begin = (pageNow-1)*2;

        //查询数据
        List<Orders> orders = null;
        try {
            orders = dao.selectOrdersByUid(uid, begin);
        } catch (SQLException e) {
            e.printStackTrace();
        }

        //封装PageVO
        PageVO<Orders> vo = new PageVO<Orders>(pageNow,myPages,null,orders);
        return vo;
    }

    //根据订单号查看订单详情
    public List<Map<String, Object>> viewOrderItem(String oid){
        List<Map<String, Object>> mapList = null;
        try {
            mapList = dao.selectOrderItemAndProduct(oid);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return mapList;
    }
}
