package com.cn.webshop.pojo.entity;

import java.util.Date;

public class User {
    private Integer userId;

    private String name;

    private String employer;

    private String mobile;

    private String address;

    private String email;

    private String idcard;

    private String sex;

    private Date birthday;

    private Integer regionProvinceId;

    private Integer regionCityId;

    private Integer regionCountryId;

    private String telephone;

    private String postCode;

    private String incomeMonth;

    private String job;

    private String hobby;

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public String getEmployer() {
        return employer;
    }

    public void setEmployer(String employer) {
        this.employer = employer == null ? null : employer.trim();
    }

    public String getMobile() {
        return mobile;
    }

    public void setMobile(String mobile) {
        this.mobile = mobile == null ? null : mobile.trim();
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address == null ? null : address.trim();
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email == null ? null : email.trim();
    }

    public String getIdcard() {
        return idcard;
    }

    public void setIdcard(String idcard) {
        this.idcard = idcard == null ? null : idcard.trim();
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex == null ? null : sex.trim();
    }

    public Date getBirthday() {
        return birthday;
    }

    public void setBirthday(Date birthday) {
        this.birthday = birthday;
    }

    public Integer getRegionProvinceId() {
        return regionProvinceId;
    }

    public void setRegionProvinceId(Integer regionProvinceId) {
        this.regionProvinceId = regionProvinceId;
    }

    public Integer getRegionCityId() {
        return regionCityId;
    }

    public void setRegionCityId(Integer regionCityId) {
        this.regionCityId = regionCityId;
    }

    public Integer getRegionCountryId() {
        return regionCountryId;
    }

    public void setRegionCountryId(Integer regionCountryId) {
        this.regionCountryId = regionCountryId;
    }

    public String getTelephone() {
        return telephone;
    }

    public void setTelephone(String telephone) {
        this.telephone = telephone == null ? null : telephone.trim();
    }

    public String getPostCode() {
        return postCode;
    }

    public void setPostCode(String postCode) {
        this.postCode = postCode == null ? null : postCode.trim();
    }

    public String getIncomeMonth() {
        return incomeMonth;
    }

    public void setIncomeMonth(String incomeMonth) {
        this.incomeMonth = incomeMonth == null ? null : incomeMonth.trim();
    }

    public String getJob() {
        return job;
    }

    public void setJob(String job) {
        this.job = job == null ? null : job.trim();
    }

    public String getHobby() {
        return hobby;
    }

    public void setHobby(String hobby) {
        this.hobby = hobby == null ? null : hobby.trim();
    }
}