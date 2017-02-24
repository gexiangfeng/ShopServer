package com.cn.webshop.pojo.entity;

public class Warehouse {
    private Byte warehouseId;

    private String name;

    public Byte getWarehouseId() {
        return warehouseId;
    }

    public void setWarehouseId(Byte warehouseId) {
        this.warehouseId = warehouseId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }
}