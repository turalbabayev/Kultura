//
//  Stepper.swift
//  Kultura
//
//  Created by Tural Babayev on 25.12.2024.
//

import SwiftUI

struct StepperComponent: View {
    @Binding var value: Int
    let minValue: Int
    let maxValue: Int
    
    var body: some View {
        HStack{
            Button(action: {
                if value > minValue {
                    value -= 1
                }
            }) {
                Circle()
                    .frame(width: 50, height: 50)
                    .foregroundColor(value > minValue ? Color.gray.opacity(0.4) : Color.gray.opacity(0.2))
                    .overlay(
                        Image(systemName: "minus")
                            .foregroundColor(.black)
                    )
            }
            .disabled(value <= minValue)
            
            // Değer Gösterimi
            Text("\(value)")
                .frame(maxWidth: .infinity, minHeight: 50)
                .background(Color("appSecondary"))
                .cornerRadius(32)
                .overlay(
                    RoundedRectangle(cornerRadius: 32)
                        .stroke(Color.gray.opacity(0.5), lineWidth: 1)
                )
            
            // Arttır Butonu
            Button(action: {
                if value < maxValue {
                    value += 1
                }
            }) {
                Circle()
                    .frame(width: 50, height: 50)
                    .foregroundColor(value < maxValue ? Color.gray.opacity(0.4) : Color.gray.opacity(0.2))
                    .overlay(
                        Image(systemName: "plus")
                            .foregroundColor(.black)
                    )
            }
            .disabled(value >= maxValue)
        }
    }
}
