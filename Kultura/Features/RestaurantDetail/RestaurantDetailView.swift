//
//  RestaurantDetailView.swift
//  Kultura
//
//  Created by Tural Babayev on 24.12.2024.
//

import SwiftUI

struct RestaurantDetailView: View {
    @Environment(\.dismiss) var dismiss // Geri dönüş
    
    //Variables
    @State private var selectedTab: RestaurantTab = .menu
    @State private var selectedImageIndex = 0
    @State private var isFavorited = false
    
    
    private let restaurantImages = [
            "r1", // Resim adlarını buraya ekleyin
            "r1",
            "r1"
        ]
    
    var body : some View {
        NavigationView {
            VStack(spacing: 0){
                ZStack(alignment: .top){
                    TabView(selection: $selectedImageIndex){
                        ForEach(restaurantImages.indices, id: \.self){index in
                            Image(restaurantImages[index])
                                .resizable()
                                .scaledToFill()
                                .frame(height: 200)
                                .clipped()
                                .tag(index)
                        }
                    }
                    .tabViewStyle(PageTabViewStyle())
                    .frame(height: 200)
                    
                    
                    HStack{
                        Button {
                            dismiss()
                        } label: {
                            Image(systemName: "chevron.left")
                                .font(.title2)
                                .foregroundColor(.black)
                                .padding(8)
                                .background(Color.white)
                                .clipShape(Circle())
                                .shadow(radius: 2)
                        }
                        .padding(.leading, 16)

                        Spacer()
                        
                        // Favori Butonu
                        Button(action: {
                            isFavorited.toggle()
                        }) {
                            Image(systemName: isFavorited ? "heart.fill" : "heart")
                                .font(.title2)
                                .foregroundColor(isFavorited ? .red : .black)
                                .padding(8)
                                .background(Color.white)
                                .clipShape(Circle())
                                .shadow(radius: 2)
                        }
                        .padding(.trailing, 16)
                    }
                    .padding(.top, 16)
                    
                    HStack(alignment: .bottom){
                        Spacer()
                        Text("\(selectedImageIndex + 1)/\(restaurantImages.count)")
                            .font(.caption)
                            .foregroundColor(.white)
                            .padding(8)
                            .background(Color.black.opacity(0.6))
                            .cornerRadius(8)
                            .padding(.trailing, 16)
                    }
                    .padding(.top, 160)

                }
                
                
            }
        }
    }
}

#Preview {
    RestaurantDetailView()
}
