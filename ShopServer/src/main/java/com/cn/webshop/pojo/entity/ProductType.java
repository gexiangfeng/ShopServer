package com.cn.webshop.pojo.entity;

public class ProductType {
    private Byte productTypeId;

    private String name;

    public Byte getProductTypeId() {
        return productTypeId;
    }

    public void setProductTypeId(Byte productTypeId) {
        this.productTypeId = productTypeId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }
}