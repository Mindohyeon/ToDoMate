//
//  CalendarView.swift
//  ToDoMate
//
//  Created by 민도현 on 2022/03/04.
//

import SwiftUI

struct CalendarView: View {
    
    var listData : [TodoListItem] = []
    
    init() {
        for index in 1...15 {
            listData.append(TodoListItem(name: "hh"))
        }
    }
    
                            
    @State var currentDate : Date = Date()
    var body: some View {
        VStack {
            HStack {
                Text("TodoDay")
                    .font(.title)
                    .fontWeight(.semibold)
                Spacer()
                Image(systemName: "trash")
                    .font(.title2)
                    .padding()
                
                Image(systemName: "list.bullet")
                    .font(.title2)
                    .padding(.trailing, 5)
            }
            .padding([.bottom, .leading, .trailing], 18)
        
            CustomCalendarView()
            
            List {
                Section(header: Text("header")) {
                    ForEach(listData) { index in
                        CustomListViewCell(index)
                    } .frame(maxWidth: .infinity, maxHeight: .infinity)
                }
            }
            .listStyle(PlainListStyle())
            
        }
    }
}

struct CalendarView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarView()
    }
}
