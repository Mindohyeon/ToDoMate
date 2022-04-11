//
//  CalendarView.swift
//  ToDoMate
//
//  Created by 민도현 on 2022/03/04.
//

import SwiftUI

struct CalendarView: View {

    @State var clickMenuIcon = false
    @State private var isAddState = false
    @State var currentDate : Date = Date()
    
    @ObservedObject var menuViewModel = MenuViewModel()
    
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
                        .padding()

                    // MARK: - list
                    List {

                        Section(header: CustomAddViewCell(addView: $isAddState)) {
                            
                            if isAddState {
                                CustomListFieldView(textFieldContents: $menuViewModel.inputText)
                                //enter 쳤을 때
                                    .onSubmit {
                                        print(menuViewModel.inputText)
                                        print("inputText = \(menuViewModel.inputText)")
                                        
                                        menuViewModel.item.append(TodoListItem.init(text: menuViewModel.inputText))
                                        
                                        menuViewModel.inputText = ""
                                        
                                    }
                            }
                            
                            
                            ForEach(menuViewModel.item, id: \.id) { index in
                                CustomListView(textFieldContents: index.text)
                            }
                            //스와이프로 Delete 하기
                            .onDelete {
                                menuViewModel.item.remove(atOffsets: $0)
                            }.frame(maxWidth: .infinity, maxHeight: .infinity)
                            
                        }
                        
                    }
                    .listStyle(PlainListStyle())
                    
                    
                }
                
                GeometryReader { _ in
                    HStack {
                        Spacer()
                        
                        SideMenuView()
                            .offset(x: clickMenuIcon ? 0 :UIScreen.main.bounds.width)
                            .animation(.easeIn(duration: 0.20), value: clickMenuIcon)
                        
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
