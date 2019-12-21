package com.lgh.library.Dao;

import com.lgh.library.db.Conn;
import com.lgh.library.model.Book;

import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class BookDao {

    public final static String SQLS = "select * from books ";
    Conn conn = new Conn();

    //查询所有
    public List<Book> ShowAll() {
        try {
            String sql = "select * from books";
            System.out.println(sql);
//            String sql = SQLS + s;
            ResultSet resultSet = conn.Query(sql);
            List<Book> list = new ArrayList<>();
            while (resultSet.next()) {
                String ISBN = resultSet.getString(1);
                String title = resultSet.getString(2);
                String author = resultSet.getString(3);
                String publisher = resultSet.getString(4);
                Date publicationDate = resultSet.getDate(5);
                String profile = resultSet.getString(6);
                String roomName = resultSet.getString(7);
                int status = resultSet.getInt(8);
                Book book = new Book(ISBN, title, author, publisher, publicationDate, profile, roomName, status);
                list.add(book);
            }
            conn.close();
            return list;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;

    }

    public List<Book> ShowAll(String s) {
        try {
//            String sql = "select * from books";
            String sql = SQLS + s;
            ResultSet resultSet = conn.Query(sql);
            List<Book> list = new ArrayList<>();
            while (resultSet.next()) {
                String ISBN = resultSet.getString(1);
                String title = resultSet.getString(2);
                String author = resultSet.getString(3);
                String publisher = resultSet.getString(4);
                Date publicationDate = resultSet.getDate(5);
                String profile = resultSet.getString(6);
                String roomName = resultSet.getString(7);
                int status = resultSet.getInt(8);
                Book book = new Book(ISBN, title, author, publisher, publicationDate, profile, roomName, status);
                list.add(book);

            }
            conn.close();
            return list;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }


    //条件查询
    public List<Book> serach_book(Book book) {

        try {
            StringBuffer sql = new StringBuffer("select * from books where 1=1");

            String ISBN = book.getISBN();
            if (ISBN != null && !ISBN.trim().isEmpty()) {

                sql.append(" and ISBN like '%" + ISBN + "%'");
            }

            String title = book.getTitle();
            if (title != null && !title.trim().isEmpty()) {

                sql.append(" and title like '%" + title + "%'");
            }

            String author = book.getAuthor();
            if (author != null && !author.trim().isEmpty()) {

                sql.append(" and author like '%" + author + "%'");
            }

            String publisher = book.getPublisher();
            if (publisher != null && !publisher.trim().isEmpty()) {

                sql.append(" and publisher like '%" + publisher + "%'");
            }


            String publicationDate = String.valueOf(book.getPublicationDate());
            if (publicationDate != null && !publicationDate.trim().isEmpty() && publicationDate != "null") {

                sql.append(" and publicationDate like '%" + publicationDate + "%'");
            }

            String profile = book.getProfile();
            if (profile != null && !profile.trim().isEmpty()) {

                sql.append(" and profile like '%" + profile + "%'");
            }


            String roomName = book.getRoomNmae();
            if (roomName != null && !roomName.trim().isEmpty()) {

                sql.append(" and room like '%" + roomName + "%'");
            }


            String status = String.valueOf(book.getStatus());
            if (status != null && !status.trim().isEmpty() && !"2".equals(status)) {

                sql.append(" and status like '%" + status + "%'");
            }

//            System.out.println("重构版本sql：" + sql.toString());


            ResultSet resultSet = conn.Query(sql.toString());

            List<Book> list = new ArrayList<>();
            while (resultSet.next()) {
                String ISBNs = resultSet.getString(1);
                String titles = resultSet.getString(2);
                String authors = resultSet.getString(3);
                String publishers = resultSet.getString(4);
                Date publicationDates = resultSet.getDate(5);
                String profiles = resultSet.getString(6);
                String roomNames = resultSet.getString(7);
                int statuss = resultSet.getInt(8);
                Book bookall = new Book(ISBNs, titles, authors, publishers, publicationDates, profiles, roomNames, statuss);
                list.add(bookall);
            }
            return list;
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            conn.close();
        }
        return null;
    }


    //查询单个

    public Book getID(String id) {

        try {
            String sql = "select * from books where ISBN='" + id + "'";

            ResultSet resultSet = conn.Query(sql);
            Book book = null;
            while (resultSet.next()) {
                String ISBN = resultSet.getString(1);
                String title = resultSet.getString(2);
                String author = resultSet.getString(3);
                String publisher = resultSet.getString(4);
                Date publicationDate = resultSet.getDate(5);
                String profile = resultSet.getString(6);
                String roomName = resultSet.getString(7);
                int status = resultSet.getInt(8);
                book = new Book(ISBN, title, author, publisher, publicationDate, profile, roomName, status);
            }
            conn.close();
            return book;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;


    }


    //    添加
    public int add_books(Book book) {

        String sql = "INSERT INTO books (ISBN, title, author, publisher, publicationDate, profile,room, status) VALUES ('" + book.getISBN() + "', '" + book.getTitle() + "', '" + book.getAuthor() + "', '" + book.getPublisher() + "', '" + book.getPublicationDate() + "', '" + book.getProfile() + "','" + book.getRoomNmae() + "','0')";
        int update = conn.Upadte(sql);
        conn.close();
        return update;
    }


//    修改


    public int Update(Book book) {

        String sql =
                "update books set title='" + book.getTitle() + "',author='" + book.getAuthor() + "',publisher='" + book.getPublisher() + "',publicationDate='" + book.getPublicationDate() + "',profile='" + book.getProfile() + "',room='" + book.getRoomNmae() + "' where ISBN='" + book.getISBN() + "'";
//         "update books set title='"+book.getTitle()+"',author='"+book.getAuthor()+"',publisher='"+book.getPublisher()+"',publicationDate='"+book.getPublicationDate()+"',profile='"+book.getProfile()+"',status='"+book.getStatus()+"'  where ISBN='"+book.getISBN()+"'";
        int update = conn.Upadte(sql);
        conn.close();
        return update;

    }

    //删除
    public int delect(String id) {
        String sql = "DELETE FROM  books WHERE ISBN='" + id + "'";
        int delect = conn.Upadte(sql);
        conn.close();
        return delect;
    }

    // 书籍状态
    public int bookStatus(int status, String isbn) {

        String sql = "UPDATE books  SET status = '" + status + "' WHERE ISBN LIKE '" + isbn + "' ESCAPE '#'";
        int update = conn.Upadte(sql);
        conn.close();
        return update;

    }


}
