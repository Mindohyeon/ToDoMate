//
//  CustomCalendarViewModel.swift
//  ToDoMate
//
//  Created by 민도현 on 2022/03/05.
//

import Foundation

class CustomCalendarViewModel : ObservableObject {
    
    @Published var currnetWeek: Int = 0
    @Published var currentDate : Date = Date()
    
    
    func getCurrentWeek() -> Date {
        
        let calendar = Calendar.current
        
        guard let currentWeek = calendar.date(byAdding: .weekday, value: self.currnetWeek, to: Date())
        else {
            return Date()
        }
        
        return currentWeek
        
    }
    
    func isSameDay(date1 : Date, date2 : Date) -> Bool {
          let calendar = Calendar.current
          
          return calendar.isDate(date1, inSameDayAs: date2)
      }
    
    
}
