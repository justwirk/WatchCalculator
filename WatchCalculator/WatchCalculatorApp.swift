//
//  WatchCalculatorApp.swift
//  WatchCalculator
//
//  Created by Emre Yılmaz on 9.08.2024.
//

import SwiftUI
import SwiftData

@main
struct WatchCalculatorApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: [Shift.self])
        }
    }
}
