//
//  CalendarView.swift
//  Dr.Ink
//
//  Created by Inwoo Park on 2022/05/09.
//

import SwiftUI

struct CalendarView: View {
    @FetchRequest(sortDescriptors: [SortDescriptor(\DailyWater.date, order: .reverse)])
    var dailyWaterList: FetchedResults<DailyWater>
    
    @Binding var showModal: Bool
    @Binding var modalContent: ModalContent?
    
    @Binding var currentDate: Date
    @State var currentMonth: Int = 0
    
    var body: some View {
        VStack {
            Spacer()
            VStack(alignment: .center, spacing: 35) {
                let days: [String] = ["일","월","화","수","목","금","토"]
                
                HStack(spacing: 20) {
                    VStack(alignment: .leading, spacing: 10) {
                        Text(extraDate()[0])
                            .font(.caption)
                            .fontWeight(.semibold)
                        Text(extraDate()[1])
                            .font(.title.bold())
                    }
                    Spacer(minLength: 0)
                    Button {
                        withAnimation {
                            currentMonth -= 1
                        }
                    } label: {
                        Image(systemName: "chevron.left")
                            .font(.title2)
                            .foregroundColor(Color.black)
                    }
                    Button {
                        withAnimation {
                            currentMonth += 1
                        }
                    } label: {
                        Image(systemName: "chevron.right")
                            .font(.title2)
                            .foregroundColor(Color.black)
                    }
                }.padding(.horizontal)
                
                HStack(spacing: 0) {
                    ForEach(days, id: \.self) { day in
                        Text(day)
                            .font(.callout)
                            .fontWeight(.semibold)
                            .frame(maxWidth: .infinity)
                    }
                }
                
                let colums = Array(repeating: GridItem(.flexible()), count: 7)
                LazyVGrid(columns: colums, spacing: 15) {
                    ForEach(extractDate()) { value in
                        CardView(value: value)
                    }
                }
            }
            .onChange(of: currentMonth) { newValue in
                currentDate = getCurrentMonth()
            }
            Spacer()
        }
        .background {
            BackgroundView()
        }
    }
    
    @ViewBuilder
    func CardView(value: DateValue) -> some View {
        VStack {
            if value.day != -1 {
                Button(action: {
                    for dailyWater in dailyWaterList {
                        let formatter = DateFormatter()
                        formatter.dateFormat = "yyyy-MM-dd"
                        
                        if formatter.string(from: dailyWater.date!) == formatter.string(from: value.date) {
                            modalContent = .dailyMemo(day: dailyWater)
                            showModal = true
                            return
                        }
                    }
                    modalContent = .dailyMemo(day: nil)
                    showModal = true
                }, label: {
                        Text("\(value.day)")
                            .font(.title3.bold())
                }).tint(.black)
            }
        }
        .padding(.vertical, 8)
        .frame(height: 60, alignment: .top)
    }
    
    func extraDate() -> [String] {
        let formatter = DateFormatter()
        formatter.dateFormat = "YYYY MMMM"
        
        let date = formatter.string(from: currentDate)
        
        return date.components(separatedBy: " ")
    }
    
    func getCurrentMonth() -> Date {
        let calendar = Calendar.current
        guard let currentMonth = calendar.date(byAdding: .month, value: self.currentMonth, to: Date()) else {
            return Date()
        }
        return currentMonth
    }
    
    func extractDate() -> [DateValue] {
        let calendar = Calendar.current
        let currentMonth = getCurrentMonth()
        
        var days = currentMonth.getAllDates().compactMap { date -> DateValue in
            let day = calendar.component(.day, from: date)
            return DateValue(day: day, date: date)
        }
        
        let firstWeekday = calendar.component(.weekday, from: days.first?.date ?? Date())
        
        for _ in 0..<firstWeekday - 1 {
            days.insert(DateValue(day: -1, date: Date()), at: 0)
        }
        
        return days
    }
}

struct Calendar_Previews: PreviewProvider {
    static var previews: some View {
        CalendarView(showModal: .constant(false), modalContent: .constant(nil), currentDate: .constant(.now))
    }
}

extension Date {
    func getAllDates() -> [Date] {
        let calendar = Calendar.current
        let startDate = calendar.date(from: Calendar.current.dateComponents([.year, .month], from: self))!
        let range = calendar.range(of: .day, in: .month, for: startDate)!
        
        return range.compactMap { day -> Date in
            return calendar.date(byAdding: .day, value: day - 1, to: startDate)!
        }
    }
}
