package com.huabei.weddingshop.entity;

//订单明细
public class OrderItem {
    //订单明细编号
    private String itemid;
    //购买数量
    private int count;
    //小计
    private double subtotal;

    //购买商品 一对一关联
    private Product product;

    //所属订单 一对一关联
    private Orders orders;

    public OrderItem() {
    }

    public OrderItem(String itemid, int count, double subtotal, Product product, Orders orders) {
        this.itemid = itemid;
        this.count = count;
        this.subtotal = subtotal;
        this.product = product;
        this.orders = orders;
    }

    public String getItemid() {
        return itemid;
    }

    public void setItemid(String itemid) {
        this.itemid = itemid;
    }

    public int getCount() {
        return count;
    }

    public void setCount(int count) {
        this.count = count;
    }

    public double getSubtotal() {
        return subtotal;
    }

    public void setSubtotal(double subtotal) {
        this.subtotal = subtotal;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public Orders getOrders() {
        return orders;
    }

    public void setOrders(Orders orders) {
        this.orders = orders;
    }

    @Override
    public String toString() {
        return "OrderItem{" +
                "itemid='" + itemid + '\'' +
                ", count=" + count +
                ", subtotal=" + subtotal +
                ", product=" + product +
                ", orders=" + orders +
                '}';
    }
}
