//
//  OnboardingViewModel.swift
//  Kultura
//
//  Created by Tural Babayev on 21.12.2024.
//

import Foundation

class OnboardingViewModel: ObservableObject {
    @Published var pages: [OnboardingModel] = [
        OnboardingModel(title: "Discover a World of Personalized Dining!",imageName: "onboarding1"),
        OnboardingModel(title: "Reserve Smart,Dine Happily!",imageName: "onboarding1"),
        OnboardingModel(title: "Find. Reserve. Savor.",imageName: "onboarding1")
    ]
    
    @Published var currentPage: Int = 0
    
    func nextPage() {
        if currentPage < pages.count - 1 {
            currentPage += 1
        }
    }
    
    func previousPage() {
        if currentPage > 0 {
            currentPage -= 1
        }
    }
}
