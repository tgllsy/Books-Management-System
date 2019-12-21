package com.lgh.library.model;

import java.sql.Date;

public class User {

    private int id;
    private String username;
    private String password;
    private String gender;
    private String phone;
    private Date effectiveDate;
    private Date expirationDate;


    public User(int id, String username, String password, String gender, String phone, Date effectiveDate, Date expirationDate) {
        this.id = id;
        this.username = username;
        this.password = password;
        this.gender = gender;
        this.phone = phone;
        this.effectiveDate = effectiveDate;
        this.expirationDate = expirationDate;

    }

    public User(int id, String username, String gender, String phone, Date effectiveDate, Date expirationDate) {
        this.id = id;
        this.username = username;
        this.gender = gender;
        this.phone = phone;
        this.effectiveDate = effectiveDate;
        this.expirationDate = expirationDate;
    }

    public User() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public Date getEffectiveDate() {
        return effectiveDate;
    }

    public void setEffectiveDate(Date effectiveDate) {
        this.effectiveDate = effectiveDate;
    }

    public Date getExpirationDate() {
        return expirationDate;
    }

    public void setExpirationDate(Date expirationDate) {
        this.expirationDate = expirationDate;
    }

    @Override
    public String toString() {
        return "User{" +
                "id=" + id +
                ", username='" + username + '\'' +
                ", password='" + password + '\'' +
                ", gender='" + gender + '\'' +
                ", phone='" + phone + '\'' +
                ", effectiveDate=" + effectiveDate +
                ", expirationDate=" + expirationDate +
                '}';
    }
}
