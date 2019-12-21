package com.lgh.library.Dao;

import com.lgh.library.db.Conn;
import com.lgh.library.model.User;

import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class UserDao {

    private Conn conn = new Conn();


    //登录
    public User login(int userid, String password) throws SQLException {

        String sql = "select * from users where userID='" + userid + "' and password='" + password + "'";
        ResultSet resultSet = conn.Query(sql);
        User user = null;

        while (resultSet.next()) {
            user = new User();
            user.setId(resultSet.getInt(1));
            user.setUsername(resultSet.getString(2));
            user.setPassword(resultSet.getString(3));
        }

        conn.close();
        return user;
    }

    //查询所有

    public List<User> ShowAll() {
        try {
            String sql = "select * from users";
            ResultSet resultSet = conn.Query(sql);
            List<User> list = new ArrayList<>();
            while (resultSet.next()) {
                int id = resultSet.getInt(1);
                String username = resultSet.getString(2);
                String password = resultSet.getString(3);
                String gender = resultSet.getString(4);
                String phone = resultSet.getString(5);
                Date effectiveDate = resultSet.getDate(6);
                Date expirationDate = resultSet.getDate(7);
                User user = new User(id, username, password, gender, phone, effectiveDate, expirationDate);
                list.add(user);

            }
            return list;
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            conn.close();
        }

        return null;
    }

    //添加
    public int insert(User user) {
        String sql = "INSERT INTO users(`userID`,`username`, `password`, `gender`, `phone`, `effectiveDate`, `expirationDate`) VALUES ('" + user.getId() + "','" + user.getUsername() + "', '" + user.getPassword() + "', '" + user.getGender() + "', '" + user.getPhone() + "', '" + user.getEffectiveDate() + "', '" + user
                .getExpirationDate() + "')";
        int insert = conn.Upadte(sql);
        System.out.println(sql);
        conn.close();
        return insert;

    }

//    查询单个


    public User getID(int sid) {

        try {
            String sql = "select * from users where userID='" + sid + "'";

            ResultSet resultSet = conn.Query(sql);
            User user = null;

            while (resultSet.next()) {
                int id = resultSet.getInt(1);
                String username = resultSet.getString(2);
                String password = resultSet.getString(3);
                String gender = resultSet.getString(4);
                String phone = resultSet.getString(5);
                Date effectiveDate = resultSet.getDate(6);
                Date expirationDate = resultSet.getDate(7);
                user = new User(id, username, password, gender, phone, effectiveDate, expirationDate);


            }
            return user;
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            conn.close();
        }
        return null;
    }


    public int Update_info(User user) {

        String sql = "UPDATE users SET username = '" + user.getUsername() + "', gender= '" + user.getGender() + "', phone = '" + user.getPhone() + "', effectiveDate = '" + user.getEffectiveDate() + "', expirationDate = '" + user.getExpirationDate() + "' WHERE userID = '" + user.getId() + "'";
        int update = conn.Upadte(sql);
        System.out.println(sql);
        conn.close();
        return update;

    }


    public int update_password(User user, String password) {

        String sql = "UPDATE users SET password = '" + password + "' WHERE userID = " + user.getId();
        int update = conn.Upadte(sql);
        System.out.println(sql);
        conn.close();
        return update;
    }

    //删除
    public int delect(String id) {

        String sql = "DELETE FROM  users WHERE userID='" + id + "'";

        System.out.println(sql);
        int delect = conn.Upadte(sql);
        conn.close();
        return delect;

    }


}




