//
//  MenuViewModel.swift
//  ToDoMate
//
//  Created by 민도현 on 2022/03/11.
//

import Foundation
import SwiftUI

class MenuViewModel : ObservableObject {
    
    @Published var inputText : String = ""
    
    var item : [TodoListItem] = []
    
    func setList(item: String) {
        for i in 0...self.item.count {
        self.item[i].name = item
            print(self.item[i])
        }
    }

    
    
}
