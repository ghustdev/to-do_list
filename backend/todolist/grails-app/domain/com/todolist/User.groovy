package com.todolist

import java.sql.Timestamp

class User {

    String name
    String email
    String password
    String role
    Timestamp createdAt

    static hasMany = [tasks: Task]

    static constraints = {
        name nullable: true, blank: true
        email email: true, unique: true, nullable: true
        password nullable: true, blank: true
        role nullable: true, blank: true
        createdAt nullable: true
    }

    static mapping = {
        table 'users'
    }
}