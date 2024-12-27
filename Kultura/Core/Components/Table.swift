//
//  Table.swift
//  Kultura
//
//  Created by Tural Babayev on 27.12.2024.
//

import SwiftUI

struct FiveSeatTableView: View{
    var capacity: Int = 5
    var isOccupied: Bool
    @State private var isSelected: Bool = false
    
    var body: some View{
        VStack(spacing: 10){
            
            RoundedRectangle(cornerRadius: 10)
                .fill(isOccupied ? Color.gray : (isSelected ? Color.blue : Color.gray.opacity(0.3)))
                .frame(width: 87, height: 16)
                
            
            RoundedRectangle(cornerRadius: 10)
                .fill(isOccupied ? Color.gray : (isSelected ? Color.blue : Color.gray.opacity(0.3)))
                .frame(width: 87, height: 56)
                .overlay {
                    HStack(spacing: 0){
                        Image("profile")
                            .resizable()
                            .frame(width: 20, height: 20)
                        Text("\(capacity)")
                            .font(AppFonts.customFont(name: "Poppins", size: 16))
                            .foregroundColor(isOccupied ? .white : .black)
                    }
                }
            
            HStack(spacing: 5) {
                RoundedRectangle(cornerRadius: 10)
                    .fill(isOccupied ? Color.gray : (isSelected ? Color.blue : Color.gray.opacity(0.3)))
                    .frame(width: 41, height: 16)
                RoundedRectangle(cornerRadius: 10)
                    .fill(isOccupied ? Color.gray : (isSelected ? Color.blue : Color.gray.opacity(0.3)))
                    .frame(width: 40, height: 16)
            }
            
            

        }
        .padding()
        .onTapGesture {
            if !isOccupied {
                isSelected.toggle() // Masa seçimini değiştir
            }
        }
    }
}

struct FourSeatTableView: View {
    var capacity: Int = 5
    var isOccupied: Bool
    @State private var isSelected: Bool = false
    
    var body: some View {
        ZStack{
            Circle()
                .fill(isOccupied ? Color.gray : (isSelected ? Color.blue : Color.gray.opacity(0.3)))
                .frame(width: 56, height: 56)
                .overlay(
                    HStack(spacing: 0){
                        Image("profile")
                            .resizable()
                            .frame(width: 20, height: 20)
                        Text("\(capacity)")
                            .font(AppFonts.customFont(name: "Poppins", size: 16))
                            .foregroundColor(isOccupied ? .white : .black)
                    }
                )
            
            // Sandalyeler etrafında düzen
            ForEach([45, 135, 225, 315], id: \.self) { angle in
                RoundedRectangle(cornerRadius: 16)
                    .fill(isOccupied ? Color.gray : (isSelected ? Color.blue : Color.gray.opacity(0.3)))
                    .frame(width: 30, height: 16)
                    .rotationEffect(Angle(degrees: -Double(angle))) // Sandalyeyi eğimli yapar
                    .offset(sandalyelerOffset(angle: angle, radius: 40)) // Sandalyeleri pozisyonlar
            }
                        
        }
        .padding()
        .onTapGesture {
            if !isOccupied {
                isSelected.toggle() // Masa seçimini değiştir
            }
        }
    }
    
    private func sandalyelerOffset(angle: Int, radius: CGFloat) -> CGSize {
        let radian = Double(angle) * Double.pi / 180 // Dereceyi radyana çevir
        let x = radius * cos(radian)
        let y = radius * sin(radian)
        return CGSize(width: x, height: y)
    }
}

struct twoSeatTableView: View{
    var capacity: Int = 5
    var isOccupied: Bool
    @State private var isSelected: Bool = false
    
    var body: some View{
        VStack(spacing: 10){
            
            RoundedRectangle(cornerRadius: 14)
                .fill(isOccupied ? Color.gray : (isSelected ? Color.blue : Color.gray.opacity(0.3)))
                .frame(width: 30, height: 16)
                
            
            RoundedRectangle(cornerRadius: 14)
                .fill(isOccupied ? Color.gray : (isSelected ? Color.blue : Color.gray.opacity(0.3)))
                .frame(width: 41, height: 45)
                .overlay {
                    HStack(spacing: 0){
                        Image("profile")
                            .resizable()
                            .frame(width: 20, height: 20)
                        Text("\(capacity)")
                            .font(AppFonts.customFont(name: "Poppins", size: 16))
                            .foregroundColor(isOccupied ? .white : .black)
                    }
                }
            
            RoundedRectangle(cornerRadius: 14)
                .fill(isOccupied ? Color.gray : (isSelected ? Color.blue : Color.gray.opacity(0.3)))
                .frame(width: 30, height: 16)
            
            

        }
        .padding()
        .onTapGesture {
            if !isOccupied {
                isSelected.toggle() // Masa seçimini değiştir
            }
        }
    }
}

#Preview {
    FiveSeatTableView(isOccupied: false)
    FourSeatTableView(isOccupied: false)
    twoSeatTableView(isOccupied: false)
}
