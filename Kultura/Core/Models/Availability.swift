//
//  Availability.swift
//  Kultura
//
//  Created by Tural Babayev on 25.12.2024.
//

import SwiftUI

struct Availability {
    let date: Date
    let isAvailable: Bool
}

struct TimeSlot: Identifiable {
    let id = UUID()
    let time: String
    var isAvailable: Bool
}


