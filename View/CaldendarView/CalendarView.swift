//
//  CalendarView.swift
//  ToDoMate
//
//  Created by 민도현 on 2022/03/04.
//

import SwiftUI

struct CalendarView: View {
    
    var listData : [TodoListItem] = []
    @State var ClickMenuIcon = false
    
    init() {
        for index in 1...15 {
            listData.append(TodoListItem(name: "hh"))
        }
    }
    
    @State var currentDate : Date = Date()
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    
                    CustomCalendarView()
                    
                    List {
                        Section(header: CustomAddViewCell()) {
                            ForEach(listData) { index in
                                CustomListViewCell(index)
                            } .frame(maxWidth: .infinity, maxHeight: .infinity)
                        }
                    }
                    .listStyle(PlainListStyle())
                }
                
                GeometryReader { _ in
                    VStack {
                        HStack {
                            Spacer()
                            
                            SideMenuView()
                                .offset(x: ClickMenuIcon ? 0 :UIScreen.main.bounds.width)
                        }.padding()
                            .toolbar {
                                ToolbarItemGroup(placement: .navigationBarTrailing) {
                                    Image(systemName: "trash")
                                        .padding()
                                    
                                    Button {
                                        ClickMenuIcon.toggle()
                                    } label: {
                                        Image(systemName: "list.bullet")
                                            .padding(.trailing, 5)
                                            .foregroundColor(.black)
                                            .buttonStyle(.plain)
                                    }
                                }
                            }
                    }
                }
            }
        }
    }
}

struct CalendarView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarView()
    }
}
