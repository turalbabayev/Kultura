//
//  ListItem.swift
//  Kultura
//
//  Created by Tural Babayev on 23.12.2024.
//

import SwiftUI

struct ListItem: Identifiable {
    let id: UUID = UUID()
    let title: String
    let destination: AnyView?
    let trailingView: AnyView? // Sağdaki özel görünüm
    var isToggled: Bool? // Eğer bir Toggle varsa, durumu buradan takip edilecek

}
