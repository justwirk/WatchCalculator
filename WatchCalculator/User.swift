//
//  User.swift
//  WatchCalculator
//
//  Created by Emre Yılmaz on 9.08.2024.
//

import SwiftData
import Foundation

@Model
class User {
     var name: String
     var shifts: [Shift]
    
    init(name: String) {
        self.name = name
        self.shifts = []
    }
}

