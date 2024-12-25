//
//  ReservationDateView.swift
//  Kultura
//
//  Created by Tural Babayev on 25.12.2024.
//

import SwiftUI

struct ReservationView: View {
    @State private var selectedDate: Date? = nil // Seçilen tarih
    @State private var availabilityData: [Availability] = [
        Availability(date: Calendar.current.date(byAdding: .day, value: 1, to: Date())!, isAvailable: true),
        Availability(date: Calendar.current.date(byAdding: .day, value: 2, to: Date())!, isAvailable: false),
        Availability(date: Calendar.current.date(byAdding: .day, value: 3, to: Date())!, isAvailable: true),
    ]
    
    var body: some View {
        VStack {
            CustomDatePicker(
                selectedDate: $selectedDate,
                availabilityData: availabilityData
            )
            .padding()
            
            // Rezervasyon yap butonu
            if let selectedDate = selectedDate {
                VStack {
                    Text("Seçilen Tarih: \(formatDate(selectedDate))")
                        .font(.headline)
                        .padding(.top, 20)
                    
                    Button(action: {
                        // Rezervasyon işlemi
                        print("Rezervasyon Yapıldı: \(selectedDate)")
                    }) {
                        Text("Rezervasyon Yap")
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                    .padding(.top, 10)
                }
                .padding()
            }
        }
    }
    
    private func formatDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter.string(from: date)
    }
}

#Preview {
    ReservationView()
}
