package com.lgh.library;

import com.lgh.library.db.Conn;
import com.lgh.library.model.Main1;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class Count {


    Conn conn = new Conn();

    public String Sqlcount(String sql) {


        try {
            ResultSet Book_status_on = conn.Query(sql);
            while (Book_status_on.next()) {
                String a = Book_status_on.getString(1);

                return a;
            }
        } catch (SQLException e) {

            e.printStackTrace();

        } finally {
            conn.close();
        }

        return null;
    }


    public List<Main1> getmain1(String sql) {


        try {
            ResultSet resultSet = conn.Query(sql);
            List<Main1> list = new ArrayList<Main1>();

            while (resultSet.next()) {

                String id = resultSet.getString(1);
                String count = resultSet.getString(2);
                String name = resultSet.getString(3);
                Main1 main1 = new Main1(id, count, name);
                list.add(main1);
            }

            return list;

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            conn.close();
        }

        return null;
    }


}
