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
        
        let drag = DragGesture()
            .onEnded {
                //sideMenu 를 Swipe 로 Close 하기
                if $0.translation.width > 100 {
                    withAnimation {
                        self.ClickMenuIcon = false
                    }
                }
            }
        
        NavigationView {
            ZStack(alignment: .trailing) {
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
                    HStack {
                        Spacer()
                        
                        SideMenuView()
                            .offset(x: ClickMenuIcon ? 0 :UIScreen.main.bounds.width)
                            .animation(.easeIn(duration: 0.25), value: ClickMenuIcon)
                        
                    }
                    
                    .toolbar {
                        ToolbarItemGroup(placement: .navigationBarTrailing) {
                            Image(systemName: "trash")
                                .padding()
                            
                            
                            Button {
                                self.ClickMenuIcon.toggle()
                            } label: {
                                Image(systemName: "list.bullet")
                                    .padding(.trailing, 5)
                                    .foregroundColor(.black)
                                    .buttonStyle(.plain)
                            }
                        }
                    }
                    .background(.black.opacity(ClickMenuIcon ? 0.5 : 0))
                }
            }
            .gesture(drag)
        }
    }
}

struct CalendarView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarView()
    }
}
