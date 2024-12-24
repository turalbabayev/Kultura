//
//  CustomListView.swift
//  Kultura
//
//  Created by Tural Babayev on 23.12.2024.
//

import SwiftUI

struct CustomListView: View {
    let items: [ListItem]
    
    var body: some View {
        VStack(spacing: 0){
            ForEach(items, id: \.id) { item in
                NavigationLink(destination: item.destination){
                    HStack{
                        Text(item.title)
                            .font(AppFonts.customFont(name: "Poppins-Regular", size: 16))

                        Spacer()
                        
                        Image(systemName: "chevron.right")
                            .foregroundColor(.gray)
                        
                    }
                    .padding()
                    .background(Color("appSecondary"))
                }
                .buttonStyle(PlainButtonStyle()) // Varsayılan tıklama efektini kaldırır

                
            }
        }
        .background(Color("appSecondary"))
        .cornerRadius(12)
        .overlay(
            RoundedRectangle(cornerRadius: 12)
                .stroke(Color.gray.opacity(0.2), lineWidth: 1)
        )
        .padding(.horizontal)
    }
}

#Preview {
    CustomListView(items: [
        ListItem(title: "Reservasyonlarim", destination: AnyView(HomeView())),
        ListItem(title: "Reservasyonlarim", destination: AnyView(HomeView())),
        ListItem(title: "Reservasyonlarim", destination: AnyView(HomeView()))
    ])
}
