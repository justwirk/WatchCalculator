//
//  DayView.swift
//  WatchCalculator
//
//  Created by Emre Yılmaz on 12.08.2024.
//

import SwiftUI

struct DayView: View {
    var date: Date
    var shiftDates: [Date]

    var body: some View {
        let calendar = Calendar.current
        
        // shiftDates içindeki her tarih ile date karşılaştırması yapılıyor.
        let isWorkingDay = shiftDates.contains { shiftDate in
            calendar.isDate(shiftDate, inSameDayAs: date)
        }
        
        NavigationLink(destination: DayDetailView(selectedDate: date)) {
            Text("\(calendar.component(.day, from: date))")
                .padding()
                .frame(width: 40, height: 40)
                .background(isWorkingDay ? Color.green : Color.gray)
                .cornerRadius(10)
                .foregroundColor(.white)
        }
    }
}

struct DayDetailView: View {
    var selectedDate: Date
    @State private var notes: [String: [String]] = [:]
    @State private var isShowingAddNoteView = false

    var body: some View {
        VStack {
            Text(selectedDate, style: .date)
                .font(.largeTitle)
                .padding()

            List(0..<24) { hour in
                VStack(alignment: .leading) {
                    Text("\(hour):00")
                        .font(.headline)
                    ForEach(notes["\(hour):00"] ?? [], id: \.self) { note in
                        Text(note)
                    }
                }
                .padding(.vertical, 5)
            }

            Spacer()

            HStack {
                Spacer()
                Button(action: {
                    isShowingAddNoteView = true
                }) {
                    Image(systemName: "plus")
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(50)
                }
                .padding()
                .sheet(isPresented: $isShowingAddNoteView) {
                    AddNoteView(notes: $notes)
                }
            }
        }
        .navigationTitle("Gün Detayları")
    }
}

#Preview {
    DayView(date: Date(), shiftDates: [Date(), Calendar.current.date(byAdding: .day, value: 1, to: Date())!])
}
