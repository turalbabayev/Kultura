//
//  ContentView.swift
//  Kultura
//
//  Created by Tural Babayev on 9.12.2024.
//


import SwiftUI

struct ContentView: View {
    @StateObject private var appCoordinator = AppCoordinator()
    
    var body: some View {
        
        //RestaurantMapView()
        //SignupView()
        
        appCoordinator.start()
            .onReceive(appCoordinator.$currentView) { newView in
                // Ekranı güncellemek için dinamik olarak izleme
            }
         
        
        
    }
}


