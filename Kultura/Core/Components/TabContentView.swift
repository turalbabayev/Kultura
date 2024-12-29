//
//  TabContentView.swift
//  Kultura
//
//  Created by Tural Babayev on 24.12.2024.
//

import SwiftUI

struct TabContentView: View {
    let selectedTab: RestaurantTab
    
    var body: some View {
        VStack{
            switch selectedTab {
            case .menu:
                Text("Menu Content").font(.title2).padding()
            case .reviews:
                ReviewsView()
            case .contact:
                ScrollView(showsIndicators: false) {
                    ContactView()
                }
            }
        }
    }
}
