package com.lgh.library.servlet;

import com.lgh.library.Dao.BookDao;
import com.lgh.library.model.Book;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Date;
import java.util.List;

@WebServlet(name = "BooksServlet", urlPatterns = {"/admin/book"})


public class BooksServlet extends HttpServlet {

    BookDao bookDao = new BookDao();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        response.setContentType("text/html;chaerset=UTF-8");
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");

        if ("add".equals(request.getParameter("action"))) {
            String ISBN = request.getParameter("ISBN");
            String title = request.getParameter("title");
            String author = request.getParameter("author");
            String publisher = request.getParameter("publisher");
            String publicationDate = request.getParameter("publicationDate");
            String profile = request.getParameter("profile");
            String room = request.getParameter("room");
            Date publicationDate1 = Date.valueOf(publicationDate);
            Book book = new Book(ISBN, title, author, publisher, publicationDate1, profile, room);
            int add = bookDao.add_books(book);
            if (add > 0) {
//                List<Book> list = bookDao.ShowAll();
//                request.setAttribute("list",list);
//                request.getRequestDispatcher("../manage/bookseach.jsp").forward(request,response);
                response.sendRedirect("books-list.jsp");

            } else {
                response.sendRedirect("books-add.jsp");
            }
        } else if ("update".equals(request.getParameter("action"))) {

            String ISBN = request.getParameter("ISBN");
            String title = request.getParameter("title");
            String author = request.getParameter("author");
            String publisher = request.getParameter("publisher");
            String publicationDate = request.getParameter("publicationDate");
            String profile = request.getParameter("profile");
            String room = request.getParameter("room");
            Date publicationDate1 = Date.valueOf(publicationDate);
            Book book = new Book(ISBN, title, author, publisher, publicationDate1, profile, room);

            int update = bookDao.Update(book);
            if (update > 0) {

                response.sendRedirect("books-list.jsp");

//                response.sendRedirect("../manage/bookseach.jsp");
//                List<Book> list = bookDao.ShowAll();
//                request.setAttribute("list",list);
//                request.getRequestDispatcher("../manage/bookseach.jsp").forward(request,response);
            } else {
//                request.setAttribute("books", book);
//                request.getRequestDispatcher("../manage/update.jsp").forward(request, response);
//                response.sendRedirect("../manage/update.jsp");

                response.sendRedirect("books-list.jsp");

            }


        } else if ("serach".equals(request.getParameter("action"))) {

            String isbn = request.getParameter("isbn");
            String bookname = request.getParameter("bookname");
            String author = request.getParameter("author");
            String publisher = request.getParameter("publisher");
            String profile = request.getParameter("profile");
            String start_date = request.getParameter("start");
            String room = request.getParameter("room");
            String status = request.getParameter("status");


            if (isbn != null && isbn != "" || bookname != null && bookname != "" || author != null && author != "" ||
                    publisher != null && publisher != "" || profile != null && profile != "" || room != null && room != "" ||
                    status != null && status != "" || start_date != null && start_date != "") {

//                System.out.println(isbn+" "+bookname+"   "+author+publisher+profile+room);

//                System.out.println(start_date);
                Date date = null;
                if (start_date != null && start_date != "") {
                    date = Date.valueOf(start_date);
                }
                int st = 2;
                if (status != null && status != "") {
                    st = Integer.valueOf(status);

                }


//                System.out.println(date);
                Book book = new Book(isbn, bookname, author, publisher, date, profile, room, st);

                BookDao bookDao = new BookDao();
                List<Book> books = bookDao.serach_book(book);
                if (books.size() > 0) {
                    System.out.println("正常");
                    request.setAttribute("books", books);
                    request.getRequestDispatcher("books-list.jsp").forward(request, response);

                } else {
                    System.out.println("没查到书籍");

                    request.setAttribute("mags", "未查找到相关图书");
                    request.getRequestDispatcher("books-list.jsp").forward(request, response);

                }
            } else {

                System.out.println("没有条件");
                request.setAttribute("mags", "请输入相关信息");
                request.getRequestDispatcher("books-list.jsp").forward(request, response);

            }


        }


    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


        if ("toUpdate".equals(request.getParameter("action"))) {


            String id = request.getParameter("id");
            Book book = bookDao.getID(id);


            request.setAttribute("book", book);
            request.getRequestDispatcher("books-vi.jsp").forward(request, response);

        } else if ("delect".equals(request.getParameter("action"))) {

            String id = request.getParameter("id");
            int delect = bookDao.delect(id);

            if (delect > 0) {
                response.sendRedirect("books-list.jsp");
            }

        } else if ("jieyue".equals(request.getParameter("action"))) {

            String isbn = request.getParameter("isbn");

            Book book = bookDao.getID(isbn);
            request.setAttribute("book", book);
            request.getRequestDispatcher("borrow-jieyue.jsp").forward(request, response);

        }else if("tongji".equals(request.getParameter("action"))){

//            Count count = new Count();


//            SELECT  Book_isbn,COUNT(Book_isbn) ,books.title FROM borrow,books  where books.ISBN=borrow.Book_isbn GROUP BY Book_isbn ORDER BY  Book_isbn asc  LIMIT 0,4
//            String sqlmain2= "SELECT  users.userID,COUNT(*),users.username FROM borrow,users WHERE borrow.userid=users.userID GROUP BY userid";
//            List<Main1> lists2 = count.getmain1(sqlmain2);

        }





    }
}
