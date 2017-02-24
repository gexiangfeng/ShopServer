package com.cn.webshop.pojo.entity;

public class Shop {
    private Byte shopId;

    private String name;

    public Byte getShopId() {
        return shopId;
    }

    public void setShopId(Byte shopId) {
        this.shopId = shopId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }
}