//
//  AppFonts.swift
//  Kultura
//
//  Created by Tural Babayev on 21.12.2024.
//

import SwiftUI

struct AppFonts {
    static let title = Font.custom("Poppins-Medium", size: 20)
    
    // Dinamik font boyutları için bir yöntem
    static func customFont(name: String, size: CGFloat) -> Font {
        return Font.custom(name, size: size)
    }
}

