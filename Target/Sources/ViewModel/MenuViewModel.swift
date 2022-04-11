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
    
    @Published var item : [TodoListItem] = []
    
}
