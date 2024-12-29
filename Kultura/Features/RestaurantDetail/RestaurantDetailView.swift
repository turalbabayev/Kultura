//
//  RestaurantDetailView.swift
//  Kultura
//
//  Created by Tural Babayev on 24.12.2024.
//

import SwiftUI

struct RestaurantDetailView: View {
    @Environment(\.dismiss) var dismiss
    @State private var selectedTab: RestaurantTab = .menu
    @State private var selectedImageIndex = 0
    @State private var isFavorited = false

    private let restaurantImages = ["r2", "r2", "r2"]
    
    var body : some View {
        NavigationView {
            VStack(spacing: 0){
                ZStack(alignment: .top){
                    TabView(selection: $selectedImageIndex){
                        ForEach(restaurantImages.indices, id: \.self) { index in
                            Image(restaurantImages[index])
                                .resizable()
                                .scaledToFill()
                                .frame(width: UIScreen.main.bounds.width, height: 350)
                                .clipped()
                                .tag(index)
                        }
                    }
                    .tabViewStyle(PageTabViewStyle())
                    .frame(height: 270)
                    .ignoresSafeArea(edges: .top) // Safe area dışına taşıyoruz

                    
                    
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
                    .padding(.top, 8)
                    
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
                    .padding(.top, 130)
                }
                
                
                VStack(alignment: .leading, spacing: 8){
                    HStack{
                        Text("Popular")
                            .font(AppFonts.customFont(name: "Poppins", size: 10))
                            .padding(.horizontal, 12)
                            .padding(4.5)
                            .background(Color.gray.opacity(0.2))
                            .cornerRadius(24)

                        Spacer()
                        
                        InfoRowView(imageName: "star", title: "5.0", value: "(45 Reviews)", valueColor: .gray)
                        
                    }
                    
                    HStack{
                        Text("Coffemania Narimanov")
                            .font(AppFonts.customFont(name: "Poppins", size: 20))
                    }
                    
                    VStack(alignment: .leading, spacing: 8) {
                        InfoRowView(imageName: "clock", title: "Open until:", value: "22:00", valueColor: .gray)
                        InfoRowView(imageName: "dollar-circle", title: "Average Price:", value: "30-40 AZN", valueColor: .gray)
                        InfoRowView(imageName: "dollar-circle", title: "Cuisine", value: "Turkish", valueColor: .gray)
                    }
                    
                    
                }
                .padding()
                .background(Color("appSecondary"))
                .cornerRadius(16)
                .padding(.top, -100)
                
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
                    .padding(.top, 16)
                    .padding(.horizontal)
                
                Spacer()

                TabContentView(selectedTab: selectedTab)
                
                // Alt buton
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
            .background(Color("appSecondary"))
        }
    }
}

#Preview {
    RestaurantDetailView()
}
