//
//  CustomListViewCell.swift
//  ToDoMate
//
//  Created by 민도현 on 2022/03/11.
//

import SwiftUI

struct CustomListViewCell: View {
    
    var item : TodoListItem?
    // 버튼 클릭시 상태값 저장
    @State var isClickedCheckButton = false
    
    init(_ item : TodoListItem) {
        self.item = item
    }
    
    
    var body: some View {
        HStack {
            Button(action:  {
                self.isClickedCheckButton.toggle()
            }) {
                if isClickedCheckButton {
                    Image("str2")
                        .foregroundColor(.black)
                }
                else {
                    Image("str")
                }
            }
            
            Text("item : \(item!.name)")
            
            Spacer()
            
            Button {
                
            } label: {
                Image(systemName: "ellipsis")
                    .font(.title)
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
