//
//  CustomCalendarView.swift
//  ToDoMate
//
//  Created by 민도현 on 2022/03/04.
//

import SwiftUI

struct CustomCalendarView: View {
//    @Binding var currentDate : Date

    @StateObject private var viewModel = CustomCalendarViewModel()
    
    @State private var clickAlert = false
    
    var body: some View {

        VStack(spacing: 30) {
            
            // Days
            let days: [String] =
            ["일", "월", "화", "수", "목", "금", "토"]
            
            HStack(spacing: 20) {
                
                VStack(alignment: .leading, spacing: 10) {
                    
                    Text(extraDate()[0])
                        .font(.caption)
                        .fontWeight(.semibold)
                    
                    Text(extraDate()[1])
                        .font(.title)
                        
                    
                }
                
                Spacer(minLength: 0)
                
                Button {
                    
                    withAnimation {
                        viewModel.currnetWeek -= 1
                    }
                    
                    
                } label: {
                    Image(systemName: "chevron.left")
                        .font(.title2)
                        .foregroundColor(.black)
                        
                }
                
                Button {
                    
                    withAnimation {
                        viewModel.currnetWeek += 1
                    }
                    
                } label: {
                    Image(systemName: "chevron.right")
                        .font(.title2)
                        .foregroundColor(.black)
                    }
            }
            .padding(.horizontal)
            
            //Day View
            //요일
        HStack(spacing:0) {
            ForEach(days, id: \.self) {day in
                
                Text(day)
                    .font(.callout)
                    .fontWeight(.semibold)
                    .frame(maxWidth: .infinity)
                    //불투명도 0~1
                    .opacity(0.3)
                    
                }
            }
            
            // Dates
            
            let columns = Array(repeating: GridItem(.flexible()), count: 7)
            

            LazyVGrid(columns: columns) {
                ForEach(extractDate()) { value in
                    cardView(value: value)
                        .background(
                        
                            RoundedRectangle(cornerRadius: 12)
                                .fill(.gray)
                                .padding(.horizontal, 3)
                                .opacity(viewModel.isSameDay(date1: value.date, date2: viewModel.currentDate) ? 0.3 : 0)
                                
                        )
                    
                        //day 가 tap 되었을 때
                        .onTapGesture {
                            
                            viewModel.currentDate = value.date
                            clickAlert = true
                        }
                    }
            }
        }
        // currentMonth 값이 변경되었을 때 실행
        // newValue 는 비교 검사에 실패한 새 값
        .onChange(of: viewModel.currnetWeek) { newValue in
            
            //updating month
            viewModel.currentDate = viewModel.getCurrentWeek()
        }
    }
    
    @ViewBuilder
    func cardView(value: DateValue)-> some View {
        
        VStack {
            
            if value.day != -1 {
                
                if let task = tasks.first(where: { task in
                    
                    return viewModel.isSameDay(date1: task.taskDate, date2: value.date)
                }) {
                    
                    Text("\(value.day)")
                        .font(.title3.bold())
                        .foregroundColor(viewModel.isSameDay(date1: task.taskDate, date2: viewModel.currentDate) ? .white : .primary)
                        .frame(maxWidth: .infinity)
                    
                    Spacer()
                    
                    Circle()
                        .fill(viewModel.isSameDay(date1: task.taskDate, date2: viewModel.currentDate) ? .white : .pink)
                        .frame(width: 8, height: 8)
                        
                }
                else {
                
                    Text("\(value.day)")
                        .font(.title3.bold())
                        .foregroundColor(viewModel.isSameDay(date1: value.date, date2: viewModel.currentDate) ? .white : .primary)
                        .frame(maxWidth: .infinity)
                }
            }
        }
        .padding(.vertical, 8)
        .frame(height: 40, alignment: .top)
    }
    
    
    func extraDate() -> [String] {
        let formatter = DateFormatter()
        formatter.dateFormat = "YYYY MMMM"
        
        let date = formatter.string(from: viewModel.currentDate)
        
        print(date)

        return date.components(separatedBy: " ")
    }
    
    
    func extractDate() -> [DateValue] {
        
        let calendar = Calendar.current
        
        //Getting current Month Date
        let currentMonth = viewModel.getCurrentWeek()
        
        var days = currentMonth.getAllDates().compactMap { date -> DateValue in
            
            let day = calendar.component(.day, from: date)
            return DateValue(day: day, date: date)
        }
        
        // Adding offset days to get exact week day
        let firstWeekday = calendar.component(.weekday, from: days.first?.date ?? Date())
    
        
        for _ in 0..<firstWeekday - 1{
            days.insert(DateValue(day: -1, date: Date()), at: 0)
            print(viewModel.currentDate)
        }
        
        return days
    }

}

struct CustomDatePicker_Previews: PreviewProvider {
    static var previews: some View {
        CalendarView()
    }
}

extension Date {
    func getAllDates() -> [Date] {
        
        let calendar = Calendar.current
        
        //Getting start Date
        let startDate = calendar.date(from: Calendar.current.dateComponents([.year, .month], from: self))!
        
        //.weekOfMonth == 이번 달에 해당하는 이번 주
        let range = calendar.range(of: .day, in: .weekOfMonth,
            for: startDate)!
        
        //Getting date
        return range.compactMap({ day -> Date in
            
            return calendar.date(byAdding: .day, value: day - 1, to: startDate)!
        })
    }
}
