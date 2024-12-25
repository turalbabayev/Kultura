//
//  CustomDatePicker.swift
//  Kultura
//
//  Created by Tural Babayev on 25.12.2024.
//

import SwiftUI

struct CustomDatePicker: View {
    @Binding var selectedDate: Date? // Seçilen tarihi dışarıdan yönetmek için Binding
    let availabilityData: [Availability] // Dışarıdan veri sağlamak için
    
    @State private var currentMonth: Date = Date() // Component'in kendi durumu
    
    private var daysInMonth: [Int] {
        let range = Calendar.current.range(of: .day, in: .month, for: currentMonth)!
        return Array(range)
    }
    
    private var monthYearText: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMMM"
        return formatter.string(from: currentMonth)
    }
    
    var body: some View {
        VStack {
            // Month navigation
            HStack {
                Button(action: {
                    changeMonth(by: -1)
                }) {
                    Image(systemName: "chevron.left")
                        .foregroundColor(.black)
                }
                Text(monthYearText)
                    .font(.headline)
                Button(action: {
                    changeMonth(by: 1)
                }) {
                    Image(systemName: "chevron.right")
                        .foregroundColor(.black)
                }
            }
            .padding(.horizontal)
            .padding()
            
            // Date Grid
            LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 7), spacing: 10) {
                ForEach(daysInMonth, id: \.self) { day in
                    let dayDate = dayToDate(day: day)
                    let availability = availabilityData.first(where: { isSameDay($0.date, dayDate) })
                    
                    Button(action: {
                        if availability?.isAvailable == true {
                            if selectedDate == dayDate {
                                selectedDate = nil // Seçim kaldırılıyor
                            } else {
                                selectedDate = dayDate // Yeni tarih seçiliyor
                            }
                        }
                    }) {
                        Circle()
                            .frame(width: 40, height: 40)
                            .foregroundColor(colorForDate(availability, isSelected: selectedDate == dayDate))
                            .overlay(
                                Text("\(day)")
                                    .foregroundColor(.black)
                            )
                    }
                    .disabled(availability?.isAvailable == false) // Disable button for unavailable dates
                }
            }
            .padding(.vertical, 20)
            .padding(.horizontal)
        }
        .overlay {
            RoundedRectangle(cornerRadius: 16)
                .stroke( .gray , lineWidth: 0.5)
        }
    }
    
    private func changeMonth(by value: Int) {
        guard let newDate = Calendar.current.date(byAdding: .month, value: value, to: currentMonth) else { return }
        currentMonth = newDate
    }
    
    private func dayToDate(day: Int) -> Date {
        var components = Calendar.current.dateComponents([.year, .month], from: currentMonth)
        components.day = day
        return Calendar.current.date(from: components) ?? Date()
    }
    
    private func isSameDay(_ date1: Date, _ date2: Date) -> Bool {
        Calendar.current.isDate(date1, inSameDayAs: date2)
    }
    
    private func colorForDate(_ availability: Availability?, isSelected: Bool) -> Color {
        if isSelected {
            return .blue
        }
        guard let availability = availability else {
            return .gray.opacity(0.2)
        }
        return availability.isAvailable ? .green : .gray
    }
}

