//
//  ReservationDateView.swift
//  Kultura
//
//  Created by Tural Babayev on 25.12.2024.
//

import SwiftUI

struct ReservationView: View {
    @State private var selectedDate: Date? = nil // Seçilen tarih
    @Environment(\.dismiss) var dismiss

    
    var body: some View {
        VStack {
            NavigationView {
                VStack{
                    CustomDatePicker(selectedDate: $selectedDate)
                        .padding()
                    
                    if let selectedDate = selectedDate {
                        Text("Seçilen Tarih: \(formatDate(selectedDate))")
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
