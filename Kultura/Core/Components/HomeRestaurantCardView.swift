//
//  HomeRestaurantCardView.swift
//  Kultura
//
//  Created by Tural Babayev on 22.12.2024.
//

import SwiftUI

struct HomeRestaurantCardView: View {
    let restaurant: UIRestaurant
    let actionText: String
    
    var body: some View {
        VStack(alignment: .leading){
            ZStack(alignment: .topTrailing){
                if let mainPhoto = restaurant.mainPhotoURL {
                    AsyncImageView(url: mainPhoto)
                        .frame(height: 130)
                        .cornerRadius(12)
                        .clipped()
                } else {
                    Image("placeholder")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(height: 130)
                        .cornerRadius(12)
                        .clipped()
                }
                
                Button(action: {
                    print("\(restaurant.name) favorilere eklendi.")
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
            
            Text(restaurant.name)
                .font(.system(size: 16, weight: .bold))
                .lineLimit(1)
            
            HStack(spacing: 4) {
                Text("|")
                    .font(.system(size: 14))
                    .foregroundColor(.black)
                Image(systemName: "star.fill")
                    .foregroundColor(.yellow)
                    .font(.system(size: 14))
                Text(String(format: "%.1f", restaurant.rating))
                    .font(.system(size: 14))
                    .foregroundColor(.black)
            }
            
            Text(actionText)
                .font(.system(size: 14, weight: .regular))
                .foregroundColor(.black)

            Spacer()
        }
        .background(Color("appSecondary"))
        .cornerRadius(12)
    }
}

