//
//  CustomRestaurantView.swift
//  Kultura
//
//  Created by Tural Babayev on 24.12.2024.
//

import SwiftUI

struct Restaurant: Identifiable {
    let id = UUID()
    let name: String
    let rating: Double
    let priceRange: String
    let image: Image
    let leftIcon: Image? // Sol taraftaki ikon (isteğe bağlı)
    let rightIcon: Image? // Sağ taraftaki ikon (isteğe bağlı)
    let leftIconColor: Color? // Sol ikon için renk (isteğe bağlı)
    let hasBorder: Bool // Border olup olmayacağı
}

struct CustomRestaurantView: View {
    let restaurant: Restaurant
    let onLeftIconTap: (() -> Void)? // Sol ikon tıklama
    let onRightIconTap: (() -> Void)? // Sağ ikon tıklama

    var body: some View {
        let screenWidth = UIScreen.main.bounds.width - 32 // Kenarlardan 16 piksel padding
        HStack(spacing: 12){
            //Sol Icon
            if let lefticon = restaurant.leftIcon {
                Button {
                    onLeftIconTap?()
                } label: {
                    lefticon
                        .resizable()
                        .frame(width: 16, height: 16)
                        .foregroundColor(restaurant.leftIconColor ?? .gray)

                }

            }
            
            // Restoran Görseli
            restaurant.image
                .resizable()
                .frame(width: 85, height: 60)
                .cornerRadius(8)
                .background(Color.gray.opacity(0.2))
                .scaledToFill()
                .clipped()
            
            //Restoran Bilgileri
            VStack(alignment: .leading, spacing: 4){
                Text(restaurant.name)
                    .font(AppFonts.customFont(name: "Poppins-Semibold", size: 14))
                    .foregroundColor(.black)
                
                VStack(alignment: .leading,spacing: 4){
                    HStack(spacing: 4){
                        Image(systemName: "star.fill")
                            .foregroundColor(.yellow)
                            .font(.system(size: 14))
                        Text(String(format: "%.1f", restaurant.rating))
                            .font(.system(size: 14, weight: .regular))
                            .foregroundColor(.black)
                    }
                    
                    HStack(spacing: 4) {
                        Image(systemName: "dollarsign.circle")
                            .foregroundColor(.black)
                            .font(.system(size: 14))
                        Text(restaurant.priceRange)
                            .font(.system(size: 14, weight: .regular))
                            .foregroundColor(.gray)
                    }
                }
                
            }
            
            Spacer() // Sağdaki boşluk

            
            // Sağ İkon
            if let rightIcon = restaurant.rightIcon {
                Button(action: {
                    onRightIconTap?()
                }) {
                    rightIcon
                        .resizable()
                        .frame(width: 16, height: 16)
                        .foregroundColor(.gray)

                }
            }
        }
        .padding(16)
        .frame(width: screenWidth)
        .cornerRadius(12)
        .overlay(
            RoundedRectangle(cornerRadius: 12)
                .stroke(
                    restaurant.hasBorder ? Color.gray.opacity(0.4) : Color.clear, // Border durumu
                    lineWidth: 1
                )
        )
        .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 2)
    }
}

