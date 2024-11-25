//
//  Shift.swift
//  WatchCalculator
//
//  Created by Emre Yılmaz on 9.08.2024.
//

import SwiftData
import Foundation

@Model
class Shift {
    var startDate: Date
    var workDays: Int
    var restDays: Int
    var monthsToCalculate: Int
    var calculatedDates: [Date] = []

    init(startDate: Date, workDays: Int, restDays: Int, monthsToCalculate: Int) {
        self.startDate = startDate
        self.workDays = workDays
        self.restDays = restDays
        self.monthsToCalculate = monthsToCalculate
        self.calculatedDates = calculateShiftDates()
    }

    private func calculateShiftDates() -> [Date] {
        var dates: [Date] = []
        var currentDate = startDate
        let totalDays = monthsToCalculate * 30 // Yaklaşık gün sayısı

        while dates.count < totalDays {
            // Çalışma günleri ekle
            for _ in 0..<workDays {
                if dates.count < totalDays {
                    dates.append(currentDate)
                }
                currentDate = Calendar.current.date(byAdding: .day, value: 1, to: currentDate) ?? currentDate
            }
            // İzin günleri atla
            currentDate = Calendar.current.date(byAdding: .day, value: restDays, to: currentDate) ?? currentDate
        }
        return dates
    }
}





