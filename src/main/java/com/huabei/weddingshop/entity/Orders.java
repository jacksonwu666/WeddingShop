package com.huabei.weddingshop.entity;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

//订单类
public class Orders {
    //订单号
    private String oid;
    //下单时间
    private Date ordertime;
    //订单总金额
    private double total;
    //订单状态 0-未支付  1-已支付
    private int state;
    //收货地址
    private String addess;
    //收货人
    private String name;
    //收货人联系方式
    private String telephone;

    //一对一关联  下单者信息
    private User user;

    //一对多关联  订单明细
    private List<OrderItem> itemsList = new ArrayList<OrderItem>();

    public Orders() {
    }

    public Orders(String oid, Date ordertime, double total, int state, String addess, String name, String telephone, User user, List<OrderItem> itemsList) {
        this.oid = oid;
        this.ordertime = ordertime;
        this.total = total;
        this.state = state;
        this.addess = addess;
        this.name = name;
        this.telephone = telephone;
        this.user = user;
        this.itemsList = itemsList;
    }

    public String getOid() {
        return oid;
    }

    public void setOid(String oid) {
        this.oid = oid;
    }

    public Date getOrdertime() {
        return ordertime;
    }

    public void setOrdertime(Date ordertime) {
        this.ordertime = ordertime;
    }

    public double getTotal() {
        return total;
    }

    public void setTotal(double total) {
        this.total = total;
    }

    public int getState() {
        return state;
    }

    public void setState(int state) {
        this.state = state;
    }

    public String getAddess() {
        return addess;
    }

    public void setAddess(String addess) {
        this.addess = addess;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getTelephone() {
        return telephone;
    }

    public void setTelephone(String telephone) {
        this.telephone = telephone;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public List<OrderItem> getItemsList() {
        return itemsList;
    }

    public void setItemsList(List<OrderItem> itemsList) {
        this.itemsList = itemsList;
    }

    @Override
    public String toString() {
        return "Orders{" +
                "oid='" + oid + '\'' +
                ", ordertime=" + ordertime +
                ", total=" + total +
                ", state=" + state +
                ", addess='" + addess + '\'' +
                ", name='" + name + '\'' +
                ", telephone='" + telephone + '\'' +
                ", user=" + user +
                ", itemsList=" + itemsList +
                '}';
    }
}
