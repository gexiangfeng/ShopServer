package com.cn.webshop.pojo.entity;

import java.util.Date;

public class Product {
    private Integer productId;

    private String name;

    private String no;

    private String year;

    private String season;

    private String sex;

    private String keywords;

    private Byte productTypeId;

    private Byte sellTypeId;

    private Byte isAlive;

    private Byte brandId;

    private Short categoryId;

    private Byte shopId;

    private Byte warehouseId;

    private Byte supplierId;

    private Byte productStyleId;

    private Byte productStoryId;

    private Date addTime;

    private Integer modifyAdminId;

    private Date modifyTime;

    public Integer getProductId() {
        return productId;
    }

    public void setProductId(Integer productId) {
        this.productId = productId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public String getNo() {
        return no;
    }

    public void setNo(String no) {
        this.no = no == null ? null : no.trim();
    }

    public String getYear() {
        return year;
    }

    public void setYear(String year) {
        this.year = year == null ? null : year.trim();
    }

    public String getSeason() {
        return season;
    }

    public void setSeason(String season) {
        this.season = season == null ? null : season.trim();
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex == null ? null : sex.trim();
    }

    public String getKeywords() {
        return keywords;
    }

    public void setKeywords(String keywords) {
        this.keywords = keywords == null ? null : keywords.trim();
    }

    public Byte getProductTypeId() {
        return productTypeId;
    }

    public void setProductTypeId(Byte productTypeId) {
        this.productTypeId = productTypeId;
    }

    public Byte getSellTypeId() {
        return sellTypeId;
    }

    public void setSellTypeId(Byte sellTypeId) {
        this.sellTypeId = sellTypeId;
    }

    public Byte getIsAlive() {
        return isAlive;
    }

    public void setIsAlive(Byte isAlive) {
        this.isAlive = isAlive;
    }

    public Byte getBrandId() {
        return brandId;
    }

    public void setBrandId(Byte brandId) {
        this.brandId = brandId;
    }

    public Short getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(Short categoryId) {
        this.categoryId = categoryId;
    }

    public Byte getShopId() {
        return shopId;
    }

    public void setShopId(Byte shopId) {
        this.shopId = shopId;
    }

    public Byte getWarehouseId() {
        return warehouseId;
    }

    public void setWarehouseId(Byte warehouseId) {
        this.warehouseId = warehouseId;
    }

    public Byte getSupplierId() {
        return supplierId;
    }

    public void setSupplierId(Byte supplierId) {
        this.supplierId = supplierId;
    }

    public Byte getProductStyleId() {
        return productStyleId;
    }

    public void setProductStyleId(Byte productStyleId) {
        this.productStyleId = productStyleId;
    }

    public Byte getProductStoryId() {
        return productStoryId;
    }

    public void setProductStoryId(Byte productStoryId) {
        this.productStoryId = productStoryId;
    }

    public Date getAddTime() {
        return addTime;
    }

    public void setAddTime(Date addTime) {
        this.addTime = addTime;
    }

    public Integer getModifyAdminId() {
        return modifyAdminId;
    }

    public void setModifyAdminId(Integer modifyAdminId) {
        this.modifyAdminId = modifyAdminId;
    }

    public Date getModifyTime() {
        return modifyTime;
    }

    public void setModifyTime(Date modifyTime) {
        this.modifyTime = modifyTime;
    }
}