//
//  CustomListViewCell.swift
//  ToDoMate
//
//  Created by 민도현 on 2022/03/11.
//

import SwiftUI

struct CustomListViewCell: View {
    
    var item : TodoListItem?
    
    init(_ item : TodoListItem) {
        self.item = item
    }
    
    var body: some View {
        HStack {
            Button {
                
            } label: {
                Text("check")
            }
            
            Text("item : \(item!.name)")
            
            Spacer()
            
            Button {
                
            } label: {
                Image(systemName: "ellipsis")
                    .font(.title2)
                    .foregroundColor(.gray)
                
            }
        }
        .padding()
    }
}





struct CustomListViewCell_Previews: PreviewProvider {
    static var previews: some View {
        CustomListViewCell(TodoListItem(id: "", name: ""))
    }
}
