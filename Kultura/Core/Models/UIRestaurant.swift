//
//  UIRestaurant.swift
//  Kultura
//
//  Created by Tural Babayev on 19.01.2025.
//


import SwiftUI

struct UIRestaurant: Identifiable {
    let id = UUID()
    let name: String
    let rating: Double
    let priceRange: String
    let mainPhotoURL: URL?
    let leftIcon: Image?
    let rightIcon: Image?
    let leftIconColor: Color?
    let hasBorder: Bool
    
    // API modelinden UI modeline dönüştürme
    static func fromAPI(_ apiRestaurant: APIRestaurant) -> UIRestaurant {
        return UIRestaurant(
            name: apiRestaurant.name,
            rating: apiRestaurant.averageRating,
            priceRange: "\(Int(apiRestaurant.minPrice))-\(Int(apiRestaurant.maxPrice)) AZN",
            mainPhotoURL: URL(string: apiRestaurant.mainPhoto ?? ""),
            leftIcon: nil,
            rightIcon: nil,
            leftIconColor: nil,
            hasBorder: false
        )
    }
} 