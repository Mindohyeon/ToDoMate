//
//  CustomAddViewCell.swift
//  ToDoMate
//
//  Created by 민도현 on 2022/03/11.
//

import SwiftUI

struct CustomAddViewCell: View {
    
    @Binding var addView : Bool
    
    var body: some View {
        ZStack {
            
            RoundedRectangle(cornerRadius: 12)
//                .background(Color.gray)
                .opacity(0.3)
            HStack {
                Button {
                    addView.toggle()
                } label: {
                    
                    Text("버튼")
                        .foregroundColor(.black)
                    
                    Image(systemName: "plus.circle.fill")
                        .foregroundColor(.white)
                }
            }
            .padding(8)
            
        } .frame(width: 75, height: 35)
    }
}

struct CustomAddViewCell_Previews: PreviewProvider {
    static var previews: some View {
        CalendarView()
    }
}
