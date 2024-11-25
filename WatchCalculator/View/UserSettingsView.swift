//
//  UserSettingsView.swift
//  WatchCalculator
//
//  Created by Emre Yılmaz on 9.08.2024.
//

import SwiftUI
import SwiftData

struct UserSettingsView: View {
    @Query var settings: [UserSettings]

    var body: some View {
        if let setting = settings.first {
            Form {
                Stepper("Varsayılan Çalışma Günleri: \(setting.defaultWorkDays)", value: Binding(
                    get: { setting.defaultWorkDays },
                    set: { newValue in setting.defaultWorkDays = newValue }
                ), in: 1...30)
                
                Stepper("Varsayılan İzin Günleri: \(setting.defaultRestDays)", value: Binding(
                    get: { setting.defaultRestDays },
                    set: { newValue in setting.defaultRestDays = newValue }
                ), in: 1...30)
                
                Stepper("Varsayılan Ay Sayısı: \(setting.defaultMonthsToCalculate)", value: Binding(
                    get: { setting.defaultMonthsToCalculate },
                    set: { newValue in setting.defaultMonthsToCalculate = newValue }
                ), in: 1...12)
            }
            .navigationBarTitle("Kullanıcı Ayarları")
        } else {
            Text("Kullanıcı ayarları bulunamadı.")
        }
    }
}

#Preview {
    UserSettingsView()
        .modelContainer(for: [UserSettings.self])
}
