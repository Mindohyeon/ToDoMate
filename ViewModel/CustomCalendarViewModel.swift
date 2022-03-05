//
//  CustomCalendarViewModel.swift
//  ToDoMate
//
//  Created by 민도현 on 2022/03/05.
//

import Foundation

class CustomCalendarViewModel : ObservableObject {
    
    @Published var currentMonth : Int = 0
    @Published var currentDate : Date = Date()
    
    
    func getCurrentMonth() -> Date {
        
        let calendar = Calendar.current
        
        guard let currentMonth = calendar.date(byAdding: .month, value: self.currentMonth, to: Date())
        else {
            return Date()
        }
        
        return currentMonth
        
    }
    
    func isSameDay(date1 : Date, date2 : Date) -> Bool {
          let calendar = Calendar.current
          
          return calendar.isDate(date1, inSameDayAs: date2)
      }
    
    
}
