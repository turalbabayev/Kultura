//
//  RestaurantService.swift
//  Kultura
//
//  Created by Tural Babayev on 19.01.2025.
//


import Foundation
import Combine

final class RestaurantService {
    private let repository: RestaurantRepositoryProtocol
    
    init(repository: RestaurantRepositoryProtocol = RestaurantRepository()) {
        self.repository = repository
    }
    
    func getAllRestaurants() -> AnyPublisher<[APIRestaurant], Error> {
        return repository.getAllRestaurants()
    }
} 