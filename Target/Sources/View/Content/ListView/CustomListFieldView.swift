//
//  CustomListViewCell.swift
//  ToDoMate
//
//  Created by 민도현 on 2022/03/11.
//

import SwiftUI

struct CustomListFieldView: View {
    
    //    @State var item : TodoListItem
    
    // 버튼 클릭시 상태값 저장
    @State var isClickedCheckButton = false
    
    @Binding var textFieldContents : String
    
    var body: some View {
        
        
        VStack {
            HStack {
                Button(action:  {
                    self.isClickedCheckButton.toggle()
                    print(textFieldContents)
                }) {
                    
                    Image(uiImage: isClickedCheckButton
                          ? ToDoMateAsset.Assets.str2.image
                          : ToDoMateAsset.Assets.str.image)
                        .resizable()
                        .frame(width: 40, height: 40)
                }
                
                TextField("입력해주세요", text: $textFieldContents)
                
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
        CalendarView()
    }
}
