//
//  CalendarView.swift
//  WatchCalculator
//
//  Created by Emre Yılmaz on 9.08.2024.
//



import SwiftUI

struct CalendarView: View {
    var shiftDates: [Date]
    var monthsToCalculate: Int

    var body: some View {
        ScrollView {  // ScrollView ekleyerek tüm içeriğin kaydırılabilir olmasını sağlıyoruz
            VStack {
                ForEach(0..<monthsToCalculate, id: \.self) { monthOffset in
                    let currentMonthDate = Calendar.current.date(byAdding: .month, value: monthOffset, to: shiftDates.first!)!
                    
                    VStack {
                        Text(currentMonthDate, formatter: DateFormatter.monthAndYear)
                            .font(.headline)
                            .padding()
                        
                        let daysInMonth = generateDaysInMonth(for: currentMonthDate)
                        let gridItemLayout = Array(repeating: GridItem(.flexible()), count: 7)
                        
                        LazyVGrid(columns: gridItemLayout, spacing: 10) {
                            ForEach(daysInMonth, id: \.self) { date in
                                DayView(date: date, shiftDates: shiftDates)
                            }
                        }
                        .padding(.bottom)
                    }
                }
            }
            .padding()
        }
    }
    
    private func generateDaysInMonth(for date: Date) -> [Date] {
        var days: [Date] = []
        let calendar = Calendar.current
        let range = calendar.range(of: .day, in: .month, for: date)!
        
        let startDate = calendar.date(from: calendar.dateComponents([.year, .month], from: date))!
        
        for day in range {
            if let currentDay = calendar.date(byAdding: .day, value: day - 1, to: startDate) {
                days.append(currentDay)
            }
        }
        
        return days
    }
}

#Preview {
    CalendarView(shiftDates: [Date()], monthsToCalculate: 1)
}




extension DateFormatter {
    static var shortDate: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        return formatter
    }

    static var monthAndYear: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMMM yyyy"
        return formatter
    }
}
