//
//  CustomButton.swift
//  Kultura
//
//  Created by Tural Babayev on 21.12.2024.
//

import SwiftUI

struct CustomButton: View {
    var title: String
    var action: () -> Void
    var backgroundColor: Color = Color.blue
    var foregroundColor: Color = Color.white
    var cornerRadius: CGFloat = 16
    var font: Font?
    var icon: String? // İkon ismi (SF Symbol)
    
    var body: some View {
        Button(action: action) {
            HStack {
                if let icon = icon {
                    Image(systemName: icon)
                        .foregroundStyle(foregroundColor)
                }
                Text(title)
                    .foregroundStyle(foregroundColor)
            }
            .padding(16)
            .frame(maxWidth: .infinity)
            .background(backgroundColor)
            .cornerRadius(cornerRadius)
        }
    }
}

/*
 .padding(16)
 .frame(maxWidth: .infinity)
 .background(.white)
 .cornerRadius(70)
 .foregroundStyle(.black)
 .overlay {
     RoundedRectangle(cornerRadius: 70)
         .stroke(.gray, lineWidth: 0.5)
 }
 */
