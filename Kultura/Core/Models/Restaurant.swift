//
//  APIRestaurant.swift
//  Kultura
//
//  Created by Tural Babayev on 19.01.2025.
//

import Foundation

struct APIRestaurant: Codable, Identifiable {
    let id: String
    let name: String
    let location: String
    let description: String
    let mainPhoto: String?
    let email: String
    let phoneNumber: String
    let cuisines: String
    let openingTime: String
    let closingTime: String
    let minPrice: Double
    let maxPrice: Double
    let photos: PhotoData
    let averageRating: Double
    
    enum CodingKeys: String, CodingKey {
        case id = "$id"
        case name, location, description, mainPhoto, email
        case phoneNumber, cuisines, openingTime, closingTime
        case minPrice, maxPrice, photos, averageRating
    }
}

struct PhotoData: Codable {
    let id: String
    let photos: [String]
    
    enum CodingKeys: String, CodingKey {
        case id = "$id"
        case photos = "$values"
    }
}

struct RestaurantResponse: Codable {
    let id: String
    let success: Bool
    let message: String
    let errorMessage: String?
    let data: RestaurantData
    
    enum CodingKeys: String, CodingKey {
        case id = "$id"
        case success, message, errorMessage, data
    }
}

struct RestaurantData: Codable {
    let id: String
    let restaurants: [APIRestaurant]
    
    enum CodingKeys: String, CodingKey {
        case id = "$id"
        case restaurants = "$values"
    }
} 
