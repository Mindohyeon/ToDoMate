//
//  CustomListViewCell.swift
//  ToDoMate
//
//  Created by 민도현 on 2022/03/11.
//

import SwiftUI

struct CustomListView: View {
    
    var item : TodoListItem?
    // 버튼 클릭시 상태값 저장
    @State var isClickedCheckButton = false
    
    var textFieldContents : String
    
    
    var body: some View {
        
        HStack {
            Button(action:  {
                self.isClickedCheckButton.toggle()
            }) {
                Image(isClickedCheckButton ? "str2" : "str")
                        .resizable()
                        .frame(width: 40, height: 40)

                }
            
//            Text(item?.name ?? "")
            Text(textFieldContents)
            
            Spacer()
            
            Button {
                
            } label: {
                Image(systemName: "ellipsis")
                    .font(.title2)
                    .foregroundColor(.gray)
                
        }
        .buttonStyle(.plain)
        .padding([.leading, .trailing], 3)
        }
    }
}





struct CustomListViewCell_Previews: PreviewProvider {
    static var previews: some View {
        CustomListView(textFieldContents: "")
    }
}
