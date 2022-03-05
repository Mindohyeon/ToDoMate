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
        
        guard let currentMonth = calendar.date(byAdding: .weekOfMonth, value: self.currnetWeek, to: Date())
        else {
            return Date()
        }
        print(currnetWeek)
        return currentMonth
        
    }
    
    func isSameDay(date1 : Date, date2 : Date) -> Bool {
          let calendar = Calendar.current
          
          return calendar.isDate(date1, inSameDayAs: date2)
      }
    
    
    func extraDate() -> [String] {
        let formatter = DateFormatter()
        formatter.dateFormat = "YYYY MMMM"
        
        let date = formatter.string(from: currentDate)
        
        print(date)

        return date.components(separatedBy: " ")
    }
    
    
    func extractDate() -> [DateValue] {
        
        let calendar = Calendar.current
        
        //Getting current Month Date
        let currentMonth = getCurrentWeek()
        
        var days = currentMonth.getAllDates().compactMap { date -> DateValue in
            
            let day = calendar.component(.day, from: date)
            return DateValue(day: day, date: date)
        }
        
        // Adding offset days to get exact week day
        let firstWeekday = calendar.component(.weekday, from: days.first?.date ?? Date())
    
        
        for _ in 0..<firstWeekday - 1{
            days.insert(DateValue(day: -1, date: Date()), at: 0)
            print(currentDate)
        }
        
        return days
    }
    
    
}
