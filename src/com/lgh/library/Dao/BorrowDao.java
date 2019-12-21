package com.lgh.library.Dao;

import com.lgh.library.db.Conn;
import com.lgh.library.model.Borrow;

import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

public class BorrowDao {

//    public final static String SQL = "select * from borrow ";

    Conn conn = new Conn();

    //查询所有
    public List<Borrow> ShowAll() {
        try {
            String sql = "select * from borrow order by borrow_id desc";
//            String sql  =SQL+s;

            ResultSet resultSet = conn.Query(sql);
            List<Borrow> list = new ArrayList<>();
            while (resultSet.next()) {
                int borrow_id = resultSet.getInt(1);
                int UserID = resultSet.getInt(2);
                String ISBN = resultSet.getString(3);
                Date borrowingDate = resultSet.getDate(4);
                Date returnDate = resultSet.getDate(5);
                Date dueDate = resultSet.getDate(6);
                int renew_status = resultSet.getInt(7);
                int borrow_status = resultSet.getInt(8);
                Borrow borrow = new Borrow(borrow_id, UserID, ISBN, borrowingDate, returnDate, dueDate, renew_status, borrow_status);
                list.add(borrow);
            }
            conn.close();
            return list;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public List<Borrow> show_user(int user_id) {
        try {
            String sql = "select * from borrow where userid='" + user_id + "'";
            ResultSet resultSet = conn.Query(sql);
            List<Borrow> list = new ArrayList<>();
            while (resultSet.next()) {
                int borrow_id = resultSet.getInt(1);
                int UserID = resultSet.getInt(2);
                String ISBN = resultSet.getString(3);
                Date borrowingDate = resultSet.getDate(4);
                Date returnDate = resultSet.getDate(5);
                Date dueDate = resultSet.getDate(6);
                int renew_status = resultSet.getInt(7);
                int borrow_status = resultSet.getInt(8);
                Borrow borrow = new Borrow(borrow_id, UserID, ISBN, borrowingDate, returnDate, dueDate, renew_status, borrow_status);
                list.add(borrow);
            }
            conn.close();
            return list;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }


    public int remand(Borrow borrow) {

        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
        String sql = "UPDATE borrow SET returnDate = '" + df.format(new java.util.Date()) + "', borrow_status = '3' WHERE borrow_id = " + borrow.getBorrow_id();
        System.out.println(sql);
        int update = conn.Upadte(sql);
        conn.close();
        return update;

    }


    public int add(Borrow borrow) {

        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
        java.util.Date now = new java.util.Date();
        // 计算某一月份的最大天数  
        Calendar cal = Calendar.getInstance();
        // Date转化为Calendar  
        cal.setTime(now);
        // 一月后的1天前 
        cal.add(Calendar.DAY_OF_MONTH, 30);
//        System.out.println(df.format(now));//当前时间
//        System.out.println(df.format(cal.getTime()));//一个月后的时间

        String sql = "INSERT INTO borrow (userid, Book_isbn, borrowingDate, returnDate, dueDate, renew_status, borrow_status)VALUES (" +
                borrow.getUserID() + ", '" +
                borrow.getISBN() + "', '" +
                df.format(now) + "', null, '" +
                df.format(cal.getTime()) + "', DEFAULT, '1')";
        System.out.println(sql);
        int update = conn.Upadte(sql);
        conn.close();
        return update;

    }


}
