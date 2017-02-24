package com.cn.webshop.pojo.entity;

public class ProductStyle {
    private Byte productStyleId;

    private String name;

    public Byte getProductStyleId() {
        return productStyleId;
    }

    public void setProductStyleId(Byte productStyleId) {
        this.productStyleId = productStyleId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }
}