package com.lgh.library.model;

public class Admin {
    private int id;
    private String name;
    private String password;
    private String gender;
    private String phone;
    private String home;


    public Admin(int id, String name, String password, String gender, String phone, String home) {
        this.id = id;
        this.name = name;
        this.password = password;
        this.gender = gender;
        this.phone = phone;
        this.home = home;
    }

    public Admin() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
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

    public String getHome() {
        return home;
    }

    public void setHome(String home) {
        this.home = home;
    }

    @Override
    public String toString() {
        return "Admin{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", password='" + password + '\'' +
                ", gender='" + gender + '\'' +
                ", phone='" + phone + '\'' +
                ", home='" + home + '\'' +
                '}';
    }

}
