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
        VStack(spacing: 0) {
            // Sayfa İçeriği
            ZStack {
                switch selectedTab {
                case .home:
                    HomeView()
                case .map:
                    Text("Map")
                case .profile:
                    ProfileView()
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

enum Tab: Hashable {
    case home, map, profile
}

#Preview {
    TabBarView()
}

