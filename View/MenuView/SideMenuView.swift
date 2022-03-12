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
                
                .onTapGesture {
                print("Tabbed profile")
            }
            Text("target") .onTapGesture {
                print("Tabbed target")
            }
            
            Spacer()
        }
        .background(.gray)
        .opacity(0.5)
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        SideMenuView()
    }
}
