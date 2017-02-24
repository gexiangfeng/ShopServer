package com.cn.webshop.pojo.entity;

public class Brand {
    private Byte brandId;

    private String name;

    public Byte getBrandId() {
        return brandId;
    }

    public void setBrandId(Byte brandId) {
        this.brandId = brandId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }
}