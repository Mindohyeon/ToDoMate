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
    
    @State private var isAnimation = false
    private var menuItem = ["주" , "달" , "년"]
    
    @Namespace private var animation
    
    var body: some View {

        VStack(spacing: 20) {
            
            // Days
            let days: [String] =
            ["일", "월", "화", "수", "목", "금", "토"]
            
            HStack(spacing : 7) {
                
                    Text(viewModel.extraDate()[0])
                        .font(.system(size: 15))
                        .fontWeight(.semibold)
                    
                    Text(viewModel.extraDate()[1])
                        .font(.system(size: 15))
                        .fontWeight(.semibold)

                                Menu {
                                    // id : \.self == 각 요소를 고유하게 식별할 수 있도록 하기 위해서 필요함.
                                    ForEach(menuItem, id: \.self) { chapter in
                                        Text("\(chapter)")
                                    }
                                    
                                } label: {
                                    Image(systemName: "star")
                                    
                                }

                
                Spacer(minLength: 0)
                
                Button {
                    
                    withAnimation {
                        viewModel.currentWeek -= 1
                    }
                    
                    
                } label: {
                    Image(systemName: "chevron.left")
                        .font(.title2)
                        .foregroundColor(.black)
                        
                }
                
                Button {
                    
                    withAnimation {
                        viewModel.currentWeek += 1
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
                ForEach(viewModel.extractDate()) { value in
                    cardView(value: value)
                        .background(
                            ZStack {
                                if viewModel.isSameDay(date1: value.date, date2: viewModel.currentDate){
                                    RoundedRectangle(cornerRadius: 12)
                                        .fill(.gray)
                                        .padding(.horizontal, 3)
                                        .opacity(0.3)
                                        .matchedGeometryEffect(id: "title", in: animation)
                                }
                            }
                            
                           
                            
                        )
                    
                        //day 가 tap 되었을 때
                        .onTapGesture {
                            
                            withAnimation {
                                viewModel.currentDate = value.date
                                print("aaa\(value.date)")
                                print("Clicked")
                                print("isanimation = \(isAnimation)")
                            }
                            
                            
                        }
                    }
            }
        }
        // currentMonth 값이 변경되었을 때 실행
        // newValue 는 비교 검사에 실패한 새 값
        .onChange(of: viewModel.currentWeek) { newValue in
            
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
                                      .frame(maxWidth: .infinity, maxHeight: .infinity)
                    
                                  Spacer()

                                  Circle()
                                    .fill(viewModel.isSameDay(date1: task.taskDate, date2: viewModel.currentDate) ? .blue : .pink)
                                    .frame(width: 8, height: 8)
                            

                              }
                              else {

                                  Text("\(value.day)")
                                      .font(.title3.bold())
                                      .foregroundColor(viewModel.isSameDay(date1: value.date, date2: viewModel.currentDate) ? .white : .primary)
                                      .frame(maxWidth: .infinity, maxHeight: .infinity)
                                  
                                  
                              }
                          }
            
                        
        }
        .padding(.vertical, 8)
        .frame(height: 40, alignment: .top)
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
        
        let week = calendar.dateInterval(of: .weekOfMonth, for: self)
        
        guard let first = week?.start else {
            return []
        }
        
        //Getting date
        var res: [Date] = []
        (0..<7).forEach { day in
            res.append(calendar.date(byAdding: .day, value: day, to: first) ?? .init())
        }
        return res
        
    }
}

