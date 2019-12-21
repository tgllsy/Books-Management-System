package com.lgh.library.Dao;

import com.lgh.library.db.Conn;
import com.lgh.library.model.Admin;

import java.sql.ResultSet;
import java.sql.SQLException;

public class AdminDao {

    private Conn conn = new Conn();

    public Admin login(String name, String password) throws SQLException {

        String sql = "select * from admin where name='" + name + "' and password='" + password + "'";
        ResultSet resultSet = conn.Query(sql);
        Admin admininfo = null;


        while (resultSet.next()) {
            admininfo = new Admin();
            admininfo.setId(resultSet.getInt(1));
            admininfo.setName(resultSet.getString(2));
            admininfo.setPassword(resultSet.getString(3));
        }

        conn.close();
        return admininfo;
    }


}
