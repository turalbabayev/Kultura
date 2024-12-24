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
            .frame(height: 65)
        }
    }
}


struct CustomButton2: View {
    var title: String
    var action: () -> Void
    var backgroundColor: Color = Color.blue
    var foregroundColor: Color = Color.white
    var cornerRadius: CGFloat = 16
    var font: Font?
    var icon: String? // İkon ismi (SF Symbol)
    var addBorder: Bool = false // Kenarlık ekleme seçeneği
    var borderColor: Color = Color.black // Kenarlık rengi (varsayılan siyah)
    var width: CGFloat? // Buton genişliği (opsiyonel)
    
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
            .frame(width: width, height: 62) // Genişlik dinamik
            .background(backgroundColor)
            .cornerRadius(cornerRadius)
            .overlay(
                RoundedRectangle(cornerRadius: cornerRadius)
                    .stroke(borderColor, lineWidth: addBorder ? 0.5 : 0) // Kenarlık çizme
            )
        }
    }
}


