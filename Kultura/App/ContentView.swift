//
//  ContentView.swift
//  Kultura
//
//  Created by Tural Babayev on 9.12.2024.
//

import SwiftUI

struct ContentView: View {
    private let appCoordinator = AppCoordinator()
    
    var body: some View {
        appCoordinator.start()
    }
}

