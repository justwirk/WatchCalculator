//
//  ContentView.swift
//  WatchCalculator
//
//  Created by Emre Yılmaz on 9.08.2024.
//
import SwiftUI


struct ContentView: View {
    @State private var startDate = Date()
    @State private var workDays = 2
    @State private var restDays = 2
    @State private var monthsToCalculate = 1
    
    var body: some View {
        NavigationView {
            VStack {
                DatePicker("Başlangıç Tarihi", selection: $startDate, displayedComponents: .date)
                    .padding()
                
                Stepper(value: $workDays, in: 1...10) {
                    Text("Çalışma Günleri: \(workDays)")
                }.padding()

                Stepper(value: $restDays, in: 1...10) {
                    Text("İzin Günleri: \(restDays)")
                }.padding()

                Stepper(value: $monthsToCalculate, in: 1...12) {
                    Text("Hesaplanacak Ay: \(monthsToCalculate)")
                }.padding()
                
                NavigationLink(destination: CalendarView(shiftDates: calculateShiftDates(), monthsToCalculate: monthsToCalculate)) {
                    Text("Hesapla ve Takvimi Göster")
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(10)
                }
                .padding()
            }
            .navigationBarTitle("Nöbet Hesaplayıcı")
        }
    }
    
    private func calculateShiftDates() -> [Date] {
        var dates: [Date] = []
        var currentDate = startDate
        let calendar = Calendar.current

        let endDate = calendar.date(byAdding: .month, value: monthsToCalculate, to: startDate)!
        
        while currentDate < endDate {
            // Çalışma günleri ekle
            for _ in 0..<workDays {
                if currentDate < endDate {
                    dates.append(currentDate)
                }
                currentDate = calendar.date(byAdding: .day, value: 1, to: currentDate) ?? currentDate
            }
            // İzin günleri atla
            currentDate = calendar.date(byAdding: .day, value: restDays, to: currentDate) ?? currentDate
        }
        
        return dates
    }
}

#Preview {
    ContentView()
}
