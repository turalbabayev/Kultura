//
//  HomeViewModel.swift
//  Kultura
//
//  Created by Tural Babayev on 19.01.2025.
//


import Foundation
import Combine

class HomeViewModel: ObservableObject {
    @Published var restaurants: [UIRestaurant] = []
    @Published var errorMessage: String?
    @Published var isLoading: Bool = false
    
    private let restaurantService: RestaurantService
    private var cancellables = Set<AnyCancellable>()
    
    init(restaurantService: RestaurantService) {
        self.restaurantService = restaurantService
    }
    
    func fetchRestaurants() {
        isLoading = true
        errorMessage = nil
        
        restaurantService.getAllRestaurants()
            .receive(on: DispatchQueue.main)
            .sink { [weak self] completion in
                guard let self = self else { return }
                self.isLoading = false
                
                if case .failure(let error) = completion {
                    print("Restaurant Fetch Error: \(error)")
                    if let decodingError = error as? DecodingError {
                        switch decodingError {
                        case .keyNotFound(let key, let context):
                            self.errorMessage = "Key not found: \(key), context: \(context.debugDescription)"
                        case .typeMismatch(let type, let context):
                            self.errorMessage = "Type mismatch: expected \(type), context: \(context.debugDescription)"
                        case .valueNotFound(let type, let context):
                            self.errorMessage = "Value not found: \(type), context: \(context.debugDescription)"
                        case .dataCorrupted(let context):
                            self.errorMessage = "Data corrupted: \(context.debugDescription)"
                        @unknown default:
                            self.errorMessage = "Unknown decoding error"
                        }
                    } else if let apiError = error as? APIError {
                        switch apiError {
                        case .serverError(let message):
                            self.errorMessage = message
                        default:
                            self.errorMessage = "Bir hata oluştu. Lütfen tekrar deneyin."
                        }
                    } else {
                        self.errorMessage = error.localizedDescription
                    }
                }
            } receiveValue: { [weak self] apiRestaurants in
                print("Received restaurants: \(apiRestaurants.count)")
                self?.restaurants = apiRestaurants.map { UIRestaurant.fromAPI($0) }
            }
            .store(in: &cancellables)
    }
} 