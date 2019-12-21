package com.lgh.library.model;

import java.sql.Date;

public class Borrow {
    private int borrow_id;
    private int UserID;
    private String ISBN;
    private Date borrowingDate;
    private Date returnDate;
    private Date dueDate;
    private int renew_status;
    private int borrow_status;

    public Borrow(int borrow_id) {
        this.borrow_id = borrow_id;
    }

    public Borrow(int userID, String ISBN) {
        UserID = userID;
        this.ISBN = ISBN;
    }

    public Borrow(int borrow_id, int userID, String ISBN, Date borrowingDate, Date returnDate, Date dueDate, int renew_status, int borrow_status) {
        this.borrow_id = borrow_id;
        UserID = userID;
        this.ISBN = ISBN;
        this.borrowingDate = borrowingDate;
        this.returnDate = returnDate;
        this.dueDate = dueDate;
        this.renew_status = renew_status;
        this.borrow_status = borrow_status;
    }

    public int getBorrow_id() {
        return borrow_id;
    }

    public void setBorrow_id(int borrow_id) {
        this.borrow_id = borrow_id;
    }

    public int getUserID() {
        return UserID;
    }

    public void setUserID(int userID) {
        UserID = userID;
    }

    public String getISBN() {
        return ISBN;
    }

    public void setISBN(String ISBN) {
        this.ISBN = ISBN;
    }

    public Date getBorrowingDate() {
        return borrowingDate;
    }

    public void setBorrowingDate(Date borrowingDate) {
        this.borrowingDate = borrowingDate;
    }

    public Date getReturnDate() {
        return returnDate;
    }

    public void setReturnDate(Date returnDate) {
        this.returnDate = returnDate;
    }

    public Date getDueDate() {
        return dueDate;
    }

    public void setDueDate(Date dueDate) {
        this.dueDate = dueDate;
    }

    public int getRenew_status() {
        return renew_status;
    }

    public void setRenew_status(int renew_status) {
        this.renew_status = renew_status;
    }

    public int getBorrow_status() {
        return borrow_status;
    }

    public void setBorrow_status(int borrow_status) {
        this.borrow_status = borrow_status;
    }
}
