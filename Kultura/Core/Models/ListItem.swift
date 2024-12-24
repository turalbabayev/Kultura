//
//  ListItem.swift
//  Kultura
//
//  Created by Tural Babayev on 23.12.2024.
//

import SwiftUI

struct ListItem: Identifiable {
    let id = UUID()
    let title: String
    let destination: AnyView
}
