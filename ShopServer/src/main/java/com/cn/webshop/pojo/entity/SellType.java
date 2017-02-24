package com.cn.webshop.pojo.entity;

public class SellType {
    private Byte sellTypeId;

    private String name;

    public Byte getSellTypeId() {
        return sellTypeId;
    }

    public void setSellTypeId(Byte sellTypeId) {
        this.sellTypeId = sellTypeId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }
}