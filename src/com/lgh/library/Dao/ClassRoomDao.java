package com.lgh.library.Dao;

import com.lgh.library.db.Conn;
import com.lgh.library.model.ClassRoom;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ClassRoomDao {


    Conn conn = new Conn();


    public List<ClassRoom> ShowAll() {
        try {
            String sql = "select * from classroom";
            ResultSet resultSet = conn.Query(sql);
            List<ClassRoom> list = new ArrayList<>();
            while (resultSet.next()) {
                String room_id = resultSet.getString(1);
                String room_name = resultSet.getString(2);
                ClassRoom classRoom = new ClassRoom(room_id, room_name);
                list.add(classRoom);
            }
            conn.close();
            return list;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;

    }


    public int delect(String id) {

        String sql = "DELETE FROM classroom WHERE room_id LIKE '" + id + "' ESCAPE '#'";

        System.out.println(sql);
        int delect = conn.Upadte(sql);
        conn.close();
        return delect;

    }

    public int insert(ClassRoom classRoom) {

        String sql = "INSERT INTO classroom (room_id, class_name) VALUES ('" + classRoom.getRoom_id() + "', '" + classRoom.getClassName() + "')";
        int insert = conn.Upadte(sql);
        conn.close();
        return insert;

    }

    public int Update(ClassRoom classRoom) {


        String sql = "UPDATE classroom SET class_name = '" + classRoom.getClassName() + "' WHERE room_id LIKE '" + classRoom.getRoom_id() + "' ESCAPE '#'";
        int update = conn.Upadte(sql);
        conn.close();
        return update;

    }


    public ClassRoom getID(String id) {

        try {
            String sql = "select * from classroom where room_id='" + id + "'";

            ResultSet resultSet = conn.Query(sql);
            ClassRoom classRoom = null;
            while (resultSet.next()) {
                String room_id = resultSet.getString(1);
                String className = resultSet.getString(2);
                classRoom = new ClassRoom(room_id, className);
            }
            return classRoom;
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            conn.close();
        }

        return null;


    }

}
