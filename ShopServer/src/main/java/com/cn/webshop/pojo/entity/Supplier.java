package com.cn.webshop.pojo.entity;

public class Supplier {
    private Byte supplierId;

    private String name;

    public Byte getSupplierId() {
        return supplierId;
    }

    public void setSupplierId(Byte supplierId) {
        this.supplierId = supplierId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }
}