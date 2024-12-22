//
//  TabBarItem.swift
//  Kultura
//
//  Created by Tural Babayev on 22.12.2024.
//

//
//  TabBarItem.swift
//  Kultura
//
//  Created by Tural Babayev on 22.12.2024.
//

import SwiftUI

struct TabBarItem: View {
    let icon: String
    let title: String
    let isSelected: Bool
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            HStack(spacing: 8) {
                Image(icon)
                    .font(.system(size: 24))
                    .foregroundColor(isSelected ? .black : .gray)
                
                if isSelected {
                    Text(title)
                        .font(.system(size: 14, weight: .medium))
                        .foregroundColor(.black)
                }
            }
            .padding(16)
            .background(isSelected ? Color.gray.opacity(0.2) : Color.clear)
            .cornerRadius(24)
        }
    }
}
#Preview {
    TabBarItem(icon: "person.crop.circle", title: "Profile", isSelected: true) {}
}
