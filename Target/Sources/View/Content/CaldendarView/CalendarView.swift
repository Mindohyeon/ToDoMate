//
//  CalendarView.swift
//  ToDoMate
//
//  Created by 민도현 on 2022/03/04.
//

import SwiftUI

struct CalendarView: View {
    
    var listData : [TodoListItem] = []
    @State var clickMenuIcon = false
    @State var isAddState = false
    
    @State var addView = false
    
    @ObservedObject var menuViewModel = MenuViewModel()
    
    
    // list 개수 결정
//    init() {
//        for _ in 0...listData.count {
//            listData.append(.init(name: menuViewModel.inputText))
//            listData.append(.init(name: textFieldContents))
//            listData.append(name: textFieldContents)
//
//        }
//    }
    
    @State var currentDate : Date = Date()
    var body: some View {
        
        let drag = DragGesture()
            .onEnded {
                //sideMenu 를 Swipe 로 Close 하기
                if $0.translation.width > 100 {
                    withAnimation {
                        self.clickMenuIcon = false
                    }
                }
            }
        
        NavigationView {
            
            ZStack(alignment: .trailing) {
                VStack {
                    CustomCalendarView()

                    List {

                        Section(header: CustomAddViewCell(addView: $isAddState)) {
                            
                            if isAddState {
                                CustomListFieldView(textFieldContents: $menuViewModel.inputText)
                                    .onSubmit {
                                        print(menuViewModel.inputText)
                                        print("inputText = \(menuViewModel.inputText)")
                                        
                                        menuViewModel.item.append(TodoListItem.init(name: menuViewModel.inputText))
                                        
                                        menuViewModel.inputText = ""
                                        
                                    }
                            }
                            
                            
                            ForEach(menuViewModel.item, id: \.id) { index in
                                CustomListView(textFieldContents: index.name)
                            } .frame(maxWidth: .infinity, maxHeight: .infinity)
                            
                        }
                        
                    }
                    .listStyle(PlainListStyle())
                    
                    
                }
                
                GeometryReader { _ in
                    HStack {
                        Spacer()
                        
                        SideMenuView()
                            .offset(x: clickMenuIcon ? 0 :UIScreen.main.bounds.width)
                            .animation(.easeIn(duration: 0.25), value: clickMenuIcon)
                        
                    }
                    
                    .toolbar {
                        ToolbarItemGroup(placement: .navigationBarTrailing) {
                            Image(systemName: "trash")
                                .padding()
                            
                            
                            Button {
                                self.clickMenuIcon.toggle()
                            } label: {
                                Image(systemName: "list.bullet")
                                    .padding(.trailing, 5)
                                    .foregroundColor(.black)
                                    .buttonStyle(.plain)
                            }
                        }
                    }
                    .background(.black.opacity(clickMenuIcon ? 0.3 : 0))
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
