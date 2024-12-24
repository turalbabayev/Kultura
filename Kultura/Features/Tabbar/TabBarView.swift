//
//  TabBarView.swift
//  Kultura
//
//  Created by Tural Babayev on 22.12.2024.
//

import SwiftUI

struct TabBarView: View {
    @State private var selectedTab: Tab = .home
    
    var body: some View {
        
        NavigationStack{
            
            VStack(spacing: 0) {
                // Sayfa İçeriği
                ZStack {
                    switch selectedTab {
                    case .home:
                        HomeView()
                    case .map:
                        Text("Map")
                    case .profile:
                        ProfileView(restaurants: [
                            Restaurant(
                                name: "Agabala Restaurant",
                                rating: 5.0,
                                priceRange: "120-150 AZN",
                                image: Image("r1"),
                                leftIcon: .none,
                                rightIcon: .none,
                                leftIconColor: .none,
                                hasBorder: false // Border yok
                            ),
                            Restaurant(
                                name: "Coffelea Khatai",
                                rating: 4.3,
                                priceRange: "30-40 AZN",
                                image: Image("r1"),
                                leftIcon: .none,
                                rightIcon: .none,
                                leftIconColor: .red,
                                hasBorder: false // Border var
                            )
                        ])
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                
                // Özel TabBar
                HStack {
                    TabBarItem(
                        icon: "home-2",
                        title: "Home",
                        isSelected: selectedTab == .home
                    ) {
                        selectedTab = .home
                    }
                    TabBarItem(
                        icon: "map-1",
                        title: "Map",
                        isSelected: selectedTab == .map
                    ) {
                        selectedTab = .map
                    }
                    TabBarItem(
                        icon: "profile",
                        title: "Profile",
                        isSelected: selectedTab == .profile
                    ) {
                        selectedTab = .profile
                    }
                }
                .padding(.horizontal, 24)
                .padding(.vertical, 16)
                .background(.white)// Arka plan ve gölge
                .frame(alignment: .center)
                
            }
            .ignoresSafeArea(.keyboard, edges: .bottom) // Klavyeyi görmezden gelir
            .navigationBarHidden(true) // TabBarView'da navigation bar'ı gizle
        }
        

    }
}

enum Tab: Hashable {
    case home, map, profile
}

#Preview {
    TabBarView()
}

