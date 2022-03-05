//
//  CalendarView.swift
//  ToDoMate
//
//  Created by 민도현 on 2022/03/04.
//

import SwiftUI

struct CalendarView: View {
    @State var currentDate : Date = Date()
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "trash")
                    .font(.title2)
                    .padding()
                Spacer()
                Image(systemName: "list.bullet")
                    .font(.title2)
                    .padding()
            }
        
            CustomCalendarView()
            
        }
    }
}

struct CalendarView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarView()
    }
}
