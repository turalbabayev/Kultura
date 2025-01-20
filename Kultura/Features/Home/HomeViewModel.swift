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
    @Published var topRestaurants: [UIRestaurant] = []
    @Published var errorMessage: String?
    @Published var isLoading: Bool = false
    
    private let restaurantService: RestaurantService
    private var cancellables = Set<AnyCancellable>()
    
    init(restaurantService: RestaurantService) {
        self.restaurantService = restaurantService
    }
    
    func onAppear() {
        isLoading = true
        
        // Tüm çağrıları birleştirip tek seferde yapabiliriz
        Publishers.CombineLatest(
            restaurantService.getAllRestaurants(),
            restaurantService.getTop5Restaurants()
        )
        .sink(receiveCompletion: { [weak self] completion in
            self?.isLoading = false
            if case .failure(let error) = completion {
                self?.handleError(error)
            }
        }, receiveValue: { [weak self] (allRestaurants, topRestaurants) in
            self?.restaurants = allRestaurants.map(UIRestaurant.fromAPI)
            self?.topRestaurants = topRestaurants.map(UIRestaurant.fromAPI)
        })
        .store(in: &cancellables)
    }
    
    private func handleError(_ error: Error) {
        if let decodingError = error as? DecodingError {
            handleDecodingError(decodingError)
        } else if let apiError = error as? APIError {
            handleAPIError(apiError)
        } else {
            errorMessage = error.localizedDescription
        }
    }
    
    private func handleDecodingError(_ error: DecodingError) {
        switch error {
        case .keyNotFound(let key, _):
            errorMessage = "Veri yapısında eksik alan: \(key)"
        case .typeMismatch(_, _):
            errorMessage = "Veri tipi uyuşmazlığı"
        case .valueNotFound(_, _):
            errorMessage = "Gerekli değer bulunamadı"
        case .dataCorrupted(_):
            errorMessage = "Veri bozuk"
        @unknown default:
            errorMessage = "Bilinmeyen bir hata oluştu"
        }
    }
    
    private func handleAPIError(_ error: APIError) {
        switch error {
        case .serverError(let message):
            errorMessage = message
        default:
            errorMessage = "Bir hata oluştu. Lütfen tekrar deneyin."
        }
    }
} 
