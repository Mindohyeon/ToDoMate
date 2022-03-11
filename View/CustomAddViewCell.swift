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
            
        }
        
        .background(Color.gray)
        .opacity(0.7)
        
    }
}

struct CustomAddViewCell_Previews: PreviewProvider {
    static var previews: some View {
        CustomAddViewCell()
    }
}
