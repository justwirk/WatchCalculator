//
//  AddNoteView.swift
//  WatchCalculator
//
//  Created by Emre Yılmaz on 13.08.2024.
//

import SwiftUI

struct AddNoteView: View {
    @Binding var notes: [String: [String]]
    @Environment(\.dismiss) var dismiss
    @State private var selectedHour = 0
    @State private var noteText = ""

    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                // Saat seçici
                Picker("Saat Seçin", selection: $selectedHour) {
                    ForEach(0..<24) { hour in
                        Text("\(hour):00").tag(hour)
                    }
                }
                .pickerStyle(WheelPickerStyle())
                
                // Not girişi
                TextField("Notunuzu girin", text: $noteText)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()

                // Kaydet butonu
                Button("Kaydet") {
                    if notes["\(selectedHour):00"] != nil {
                        // Saat zaten var, eski notları saklayarak yeni notu ekleyelim
                        notes["\(selectedHour):00"]!.append(noteText)
                    } else {
                        // Saat için ilk defa not ekleniyor
                        notes["\(selectedHour):00"] = [noteText]
                    }
                    dismiss()
                }
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(10)
                
                Spacer()
            }
            .navigationTitle("Not Ekle")
        }
    }
}

struct AddNoteView_Previews: PreviewProvider {
    static var previews: some View {
        AddNoteView(notes: .constant([:]))
    }
}
