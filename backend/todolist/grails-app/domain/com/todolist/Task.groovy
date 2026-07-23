package com.todolist

import java.sql.Timestamp
import java.time.LocalDate

class Task {

    String title
    String description
    String status
    LocalDate timeExecution
    Integer priority
    Boolean alert
    Timestamp createdAt

    static belongsTo = [user: User]

    static constraints = {
        title nullable: true, blank: true
        description nullable: true, blank: true
        status nullable: true, inList: ['TODO', 'DOING', 'COMPLETED']
        timeExecution nullable: true
        priority nullable: true, inList: [1, 2, 3, 4, 5]
        alert nullable: true
        createdAt nullable: true
        user nullable: true
    }

    static mapping = {
        table "tasks"
    }
}