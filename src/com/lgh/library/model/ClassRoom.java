package com.lgh.library.model;

public class ClassRoom {

    private String room_id;
    private String className;


    public ClassRoom(String room_id, String className) {
        this.room_id = room_id;
        this.className = className;
    }

    public String getRoom_id() {
        return room_id;
    }

    public void setRoom_id(String room_id) {
        this.room_id = room_id;
    }

    public String getClassName() {
        return className;
    }

    public void setClassName(String className) {
        this.className = className;
    }

    @Override
    public String toString() {
        return "ClassRoom{" +
                "room_id='" + room_id + '\'' +
                ", className='" + className + '\'' +
                '}';
    }
}
