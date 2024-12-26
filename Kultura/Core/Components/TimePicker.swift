//
//  TimePicker.swift
//  Kultura
//
//  Created by Tural Babayev on 26.12.2024.
//

import SwiftUI

struct TimePickerComponent: View {
    @Binding var selectedTime: String? // Seçilen saat ana view'de yönetilecek
    @State private var timeSlots: [TimeSlot] = [] // Saat ve doluluk durumu
    @State private var isAddingTime: Bool = false // Modal açma kontrolü

    var body: some View {
        VStack(spacing: 20) {
            // Saat Listesi
            LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 5), spacing: 10) {
                ForEach(timeSlots) { timeSlot in
                    Button(action: {
                        if selectedTime == timeSlot.time {
                            selectedTime = nil // Seçimi kaldır
                        } else if timeSlot.isAvailable {
                            selectedTime = timeSlot.time // Yeni saat seç
                        }
                    }) {
                        Text(timeSlot.time)
                            .frame(width: 65, height: 40)
                            .background(
                                selectedTime == timeSlot.time
                                    ? Color.blue // Seçili saat mavi
                                    : (timeSlot.isAvailable ? Color("appSecondary") : Color.gray.opacity(0.3)) // Dolu saat kırmızı
                            )
                            .foregroundColor(.black)
                            .cornerRadius(24)
                            .overlay(content: {
                                RoundedRectangle(cornerRadius: 24)
                                    .stroke(.gray, lineWidth: 0.5)
                            })
                    }
                    .disabled(!timeSlot.isAvailable) // Eğer doluysa tıklanamaz
                }
            }
            // Add Yours Butonu
            HStack {
                Spacer() // "Add Yours" butonunu sağa yaslamak için
                Button(action: {
                    isAddingTime = true // Modal ekranını aç
                }) {
                    Text("Add Yours")
                        .padding(.horizontal, 20)
                        .padding(.vertical, 10)
                        .background(Color("appSecondary"))
                        .foregroundColor(.black)
                        .cornerRadius(24)
                        .overlay {
                            RoundedRectangle(cornerRadius: 24)
                                .stroke(.gray, lineWidth: 0.5)
                        }
                }
                .sheet(isPresented: $isAddingTime) {
                    AddTimeModal(timeSlots: $timeSlots) // Modal ekran
                }
            }
            //.padding(.horizontal)
        }
        .onAppear {
            initializeTimeSlots() // İlk yüklemede tüm saatleri ayarla
        }
    }
    
    private func initializeTimeSlots() {
        let availableTimes = [
            "09:00", "09:30", "10:00", "10:30", "11:00", "11:30",
            "12:00", "12:30", "13:00", "13:30", "14:00", "14:30",
            "15:00", "15:30", "16:00", "16:30", "17:00", "17:30",
            "18:00", "18:30", "19:00", "19:30", "20:00", "20:30",
            "21:00", "21:30", "22:00", "22:30", "23:00", "23:30", "00:00"
        ]
        
        // Bazı saatleri dolu yapalım (örneğin 15:00 ve 18:30)
        let unavailableTimes: Set<String> = ["15:00", "18:30"]

        // Tüm saatleri `TimeSlot` modeline çevir
        self.timeSlots = availableTimes.map { time in
            TimeSlot(time: time, isAvailable: !unavailableTimes.contains(time))
        }
    }
}

struct AddTimeModal: View {
    @Environment(\.dismiss) var dismiss
    @Binding var timeSlots: [TimeSlot] // Ana ekrandaki saat listesi
    @State private var selectedNewTime: String = "09:00" // Yeni seçilen saat

    private let availableTimes: [String] = [
        "09:00", "09:12", "10:00", "10:30", "11:00", "11:30",
        "12:00", "12:30", "13:00", "13:30", "14:00", "14:30",
        "15:00", "15:30", "16:00", "16:30", "17:00", "17:30",
        "18:00", "18:30", "19:00", "19:30", "20:00", "20:30",
        "21:00", "21:30", "22:00", "22:30", "23:00", "23:30", "00:00"
    ] // Kullanıcıya sunulacak saatler
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Select a Time")
                .font(.headline)

            // Saat Seçimi Picker
            Picker("Select Time", selection: $selectedNewTime) {
                ForEach(availableTimes, id: \.self) { time in
                    Text(time).tag(time)
                }
            }
            .pickerStyle(WheelPickerStyle())
            .frame(height: 200)

            // Kaydet Butonu
            Button(action: {
                if !timeSlots.contains(where: { $0.time == selectedNewTime }) { // Aynı saat yoksa ekle
                    timeSlots.append(TimeSlot(time: selectedNewTime, isAvailable: true))
                }
                dismiss() // Modal ekranı kapat
            }) {
                Text("Save")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .padding(.horizontal)
        }
        .padding()
    }
}
