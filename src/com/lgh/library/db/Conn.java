package com.lgh.library.db;

//连接数据库


import java.sql.*;

public class Conn {

    private static final String DRIVER_NAME = "com.mysql.jdbc.Driver";
    private static final String URL = "jdbc:mysql://127.0.0.1:3306/library?useUnicode=true&characterEncoding=UTF-8";
    private static final String USERNAME = "root";
    private static final String PASSWIRD = "123456";
    private Connection connection = null;
    private Statement statement = null;
    private ResultSet resultSet = null;


    public Conn() {
        try {
            Class.forName(DRIVER_NAME);
        } catch (ClassNotFoundException e) {
            System.out.printf(e.getMessage());
        }
    }

    //查询
    public ResultSet Query(String sql1) {
        try {
            connection = DriverManager.getConnection(URL, USERNAME, PASSWIRD);
            statement = connection.createStatement();
            resultSet = statement.executeQuery(sql1);


        } catch (SQLException e) {
            System.out.printf(e.getMessage());
        }

        return resultSet;
    }

    //修改
    public int Upadte(String sql) {
        int result = 0;
        try {
            connection = DriverManager.getConnection(URL, USERNAME, PASSWIRD);
            statement = connection.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
            result = statement.executeUpdate(sql);

        } catch (SQLException e) {
            System.out.printf(e.getMessage());
        }

        return result;

    }


    public void close() {
        if (resultSet != null)
            try {
                resultSet.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        if (statement != null)
            try {
                statement.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        if (connection != null)
            try {
                connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
    }

}
