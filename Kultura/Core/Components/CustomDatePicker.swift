//
//  CustomDatePicker.swift
//  Kultura
//
//  Created by Tural Babayev on 25.12.2024.
//

import SwiftUI

struct CustomDatePicker: View {
    @Binding var selectedDate: Date? // Seçilen tarihi dışarıdan yönetmek için Binding
    @State private var availabilityData: [Availability] = [] // Varsayılan olarak boş
    
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
                        .foregroundStyle(.black)
                }
                Text(monthYearText)
                    .font(.headline)
                Button(action: {
                    changeMonth(by: 1)
                }) {
                    Image(systemName: "chevron.right")
                        .foregroundStyle(.black)
                }
            }
            .padding(.horizontal)
            .padding(.top, 12)
            
            // Date Grid
            LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 7), spacing: 10) {
                ForEach(daysInMonth, id: \.self) { day in
                    let dayDate = dayToDate(day: day)
                    let availability = availabilityData.first(where: { isSameDay($0.date, dayDate) })
                    
                    Button(action: {
                        if availability?.isAvailable == true {
                            let strippedDate = stripTime(from: dayDate) // Sadece tarih bilgisi
                            if selectedDate == strippedDate {
                                selectedDate = nil // Seçim kaldırılıyor
                            } else {
                                selectedDate = strippedDate // Yeni tarih seçiliyor
                            }
                        }
                    }) {
                        Circle()
                            .frame(width: 30, height: 30)
                            .foregroundColor(colorForDate(availability, isSelected: selectedDate == stripTime(from: dayDate)))
                            .overlay(
                                Text("\(day)")
                                    .foregroundColor(.black)
                            )
                            .overlay {
                                RoundedRectangle(cornerRadius: 16)
                                    .stroke(.gray, lineWidth: 0.5)
                            }
                    }
                    .disabled(availability?.isAvailable == false) // Disable button for unavailable dates
                }
            }
            .padding(.top, 12)
            .padding(.bottom, 12)
            .padding(.horizontal)
        }
        .overlay(content: {
            RoundedRectangle(cornerRadius: 16)
                .stroke(.gray, lineWidth: 0.5)
        })
        .onAppear {
            initializeAvailabilityData()
        }
        .background(Color("appSecondary"))
    }
    
    private func initializeAvailabilityData() {
        // Varsayılan olarak tüm günleri rezerve edilebilir yapıyoruz
        let range = Calendar.current.range(of: .day, in: .month, for: currentMonth)!
        let dates = range.map { day -> Date in
            var components = Calendar.current.dateComponents([.year, .month], from: currentMonth)
            components.day = day
            return Calendar.current.date(from: components)!
        }
        
        // MOCK: Bazı günleri dolu yapalım
        let unavailableDates: [Date] = [
            dayToDate(day: 5),
            dayToDate(day: 10),
            dayToDate(day: 15)
        ]
        
        self.availabilityData = dates.map { date in
            Availability(date: date, isAvailable: !unavailableDates.contains(where: { isSameDay($0, date) }))
        }
    }
    
    private func changeMonth(by value: Int) {
        guard let newDate = Calendar.current.date(byAdding: .month, value: value, to: currentMonth) else { return }
        currentMonth = newDate
        initializeAvailabilityData() // Ay değiştiğinde tarihleri güncelle
    }
    
    private func dayToDate(day: Int) -> Date {
        var components = Calendar.current.dateComponents([.year, .month], from: currentMonth)
        components.day = day
        return Calendar.current.date(from: components) ?? Date()
    }
    
    private func stripTime(from date: Date) -> Date {
        let components = Calendar.current.dateComponents([.year, .month, .day], from: date)
        return Calendar.current.date(from: components) ?? date
    }
    
    private func isSameDay(_ date1: Date, _ date2: Date) -> Bool {
        Calendar.current.isDate(date1, inSameDayAs: date2)
    }
    
    private func colorForDate(_ availability: Availability?, isSelected: Bool) -> Color {
        if isSelected {
            return .purple
        }
        guard let availability = availability else {
            return .gray.opacity(0.2)
        }
        return availability.isAvailable ? Color("appSecondary") : .gray
    }
}

