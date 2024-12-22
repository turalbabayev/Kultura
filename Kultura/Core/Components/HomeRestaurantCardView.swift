//
//  HomeRestaurantCardView.swift
//  Kultura
//
//  Created by Tural Babayev on 22.12.2024.
//

import SwiftUI

struct HomeRestaurantCardView: View {
    var imageName: String
    var title: String
    var rating: Double
    var actionText: String
    

    var body: some View {
        VStack(alignment: .leading){
            ZStack(alignment: .topTrailing){
                Rectangle()
                    .fill(Color.gray.opacity(0.2))
                    .cornerRadius(12)
                    .frame(height: 130) // Kartın resim alanı yüksekliği
                
                Button(action: {
                    // Favori ekleme işlemi
                    print("\(title) favorilere eklendi.")
                }) {
                    Image(systemName: "heart")
                        .foregroundColor(.gray)
                        .padding(8)
                        .background(Color.white)
                        .clipShape(Circle())
                        .shadow(radius: 2)
                }
                .padding(8)
            }
            
            Text(title)
                .font(.system(size: 16, weight: .bold))
                .lineLimit(1)
            
            HStack(spacing: 4) {
                Text("|")
                    .font(.system(size: 14))
                    .foregroundColor(.black)
                Image(systemName: "star.fill")
                    .foregroundColor(.yellow)
                    .font(.system(size: 14))
                Text(String(format: "%.1f", rating))
                    .font(.system(size: 14))
                    .foregroundColor(.black)
            }
            
            Text(actionText)
                .font(.system(size: 14, weight: .regular))
                .foregroundColor(.black)

            Spacer()
        }
        //.padding()
        .background(Color("appSecondary"))
        .cornerRadius(12)
        //.shadow(color: Color.black.opacity(0.1), radius: 4, x: 0, y: 2)
    }
}


#Preview {
    HomeRestaurantCardView(imageName: "", title: "Qaynana Restoran", rating: 4.8, actionText: "Reserve Now")
}
