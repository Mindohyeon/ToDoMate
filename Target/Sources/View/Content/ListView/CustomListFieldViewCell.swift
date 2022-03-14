//
//  CustomListViewCell.swift
//  ToDoMate
//
//  Created by 민도현 on 2022/03/11.
//

import SwiftUI

struct CustomListFieldViewCell: View {
    
    var item : TodoListItem?
    // 버튼 클릭시 상태값 저장
    @State var isClickedCheckButton = false
    @State var diaryContents : String = ""
    
    init(_ item : TodoListItem) {
        self.item = item
        
        
    }
    
    
    var body: some View {
        VStack {
            HStack {
                Button(action:  {
                    self.isClickedCheckButton.toggle()
                }) {
                    if isClickedCheckButton {
                        Image("str2")
                            .resizable()
                            .frame(width: 40, height: 40)
                        
                    }
                    else {
                        Image(ToDoMateAsset.Assets.str.name)
                            .resizable()
                            .frame(width: 40, height: 40)
                            .padding(3)
                        
                    }
                }
                
                TextField("입력해주세요", text: $diaryContents)
                
                Spacer()
                
                Button {
                    
                } label: {
                    Image(systemName: "ellipsis")
                        .font(.title2)
                        .foregroundColor(.gray)
                    
                }
            }
            .buttonStyle(.plain)
            .padding([.leading, .trailing], 3)
            
            Rectangle()
                .frame( height: 2)
                .foregroundColor(.black)
                .padding(.leading, 45)
                .padding(.trailing, 33)
        }
    }
}





struct CustomListFieldViewCell_Previews: PreviewProvider {
    static var previews: some View {
        CustomListFieldViewCell(TodoListItem(name: ""))
    }
}
