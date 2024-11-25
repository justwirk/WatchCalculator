//
//  ShiftListView.swift
//  WatchCalculator
//
//  Created by Emre Yılmaz on 9.08.2024.
//

import SwiftUI
import SwiftData

struct ShiftListView: View {
    @Query var shifts: [Shift]

    var body: some View {
        NavigationView {
            List(shifts) { shift in
                VStack(alignment: .leading) {
                    Text("Başlangıç: \(shift.startDate, formatter: DateFormatter.shortDate)")
                    Text("Çalışma Günleri: \(shift.workDays)")
                    Text("İzin Günleri: \(shift.restDays)")
                    Text("Ay Sayısı: \(shift.monthsToCalculate)")
                    
                    CalendarView(shiftDates: shift.calculatedDates, monthsToCalculate: shift.monthsToCalculate)
                        .padding(.top)
                }
            }
            .navigationBarTitle("Kaydedilen Vardiyalar")
        }
    }
}

#Preview {
    ShiftListView()
        .modelContainer(for: [Shift.self])
}

