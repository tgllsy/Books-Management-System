package com.lgh.library.servlet;

import com.lgh.library.Dao.AdminDao;
import com.lgh.library.Dao.UserDao;
import com.lgh.library.model.Admin;
import com.lgh.library.model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "LoginServlet", urlPatterns = {"/admin/login"})
public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        AdminDao adminDao = new AdminDao();
        UserDao userDao = new UserDao();
        //后台登录认证
        if ("adminlogin".equals(request.getParameter("action"))) {
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            try {
                Admin admin = adminDao.login(username, password);
                if (admin != null) {
                    HttpSession session = request.getSession();
                    session.setAttribute("admin", admin);
                    response.sendRedirect("index.jsp");

//                        request.getRequestDispatcher("index.jsp").forward(request,response);
                } else {
                    response.sendRedirect("login.jsp");
                }

            } catch (SQLException e) {
                System.out.printf(e.getMessage());
            }
        } else if ("userlogin".equals(request.getParameter("action"))) {
            try {
                int userid = Integer.valueOf(request.getParameter("userid"));
                String password = request.getParameter("password");
//            System.out.println(userid + "   " + password);

                User user = userDao.login(userid, password);

                if (user != null) {
                    HttpSession session = request.getSession();
                    session.setAttribute("admin", user);
                    response.sendRedirect("../index.jsp");
//                    System.out.println("前台登录");
//                        request.getRequestDispatcher("index.jsp").forward(request,response);
                } else {
                    request.setAttribute("mags", "登录失败");
                    response.sendRedirect("../login.jsp");
//                    request.getRequestDispatcher("../login.jsp").forward(request,response);
                }
            } catch (SQLException e) {
                System.out.printf(e.getMessage());
            } catch (NumberFormatException e) {
//                System.out.println("asdaaaaaaaaaaaaaaa");
//                request.setAttribute("mags","登录失败");
                response.sendRedirect("../login.jsp");
//                request.getRequestDispatcher("../login.jsp").forward(request,response);
            }
        }


    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        if ("signout".equals(request.getParameter("action"))) {


            HttpSession session = request.getSession();
//            System.out.println(session.getId());
            session.invalidate();
            response.sendRedirect("../login.jsp");


        }


    }
}
