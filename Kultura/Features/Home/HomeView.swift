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
