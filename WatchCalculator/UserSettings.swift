//
//  UserSettings.swift
//  WatchCalculator
//
//  Created by Emre Yılmaz on 9.08.2024.
//

import SwiftData
import Foundation

@Model
class UserSettings {
    var defaultWorkDays: Int
    var defaultRestDays: Int
    var defaultMonthsToCalculate: Int
    
    init(defaultWorkDays: Int = 2, defaultRestDays: Int = 2, defaultMonthsToCalculate: Int = 1) {
        self.defaultWorkDays = defaultWorkDays
        self.defaultRestDays = defaultRestDays
        self.defaultMonthsToCalculate = defaultMonthsToCalculate
    }
}
