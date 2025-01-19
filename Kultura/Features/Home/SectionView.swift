//
//  SectionView.swift
//  Kultura
//
//  Created by Tural Babayev on 22.12.2024.
//

import SwiftUI

struct SectionView: View {
    var title: String
    var items: [HomeRestaurantCardView]
    var seeAll: () -> Void
    
    
    var body: some View {
        let screenWidth = UIScreen.main.bounds.width // Ekran genişliği
        let cardWidth = (screenWidth / 2) - 24      // Her kartın genişliği
        let cardHeight = cardWidth * 1.2    // Kartın yüksekliği (oran: 0.6)
        
        VStack(alignment: .leading){
            HStack{
                Text(title)
                    .font(AppFonts.customFont(name: "Poppins-Medium", size: 20))
                
                Spacer()
                
                Button {
                    print("See All Clicked")
                } label: {
                    Text("See All")
                        .font(AppFonts.customFont(name: "Poppins-Medium", size: 12))
                        .foregroundStyle(.gray)
                        .frame(alignment: .center)
                }
            }
            .background(Color("appSecondary"))
            .padding(.horizontal, 20)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 16) {
                    ForEach(items.indices, id: \.self) { index in
                        items[index]
                            .frame(width: cardWidth, height: cardHeight)
                    }
                }
                .background(Color("appSecondary"))
                .padding(.horizontal, 16)
            }
            .background(Color("appSecondary"))
        }
        .background(Color("appSecondary"))
    }


}

