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
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        if let normalId = try? container.decode(String.self, forKey: .id) {
            id = normalId
        } else {
            id = try container.decode(String.self, forKey: .id)
        }
        
        name = try container.decode(String.self, forKey: .name)
        location = try container.decode(String.self, forKey: .location)
        description = try container.decode(String.self, forKey: .description)
        mainPhoto = try container.decodeIfPresent(String.self, forKey: .mainPhoto)
        email = try container.decode(String.self, forKey: .email)
        phoneNumber = try container.decode(String.self, forKey: .phoneNumber)
        cuisines = try container.decode(String.self, forKey: .cuisines)
        openingTime = try container.decode(String.self, forKey: .openingTime)
        closingTime = try container.decode(String.self, forKey: .closingTime)
        minPrice = try container.decode(Double.self, forKey: .minPrice)
        maxPrice = try container.decode(Double.self, forKey: .maxPrice)
        photos = try container.decode(PhotoData.self, forKey: .photos)
        averageRating = try container.decode(Double.self, forKey: .averageRating)
    }
}

struct PhotoData: Codable {
    let values: [String]
    
    enum CodingKeys: String, CodingKey {
        case values = "$values"
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
