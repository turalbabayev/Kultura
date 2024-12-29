//
//  KeyboardManager.swift
//  Kultura
//
//  Created by Tural Babayev on 22.12.2024.
//

import SwiftUI
import Combine

class KeyboardManager: ObservableObject{
    @Published var keyboardHeight: CGFloat = 0
    
    private var cancellables: Set<AnyCancellable> = []
    
    init() {
        NotificationCenter.default.publisher(for: UIResponder.keyboardWillShowNotification)
            .compactMap { $0.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect }
            .map { $0.height }
            .sink { [weak self] in self?.keyboardHeight = $0 }
            .store(in: &cancellables)
        
        NotificationCenter.default.publisher(for: UIResponder.keyboardWillHideNotification)
            .map { _ in CGFloat(0) }
            .sink { [weak self] in self?.keyboardHeight = $0 }
            .store(in: &cancellables)
    }
}
