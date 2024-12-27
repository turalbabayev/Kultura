//
//  RestaurantMapView.swift
//  Kultura
//
//  Created by Tural Babayev on 27.12.2024.
//

import SwiftUI

struct RestaurantMapView: View {
    // Kat bilgileri (Her kat için masalar)
    let floors: [Floor] = [
        Floor(id: 1, name: "1st Floor", tables: [
            TableModel(id: 1, type: .fiveSeat, x: 40, y: 0, isOccupied: true),
            TableModel(id: 2, type: .fiveSeat, x: 140, y: 0, isOccupied: false),
            TableModel(id: 3, type: .fourSeat, x: 200, y: 200, isOccupied: true),
            TableModel(id: 4, type: .twoSeat, x: 50, y: 300, isOccupied: false),
            TableModel(id: 8, type: .fiveSeat, x: 240, y: 0, isOccupied: false),
        ]),
        Floor(id: 2, name: "2nd Floor", tables: [
            TableModel(id: 5, type: .fiveSeat, x: 100, y: 100, isOccupied: false),
            TableModel(id: 6, type: .fourSeat, x: 300, y: 300, isOccupied: false)
        ]),
        Floor(id: 3, name: "3rd Floor", tables: [
            TableModel(id: 7, type: .fiveSeat, x: 150, y: 150, isOccupied: true)
        ])
    ]
    
    @State private var selectedFloor = 1 // Varsayılan olarak ilk kat

    var body: some View {
        VStack(spacing: 16) {
            // Üst başlık ve kat seçimi
            Text("Reserve a table")
                .font(.title)
                .bold()
            
            // Kat seçimi sekmesi
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(floors) { floor in
                        Button(action: {
                            selectedFloor = floor.id
                        }) {
                            Text(floor.name)
                                .padding()
                                .background(floor.id == selectedFloor ? Color.gray : Color.gray.opacity(0.3))
                                .foregroundColor(.white)
                                .cornerRadius(10)
                        }
                    }
                }
                .padding(.horizontal)
            }
            
            // Harita görünümü (sürüklenebilir alan)
            if let floor = floors.first(where: { $0.id == selectedFloor }) {
                ScrollView([.horizontal, .vertical], showsIndicators: true) {
                    ZStack(alignment: .topLeading) {
                        // Harita arka planı
                        Color.gray.opacity(0.1)
                            .frame(width: 600, height: 600) // Harita genişliği ve yüksekliği
                        
                        // Masaların yerleşimi
                        ForEach(floor.tables) { table in
                            tableView(for: table)
                                .position(x: table.x + 50, y: table.y + 65) // İçeriği gri alanın içine taşır
                        }
                    }
                }
                .frame(height: 400) // Haritanın görüneceği alanın yüksekliği
            }
            
            // Alt bilgi ve "Devam" düğmesi
            VStack(spacing: 8) {
                HStack {
                    Circle().fill(Color.gray).frame(width: 16, height: 16)
                    Text("Reserved").font(.footnote)
                    
                    Circle().fill(Color.blue).frame(width: 16, height: 16)
                    Text("Selected").font(.footnote)
                    
                    Circle().fill(Color.white).frame(width: 16, height: 16).overlay(Circle().stroke(Color.gray, lineWidth: 1))
                    Text("Available").font(.footnote)
                }
                
                Button(action: {
                    // Devam butonu aksiyonu
                }) {
                    Text("Continue")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.gray.opacity(0.3))
                        .cornerRadius(10)
                }
            }
            .padding()
        }
        .padding(.top)
    }
    
    // Farklı masa türlerine göre uygun görünümü döndüren fonksiyon
    @ViewBuilder
    private func tableView(for table: TableModel) -> some View {
        switch table.type {
        case .fiveSeat:
            FiveSeatTableView(isOccupied: table.isOccupied)
        case .fourSeat:
            FourSeatTableView(isOccupied: table.isOccupied)
        case .twoSeat:
            twoSeatTableView(isOccupied: table.isOccupied)
        }
    }
}

#Preview {
    RestaurantMapView()
}
