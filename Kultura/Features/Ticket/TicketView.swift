//
//  TicketView.swift
//  Kultura
//
//  Created by Tural Babayev on 24.12.2024.
//

import SwiftUI

struct TicketView: View {
    var body: some View {
        
        Text("Ticket")
            .font(.title3)
            .padding(.top, 16)
            .frame(alignment: .center)
        
        ZStack {
            // Arka plan görseli
            Image("ticketView") // Arka plan resminizin adını burada kullanın
                .resizable()
                .scaledToFit()
                .padding()
            
            // Üstüne yazı eklenmesi
            VStack(spacing: 20) {
                // Üst bilgi
                VStack(alignment: .leading, spacing: 10) {
                    ticketRow(title: "Name", value: "Kamran Hasanli")
                    ticketRow(title: "Görüşün adı", value: "Business lunch")
                    ticketRow(title: "Guests", value: "2 guests")
                    ticketRow(title: "Date", value: "15 January")
                    ticketRow(title: "Time", value: "15:30")
                    ticketRow(title: "Table", value: "#011")
                }
                .padding(.horizontal, 30)
                .padding(.top, 50) // Görselin üst kısmına hizalamak için
                
                Spacer()
                Spacer()
                Spacer()
                
                // Alt bilgi (ID)
                Text("ID - 251")
                    .font(.headline)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(10)
                    .shadow(radius: 2)
                    .padding(.bottom, 30) // Görselin alt kısmına hizalamak için
                    .padding(.horizontal)
                    .frame(maxWidth: .infinity)
                
                Spacer()
            }
            .padding()
            .padding(.top, 40)
            .padding(.bottom, 32)
            
            // Kesikli çizgi
            DashedLine()
                .stroke(style: StrokeStyle(lineWidth: 1, dash: [5]))
                .frame(height: 1)
                .foregroundColor(.gray)
                .padding(.horizontal)
        }
        //.edgesIgnoringSafeArea(.all) // Arka planın ekranı kaplaması için
    }
    
    // Tek satırlık bilgi satırları
    func ticketRow(title: String, value: String) -> some View {
        HStack {
            Text(title)
                .foregroundColor(.gray)
            Spacer()
            Text(value)
                .bold()
        }
    }
}

struct DashedLine: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: rect.minX, y: rect.midY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.midY))
        return path
    }
}


#Preview {
    TicketView()
}
