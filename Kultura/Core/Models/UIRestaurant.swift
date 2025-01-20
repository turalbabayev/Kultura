//
//  UIRestaurant.swift
//  Kultura
//
//  Created by Tural Babayev on 19.01.2025.
//


import SwiftUI

struct UIRestaurant: Identifiable {
    let id: String
    let name: String
    let rating: Double
    let priceRange: String
    let mainPhotoURL: URL?
    let leftIcon: Image?
    let rightIcon: Image?
    let leftIconColor: Color?
    let hasBorder: Bool
    let minPrice: Double
    let maxPrice: Double
    let originalRestaurant: APIRestaurant // API modelini saklıyoruz
    
    // API modelinden UI modeline dönüştürme
    static func fromAPI(_ apiRestaurant: APIRestaurant) -> UIRestaurant {
        return UIRestaurant(
            id: apiRestaurant.id,
            name: apiRestaurant.name,
            rating: apiRestaurant.averageRating,
            priceRange: "\(Int(apiRestaurant.minPrice))-\(Int(apiRestaurant.maxPrice)) AZN",
            mainPhotoURL: URL(string: apiRestaurant.mainPhoto ?? ""),
            leftIcon: nil,
            rightIcon: nil,
            leftIconColor: nil,
            hasBorder: false,
            minPrice: apiRestaurant.minPrice,
            maxPrice: apiRestaurant.maxPrice,
            originalRestaurant: apiRestaurant
        )
    }
} 