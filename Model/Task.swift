//
//  task.swift
//  ToDoMate
//
//  Created by 민도현 on 2022/03/05.
//

import SwiftUI

struct Task: Identifiable {
    var id = UUID().uuidString
    var title : String
    var time : Date = Date()
}

//Total Task Meta View
struct TaskMetaDate : Identifiable {
    var id = UUID().uuidString
    var task : [Task]
    var taskDate : Date
}

//Sample Date for Testing
func getSampleDate(offset : Int) -> Date {
    let calendar = Calendar.current
    
    let date = calendar.date(byAdding: .day, value: offset, to: Date())
    
    return date ?? Date()
}

var tasks : [TaskMetaDate] = [

    TaskMetaDate(task : [
        
        Task(title: "Talk to iJustine"),
        Task(title: "adsfasf"),
        Task(title: "aaaaa")
    ], taskDate: getSampleDate(offset: 4)),
    
    TaskMetaDate(task: [
    
        Task(title: "asdfasfd")
    ], taskDate: getSampleDate(offset: -10))
]

