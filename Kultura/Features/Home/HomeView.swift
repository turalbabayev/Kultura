//
//  HomeView.swift
//  Kultura
//
//  Created by Tural Babayev on 22.12.2024.
//

import SwiftUI
import Resolver

struct HomeView: View {
    @InjectedObject private var viewModel: HomeViewModel
    
    var body: some View {
        NavigationView {
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
                                print("Acc Tokenim: \(AuthManager.shared.getToken() ?? "N/A")")
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
                    
                    // Popular Right Now Section
                    SectionView(title: "Popular Right Now", items: viewModel.restaurants.map { restaurant in
                        HomeRestaurantCardView(
                            restaurant: restaurant,
                            actionText: "Reserve now"
                        )
                    }, seeAll: {})
                }
            }
            .onAppear {
                viewModel.fetchRestaurants()
            }
            .overlay {
                if viewModel.isLoading {
                    ProgressView()
                }
            }
            .alert("Hata", isPresented: .constant(viewModel.errorMessage != nil)) {
                Button("Tamam", role: .cancel) {
                    viewModel.errorMessage = nil
                }
            } message: {
                Text(viewModel.errorMessage ?? "")
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .padding(.top, 20)
            .background(Color("appSecondary"))
        }
        .navigationBarBackButtonHidden(true)
        
    }
}

#Preview{
    HomeView()
}
