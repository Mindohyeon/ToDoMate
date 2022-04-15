//
//  TodoListItem.swift
//  ToDoMate
//
//  Created by 민도현 on 2022/03/11.
//

import SwiftUI

struct TodoListItem : Identifiable {
    
    //Identifiable 을 상속하기 위해서는 고유 id 값이 필요
    var id = UUID().uuidString
    var text : String
//
//    init(name: String) {
//        self.name = name
//    }
//    
}
