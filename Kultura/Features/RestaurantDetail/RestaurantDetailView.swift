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
                
                
                VStack(alignment: .leading, spacing: 8){
                    HStack{
                        Text("Popular")
                            .font(.subheadline)
                            .padding(8)
                            .background(Color.gray.opacity(0.2))
                            .cornerRadius(24)

                        Spacer()
                        
                        Text("⭐️ 5.0 (45 Reviews)")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                    
                    HStack{
                        Text("Coffemania Narimanov")
                            .font(.title2)
                            .fontWeight(.bold)
                    }
                    
                    VStack {
                        Text("⏰ Open until: 22:00")
                        Text("💰 Average Price: 30-40 AZN")
                        Text("🍴 Cuisine: Turkish")
                    }
                    .font(.subheadline)
                    .foregroundColor(.gray)
                    
                }
                .padding()
                .background(Color("appSecondary"))
                .cornerRadius(16)
                .padding(.top, -16)
                
                // Tab Seçimi
                HStack(spacing: 16) {
                    ForEach(RestaurantTab.allCases, id: \.self) { tab in
                        Button(action: {
                            selectedTab = tab
                        }) {
                            Text(tab.rawValue)
                                .font(AppFonts.customFont(name: "Poppins", size: 14))
                                .padding(.vertical, 2)
                                .padding(.horizontal, 16)
                                .background(selectedTab == tab ? Color.gray : Color.clear)
                                .cornerRadius(16)
                                .foregroundColor(selectedTab == tab ? Color.white : Color.gray)
                                .overlay {
                                    RoundedRectangle(cornerRadius: 16)
                                        .stroke(.gray, lineWidth: 0.5)
                                }
                        }
                    }
                }
                .background(Color("appSecondary"))
                .padding(.horizontal)
                
                Divider()
                    .padding(.vertical, 16)
                
                Spacer()

                TabContentView(selectedTab: selectedTab)
                
                // Alt buton
                ZStack{
                    Button(action: {
                        print("Reserve a table tapped")
                    }) {
                        Text("Reserve a table")
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.gray.opacity(0.2))
                            .cornerRadius(16)
                            .foregroundColor(.black)
                            .padding(.horizontal)
                    }
                    .padding(.vertical, 16)
                }
                .background(.white)
                .padding(.top, 16)
                
            }
            .background(Color("appSecondary"))
        }
    }
}

#Preview {
    RestaurantDetailView()
}
