//
//  InfoRowView.swift
//  Kultura
//
//  Created by Tural Babayev on 29.12.2024.
//

import SwiftUI

struct InfoRowView: View {
    let imageName: String
    let title: String
    let value: String
    let valueColor: Color
    
    var body: some View {
        HStack(spacing: 4) {
            Image(imageName)
                .resizable()
                .frame(width: 16, height: 16)
            Text(title)
                .font(AppFonts.customFont(name: "Poppins", size: 14))
                .foregroundColor(.black)
            Text(value)
                .font(AppFonts.customFont(name: "Poppins", size: 14))
                .foregroundColor(valueColor)
        }
    }
}
