package com.huabei.weddingshop.entity;

import java.util.HashMap;
import java.util.Map;

//购物车
public class Cart {

    //购物车一对多关联购物车明细  key商品pid  value购物车明细
    private Map<String,CartItem> map = new HashMap<String,CartItem>();
    //总计
    private double total;

    public Cart() {
    }

    public Cart(Map<String, CartItem> map, double total) {
        this.map = map;
        this.total = total;
    }

    public Map<String, CartItem> getMap() {
        return map;
    }

    public void setMap(Map<String, CartItem> map) {
        this.map = map;
    }

    public double getTotal() {
        return total;
    }

    public void setTotal(double total) {
        this.total = total;
    }

    @Override
    public String toString() {
        return "Cart{" +
                "map=" + map +
                ", total=" + total +
                '}';
    }
}
