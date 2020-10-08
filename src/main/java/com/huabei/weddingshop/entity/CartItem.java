package com.huabei.weddingshop.entity;

//购物车明细
public class CartItem {

    //商品信息
    private Product product;
    //购买数量
    private int buyNum;
    //小计
    private double subTotal;

    public CartItem() {
    }

    public CartItem(Product product, int buyNum, double subTotal) {
        this.product = product;
        this.buyNum = buyNum;
        this.subTotal = subTotal;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public int getBuyNum() {
        return buyNum;
    }

    public void setBuyNum(int buyNum) {
        this.buyNum = buyNum;
    }

    public double getSubTotal() {
        return subTotal;
    }

    public void setSubTotal(double subTotal) {
        this.subTotal = subTotal;
    }

    @Override
    public String toString() {
        return "CartItem{" +
                "product=" + product +
                ", buyNum=" + buyNum +
                ", subTotal=" + subTotal +
                '}';
    }
}
