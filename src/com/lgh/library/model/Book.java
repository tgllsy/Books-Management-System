package com.lgh.library.model;

import java.sql.Date;

public class Book {
    private String ISBN;
    private String title;
    private String author;
    private String publisher;
    private Date publicationDate;
    private String profile;
    private String roomNmae;
    private int status;

    public Book(String ISBN, String title, String author, String publisher, Date publicationDate, String profile, String roomNmae, int status) {
        this.ISBN = ISBN;
        this.title = title;
        this.author = author;
        this.publisher = publisher;
        this.publicationDate = publicationDate;
        this.profile = profile;
        this.roomNmae = roomNmae;
        this.status = status;
    }

    public Book(String ISBN, String title, String author, String publisher, Date publicationDate, String profile, String roomNmae) {
        this.ISBN = ISBN;
        this.title = title;
        this.author = author;
        this.publisher = publisher;
        this.publicationDate = publicationDate;
        this.profile = profile;
        this.roomNmae = roomNmae;
    }

    public Book(String ISBN, String title, String author, String publisher, String profile, String roomNmae, int status) {
        this.ISBN = ISBN;
        this.title = title;
        this.author = author;
        this.publisher = publisher;
        this.profile = profile;
        this.roomNmae = roomNmae;
        this.status = status;
    }

    public Book(String ISBN, String title, String author, String publisher, String profile, String roomNmae) {
        this.ISBN = ISBN;
        this.title = title;
        this.author = author;
        this.publisher = publisher;
        this.profile = profile;
        this.roomNmae = roomNmae;
    }

    public Book(String ISBN, String title) {
        this.ISBN = ISBN;
        this.title = title;
    }

    public String getISBN() {
        return ISBN;
    }

    public void setISBN(String ISBN) {
        this.ISBN = ISBN;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public String getPublisher() {
        return publisher;
    }

    public void setPublisher(String publisher) {
        this.publisher = publisher;
    }

    public Date getPublicationDate() {
        return publicationDate;
    }

    public void setPublicationDate(Date publicationDate) {
        this.publicationDate = publicationDate;
    }

    public String getProfile() {
        return profile;
    }

    public void setProfile(String profile) {
        this.profile = profile;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public String getRoomNmae() {
        return roomNmae;
    }

    public void setRoomNmae(String roomNmae) {
        this.roomNmae = roomNmae;
    }
}
