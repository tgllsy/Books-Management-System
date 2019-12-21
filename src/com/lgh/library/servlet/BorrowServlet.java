package com.lgh.library.servlet;

import com.lgh.library.Dao.BookDao;
import com.lgh.library.Dao.BorrowDao;
import com.lgh.library.model.Borrow;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "BorrowServlet", urlPatterns = {"/admin/borrow"})
public class BorrowServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        response.setContentType("text/html;chaerset=UTF-8");
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");


        if ("add".equals(request.getParameter("action"))) {

            String user = request.getParameter("userid");
            String isbn = request.getParameter("isbn");

            int userid = Integer.valueOf(user);
            Borrow borrow = new Borrow(userid, isbn);
            //借阅
            BorrowDao borrowDao = new BorrowDao();
            int add = borrowDao.add(borrow);


            //图书状态改变
            BookDao bookDao = new BookDao();
            int s = 1;
            bookDao.bookStatus(s, isbn);


            if (add > 0) {
                System.out.println("借阅成功成功");
                request.getRequestDispatcher("borrow-list.jsp").forward(request, response);
            } else {
                System.out.println("借阅失败");
                response.sendRedirect("borrow-list.jsp");
            }
        }


    }


    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


        if ("remand".equals(request.getParameter("action"))) {
//            String userId= request.getParameter("userid");

            String id = request.getParameter("id");
            String isbn = request.getParameter("isbn");
            int uid = Integer.valueOf(id);


            Borrow borrow = new Borrow(uid);

            System.out.println(borrow.getBorrow_id());
            BorrowDao borrowDao = new BorrowDao();
            int remand = borrowDao.remand(borrow);

            //图书状态改变
            BookDao bookDao = new BookDao();
            int s = 0;
            bookDao.bookStatus(s, isbn);

            if (remand > 0) {
                System.out.println("归还成功");
//                response.sendRedirect("borrow-list.jsp");

                request.getRequestDispatcher("borrow-list.jsp").forward(request, response);
            } else {
                System.out.println("归还失败");
                response.sendRedirect("borrow-list.jsp");
            }
        }


    }
}
