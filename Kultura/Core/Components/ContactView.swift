//
//  ContactView.swift
//  Kultura
//
//  Created by Tural Babayev on 24.12.2024.
//

import SwiftUI

struct ContactView: View {
    
    var body: some View{
        VStack(spacing: 16) {
            // Call Center
            Text("Call Center")
                .font(AppFonts.customFont(name: "Poppins", size: 18))
                .frame(maxWidth: .infinity, alignment: .leading)

            HStack {
                Text("Coffemania")
                    .font(AppFonts.customFont(name: "Poppins", size: 14))
                
                Spacer()
                Button(action: {}) {
                    Image("global")
                        .padding(10)
                        .background(.white)
                        .cornerRadius(32)
                }
                Button(action: {}) {
                    Image("call")
                        .padding(10)
                        .background(.white)
                        .cornerRadius(32)
                }
            }
            .padding()
            .background(Color.gray.opacity(0.4))
            .cornerRadius(12)
            
            Divider()

            // Location
            Text("Location")
                .font(AppFonts.customFont(name: "Poppins", size: 18))
                .frame(maxWidth: .infinity, alignment: .leading)

            Button(action: {
                let urlString = "https://www.google.com/maps/search/?api=1&query=40.4093,49.8671"
                if let url = URL(string: urlString) {
                    UIApplication.shared.open(url)
                }
            }) {
                Image("mapGorsel") // Önceden yüklenmiş bir harita görseli
                    .resizable()
                    .scaledToFill()
                    .frame(height: 150)
                    .cornerRadius(12)
                    .clipped()
            }

            Divider()
            
            // Working Hours
            VStack(alignment: .leading, spacing: 8) {
                Text("Working Hours")
                    .font(AppFonts.customFont(name: "Poppins", size: 18))
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Text("Sunday - Saturday : 09:00 - 18:45")
                    .font(AppFonts.customFont(name: "Poppins", size: 14))
                    .foregroundColor(.gray)
            }

            Divider()
            // Chat Support
            HStack {
                Text("Kultura support")
                    .font(AppFonts.customFont(name: "Poppins", size: 14))
                Spacer()
                Button(action: {
                    print("Open Chat Tapped")
                }) {
                    Text("Open chat")
                        .font(AppFonts.customFont(name: "Poppins", size: 14))
                        .foregroundColor(.black)
                }
            }
        }
        .padding()
    }
}


#Preview {
    ContactView()
}

