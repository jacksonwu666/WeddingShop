package com.huabei.weddingshop.dao;



import com.huabei.weddingshop.entity.OrderItem;
import com.huabei.weddingshop.entity.Orders;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

/**
 * 订单及订单明细相关的数据交互层
 */
public class OrderDao extends BaseDao<Orders> {

    //插入订单
    public int insertOrder(Orders orders) throws SQLException {
        String sql = "insert into orders values(?,?,?,?,?,?,?,?)";
        int i = this.update(sql, orders.getOid(), orders.getOrdertime(), orders.getTotal(),
                orders.getState(), orders.getAddess(), orders.getName(), orders.getTelephone(),
                orders.getUser().getUid());
        return i;
    }

    //插入订单明细
    public int insertOrderItem(Orders orders) throws SQLException {
        int i = 0;
        String sql = "insert into orderitem values(?,?,?,?,?)";
        for (OrderItem item : orders.getItemsList()) {
            i = this.update(sql, item.getItemid(), item.getCount(), item.getSubtotal(),
                    item.getProduct().getPid(), item.getOrders().getOid());
        }
        return i;
    }

    //更新订单中的收货人信息
    public int updateOrderUser(Orders orders) throws SQLException {
        String sql = "update orders set name = ? , address = ? , telephone = ? where oid = ?";
        int i = this.update(sql, orders.getName(), orders.getAddess(), orders.getTelephone(), orders.getOid());
        return i;
    }

    //修改订单状态
    public int updateOrderState(String oid) throws SQLException {
        String sql = "update orders set state = 1 where oid = ?";
        int i = this.update(sql, oid);
        return i;
    }


    //查看我的订单列表（根据用户uid查看）
    public List<Orders> selectOrdersByUid(String uid, int begin) throws SQLException {
        String sql = "select * from orders where uid = ? order by ordertime desc limit ?,2";
        List<Orders> ordersList = this.getBeanList(Orders.class, sql, uid, begin);
        return ordersList;
    }


    //查看我的订单总记录数（根据用户uid查看）
    public int selectCountsByUid(String uid) throws SQLException {
        String sql = "select count(*) from orders where uid = ?";
        Long value = (Long)this.getSingleValue(sql, uid);
        return value.intValue();
    }


    //根据订单号查看订单详情
    public List<Map<String, Object>> selectOrderItemAndProduct(String oid) throws SQLException {
        String sql = "select * from orderitem i inner join product p on i.pid = p.pid where i.oid = ?";
        List<Map<String, Object>> mapList = this.getMap(sql, oid);
        return mapList;
    }
}
