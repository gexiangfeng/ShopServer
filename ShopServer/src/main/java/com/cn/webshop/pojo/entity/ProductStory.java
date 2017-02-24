package com.cn.webshop.pojo.entity;

public class ProductStory {
    private Byte productStoryId;

    private String name;

    public Byte getProductStoryId() {
        return productStoryId;
    }

    public void setProductStoryId(Byte productStoryId) {
        this.productStoryId = productStoryId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }
}