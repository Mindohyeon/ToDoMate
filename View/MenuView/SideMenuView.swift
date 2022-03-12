//
//  MenuView.swift
//  ToDoMate
//
//  Created by 민도현 on 2022/03/11.
//

import SwiftUI

struct SideMenuView: View {
    var body: some View {
        VStack {
            Text("Profile!")
                .font(.title)
            
            Divider()
                .frame(width: 200, height: 2)
                .background(.white)
                .padding(.horizontal, 16)
                .blur(radius: 0.5)
        
            Text("target") .onTapGesture {
                print("Tabbed target")
            }
            Spacer()
        
        }
        .padding(32)
        .background(.gray)
        .edgesIgnoringSafeArea(.bottom)
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        SideMenuView()
    }
}
