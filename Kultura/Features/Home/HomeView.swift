//
//  HomeView.swift
//  Kultura
//
//  Created by Tural Babayev on 22.12.2024.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationStack{
            ScrollView {
                VStack(alignment: .leading, spacing: 16){
                    HStack{
                        Text("Baku,\nAzerbaijan")
                            .font(AppFonts.customFont(name: "Poppins-Medium", size: 29))
                            .foregroundColor(.black)
                            .multilineTextAlignment(.leading)
                        
                        Spacer()
                        
                        ZStack{
                            Circle()
                                .fill(Color.white)
                                .frame(width: 50, height: 50)
                                .shadow(color: Color.black.opacity(0.2), radius: 4, x: 0, y: 2)

                            
                            Button(action: {
                                print("My Reservations")
                            }) {
                                Image("bill")
                                    .font(.system(size: 20, weight: .medium))
                                    .foregroundColor(.gray)
                            }
                        }
                    }
                    .padding(.horizontal, 20)
                    
                    KulturaSearchTextField(isSearchPage: true)
                    
                    SectionView(title: "Popular Right Now", items: [
                        HomeRestaurantCardView(imageName: "placeholder", title: "Qaynana Restaurant", rating: 4.7, actionText: "Reserve now"),
                        HomeRestaurantCardView(imageName: "placeholder", title: "Coffemania Narimanov", rating: 5.0, actionText: "Reserve now"),
                        HomeRestaurantCardView(imageName: "placeholder", title: "Coffemania Narimanov", rating: 5.0, actionText: "Reserve now")
                    ], seeAll: {})

                    SectionView(title: "Offers near you", items: [
                        HomeRestaurantCardView(imageName: "placeholder", title: "Early Bird Cafe", rating: 4.5, actionText: "Reserve now"),
                        HomeRestaurantCardView(imageName: "placeholder", title: "Morning Glory", rating: 4.9, actionText: "Reserve now"),
                        HomeRestaurantCardView(imageName: "placeholder", title: "Morning Glory", rating: 4.9, actionText: "Reserve now"),
                        
                    ], seeAll: {})
                    
                    SectionView(title: "Breakfast", items: [
                        HomeRestaurantCardView(imageName: "placeholder", title: "Early Bird Cafe", rating: 4.5, actionText: "Reserve now"),
                        HomeRestaurantCardView(imageName: "placeholder", title: "Morning Glory", rating: 4.9, actionText: "Reserve now"),
                        HomeRestaurantCardView(imageName: "placeholder", title: "Morning Glory", rating: 4.9, actionText: "Reserve now"),
                        
                    ], seeAll: {})
                }
                
                

            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .padding(.top, 20)
            .background(Color("appSecondary"))
        }
        
    }
}

#Preview{
    HomeView()
}
