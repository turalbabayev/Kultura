//
//  ReservationDateView.swift
//  Kultura
//
//  Created by Tural Babayev on 25.12.2024.
//

import SwiftUI

struct ReservationView: View {
    @State private var guestCount: Int = 1 // Başlangıç değeri
    @State private var selectedDate: Date? = nil // Seçilen tarih
    @State private var selectedTime: String? = nil // Seçilen saat

    @Environment(\.dismiss) var dismiss
    
    let minGuests = 1
    let maxGuests = 10

    
    var body: some View {
        VStack {
            NavigationView {
                ScrollView{
                    VStack(alignment: .leading ,spacing: 20){
                        
                        Text("Guests")
                            .padding(.horizontal)
                        
                        StepperComponent(value: $guestCount, minValue: minGuests, maxValue: maxGuests)
                            .padding(.horizontal)
                        
                        Text("Date")
                            .padding(.horizontal)
                            
                        CustomDatePicker(selectedDate: $selectedDate)
                            .padding(.horizontal)
                        
                        Text("Time")
                            .padding(.horizontal)
                        
                        TimePickerComponent(selectedTime: $selectedTime)

                        
                        if let selectedDate = selectedDate {
                            Text("Seçilen Tarih: \(formatDate(selectedDate)) ve Kisi Sayisi: \(guestCount)")
                                .padding()
                        } else {
                            Text("Henüz bir tarih seçilmedi.")
                                .padding()
                        }
                        
                        Spacer()
                    }
                    .background(Color("appSecondary"))
                    .padding(.top, 16)
                    .navigationBarTitleDisplayMode(.inline)
                    .toolbar{
                        ToolbarItem(placement: .navigationBarLeading) {
                            Button(action: {
                                dismiss()
                            }) {
                                Image("arrow-left")
                                    .frame(width: 24, height: 24)
                            }
                        }
                        ToolbarItem(placement: .principal) {
                            Text("Reserve a table")
                                .font(AppFonts.customFont(name: "Poppins", size: 16))
                        }
                    }
                    .background(Color("appSecondary"))
                }
                .background(Color("appSecondary"))
            }
        }
        .background(Color("appSecondary"))
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
