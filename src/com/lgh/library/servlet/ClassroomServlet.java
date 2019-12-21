package com.lgh.library.servlet;

import com.lgh.library.Dao.ClassRoomDao;
import com.lgh.library.model.ClassRoom;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "ClassroomServlet", urlPatterns = {"/admin/classroom"})
public class ClassroomServlet extends HttpServlet {
    ClassRoomDao classRoomDao = new ClassRoomDao();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


        response.setContentType("text/html;chaerset=UTF-8");
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");


        if ("add".equals(request.getParameter("action"))) {
            String room_id = request.getParameter("room_id");
            String class_name = request.getParameter("class_name");


            ClassRoom classRoom = new ClassRoom(room_id, class_name);

            int add = classRoomDao.insert(classRoom);
            if (add > 0) {
//                List<Book> list = bookDao.ShowAll();
//                request.setAttribute("list",list);
//                request.getRequestDispatcher("../manage/bookseach.jsp").forward(request,response);
                response.sendRedirect("room-list.jsp");

            } else {
                response.sendRedirect("room-list.jsp");
            }


        } else if ("update".equals(request.getParameter("action"))) {

            String room_id = request.getParameter("room_id");
            String class_name = request.getParameter("class_name");
            ClassRoom classRoom = new ClassRoom(room_id, class_name);
            int update = classRoomDao.Update(classRoom);
            if (update > 0) {

                response.sendRedirect("room-list.jsp");

//                response.sendRedirect("../manage/bookseach.jsp");
//                List<Book> list = bookDao.ShowAll();
//                request.setAttribute("list",list);
//                request.getRequestDispatcher("../manage/bookseach.jsp").forward(request,response);
            } else {
//                request.setAttribute("books", book);
//                request.getRequestDispatcher("../manage/update.jsp").forward(request, response);
//                response.sendRedirect("../manage/update.jsp");

                response.sendRedirect("room-list.jsp");

            }


        }

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


        response.setContentType("text/html;chaerset=UTF-8");
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");


        if ("delete".equals(request.getParameter("action"))) {


            System.out.println("aaaaaaaaaaaaaaaa");

            String id = request.getParameter("id");

            int delect = classRoomDao.delect(id);

            System.out.println("classssssssssssssssssssss");
            if (delect > 0) {
                response.sendRedirect("room-list.jsp ");

            }


        } else if ("toUpdate".equals(request.getParameter("action"))) {


            String id = request.getParameter("id");
            ClassRoom classRoom = classRoomDao.getID(id);
            request.setAttribute("room", classRoom);
            request.getRequestDispatcher("room-edit.jsp").forward(request, response);

        }


    }
}
