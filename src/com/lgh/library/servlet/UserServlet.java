package com.lgh.library.servlet;

import com.lgh.library.Dao.BookDao;
import com.lgh.library.Dao.UserDao;
import com.lgh.library.model.Book;
import com.lgh.library.model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.util.List;

@WebServlet(name = "UserServlet", urlPatterns = {"/users"})
public class UserServlet extends HttpServlet {

    UserDao userDao = new UserDao();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        response.setContentType("text/html;chaerset=UTF-8");
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");


        PrintWriter out = response.getWriter();


        //前台部分

        if ("serach".equals(request.getParameter("action"))) {

            String isbn = request.getParameter("isbn");
            String bookname = request.getParameter("bookname");

            if (isbn != null && isbn != "" || bookname != null && bookname != "") {

                BookDao bookDao = new BookDao();
                Book book = new Book(isbn, bookname);
//                List<Book> books = bookDao.serach_book(isbn, bookname);
                List<Book> books = bookDao.serach_book(book);

                if (books.size() > 0) {
                    System.out.println(books);
                    request.setAttribute("books", books);
                    request.getRequestDispatcher("serach_book.jsp").forward(request, response);

                } else {

                    request.setAttribute("mags", "未查找到相关图书");
                    request.getRequestDispatcher("serach_book.jsp").forward(request, response);

                }
            } else {
                request.setAttribute("mags", "请输入相关信息");

                request.getRequestDispatcher("serach_book.jsp").forward(request, response);

            }


        }


        //后台部分

        //添加用户
        if ("user_add".equals(request.getParameter("action"))) {

            String id = request.getParameter("userid");

            int sid = Integer.valueOf(id);

            String username = request.getParameter("username");

            String password = request.getParameter("password");
            String gender = request.getParameter("sex");
            String phone = request.getParameter("phone");
            String effectiveDate = request.getParameter("effectiveDate");
            String expirationDate = request.getParameter("expirationDate");
            Date efferct = Date.valueOf(effectiveDate);
            Date expirat = Date.valueOf(expirationDate);
            User user = new User(sid, username, password, gender, phone, efferct, expirat);
            System.out.println("user_add");
            System.out.println(user);

            int insert = userDao.insert(user);
            if (insert > 0) {
                response.sendRedirect("./admin/users-list.jsp ");
            }

        } else if ("user_update".equals(request.getParameter("action"))) {


            System.out.println("update_user");

            String type= request.getParameter("type");


            String userid = request.getParameter("userid");
            int sid = Integer.valueOf(userid);
            String username = request.getParameter("username");
            String gender = request.getParameter("sex");
            String phone = request.getParameter("phone");
            String effectiveDate = request.getParameter("effectiveDate");
            String expirationDate = request.getParameter("expirationDate");
            Date efferct = Date.valueOf(effectiveDate);
            Date expirat = Date.valueOf(expirationDate);

            User user = new User(sid, username, gender, phone, efferct, expirat);
            int update = userDao.Update_info(user);
            System.out.println(user);
            System.out.println(update);

            if (update > 0) {
                if ("user".equals(type)){
                    response.sendRedirect("./users.jsp ");
                }else if ("admin".equals(type)){

                    response.sendRedirect("./admin/users-list.jsp ");
                }

            }


        } else if ("user_repassword".equals(request.getParameter("action"))) {


            String userid = request.getParameter("userid");
            System.out.println(userid);
            int sid = Integer.valueOf(userid);
            String oldpass = request.getParameter("oldpass");
            String newpass = request.getParameter("newpass");
            String repass = request.getParameter("repass");

            User user = userDao.getID(sid);

            // 判断密码是否正确
            if (oldpass.equals(user.getPassword())) {
                if (newpass.equals(repass)) {

                    userDao.update_password(user, newpass);
                    response.sendRedirect("./admin/users-list.jsp ");

                } else {
                    request.setAttribute("user", user);
                    request.setAttribute("mags", "两次密码不一致");
                    request.getRequestDispatcher("admin/users-password.jsp").forward(request, response);
                }
            } else {
                request.setAttribute("user", user);
                request.setAttribute("mags", "原密码不正确");
                request.getRequestDispatcher("admin/users-password.jsp").forward(request, response);
            }


        }


    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        if ("delete".equals(request.getParameter("action"))) {
            String id = request.getParameter("id");
            int delect = userDao.delect(id);
            if (delect > 0) {
                response.sendRedirect("./admin/users-list.jsp ");
            }
        } else if ("to_update".equals(request.getParameter("action"))) {


            String id = request.getParameter("id");
            int sid = Integer.valueOf(id);
            User user = userDao.getID(sid);
            request.setAttribute("user", user);
            request.getRequestDispatcher("./admin/users-edit.jsp").forward(request, response);

        } else if ("to_repassword".equals(request.getParameter("action"))) {


            String id = request.getParameter("id");
            int sid = Integer.valueOf(id);
            User user = userDao.getID(sid);
            request.setAttribute("user", user);
            request.getRequestDispatcher("./admin/users-password.jsp").forward(request, response);

        }


    }
}
