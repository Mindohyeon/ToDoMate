//
//  CustomAddViewCell.swift
//  ToDoMate
//
//  Created by 민도현 on 2022/03/11.
//

import SwiftUI

struct CustomAddViewCell: View {
    var body: some View {
        ZStack {
            
            RoundedRectangle(cornerRadius: 12)
                .background(Color.gray)
                .opacity(0.3)
            HStack {
                Button {
                    
                } label: {
                    
                    Text("버튼")
                        .foregroundColor(.black)
                    
                    Image(systemName: "plus.circle.fill")
                        .foregroundColor(.white)
                }
            }
            .padding(7)
            
        } .frame(width: 80, height: 50)
        
    }
}

struct CustomAddViewCell_Previews: PreviewProvider {
    static var previews: some View {
        CustomAddViewCell()
    }
}
