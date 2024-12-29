//
//  RestaurantMapView.swift
//  Kultura
//
//  Created by Tural Babayev on 27.12.2024.
//

import SwiftUI

struct RestaurantMapView: View {
    @Environment(\.dismiss) var dismiss

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
        ]),
        Floor(id: 4, name: "4th Floor", tables: [
            TableModel(id: 9, type: .fiveSeat, x: 150, y: 150, isOccupied: true)
        ])
    ]
    
    @State private var selectedFloor = 1 // Varsayılan olarak ilk kat

    var body: some View {
        NavigationView {
            VStack(spacing: 4){
                // Kat seçimi sekmesi
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(floors) { floor in
                            Button(action: {
                                selectedFloor = floor.id
                            }) {
                                Text(floor.name)
                                    .font(AppFonts.customFont(name: "Poppins", size: 14))
                                    .padding(.horizontal, 24)
                                    .padding(4.5)
                                    .background(floor.id == selectedFloor ? Color.gray : .clear)
                                    .foregroundColor(floor.id == selectedFloor ? Color.white : Color.gray)
                                    .cornerRadius(16)
                                    .overlay {
                                        RoundedRectangle(cornerRadius: 16)
                                            .stroke(.gray, lineWidth: 1)
                                    }
                            }
                        }
                    }
                    .padding()
                }
                
                HStack {
                    Circle().fill(Color.white).frame(width: 14, height: 14).overlay(Circle().stroke(Color.gray, lineWidth: 0.5))
                    Text("Reserved").font(AppFonts.customFont(name: "Poppins-Regular", size: 12))
                    
                    Circle().fill(Color.gray).frame(width: 14, height: 14)
                    Text("Selected").font(AppFonts.customFont(name: "Poppins-Regular", size: 12))
                    
                    Circle().fill(Color.gray.opacity(0.4)).frame(width: 14, height: 14)
                    Text("Available").font(AppFonts.customFont(name: "Poppins-Regular", size: 12))
                }
                
                // Harita görünümü (sürüklenebilir alan)
                if let floor = floors.first(where: { $0.id == selectedFloor }) {
                    ScrollView([.horizontal, .vertical], showsIndicators: false) {
                        ZStack(alignment: .topLeading) {
                            // Harita arka planı
                            Color.gray.opacity(0.1)
                                .frame(width: 600, height: 650) // Harita genişliği ve yüksekliği
                            
                            // Masaların yerleşimi
                            ForEach(floor.tables) { table in
                                tableView(for: table)
                                    .position(x: table.x + 50, y: table.y + 65) // İçeriği gri alanın içine taşır
                            }
                        }
                    }
                    .padding(.top, 8)
                    .frame(maxHeight: .infinity)
                }
                
                HStack(alignment: .bottom){
                    NavigationLink(destination: TicketView()) {
                        Text("Continue")
                            .font(AppFonts.customFont(name: "Poppins-Regular", size: 16))
                            .frame(maxWidth: 150) // Buton genişliği
                            .padding()
                            .background(Color(UIColor.systemGray4))
                            .cornerRadius(24)
                            .foregroundColor(.black)
                            .padding()
                    }
                }
                .frame(maxWidth: .infinity)
                .background(.white)
            }
            .frame(maxWidth: .infinity)
            .navigationBarTitleDisplayMode(.inline)
            .background(Color("appSecondary"))
            .toolbar {
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
        }
        .background(.clear)
        
        
    }
    
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




/*
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
 */
