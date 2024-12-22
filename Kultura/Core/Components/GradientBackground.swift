//
//  AnimatedGradientView.swift
//  Kultura
//
//  Created by Tural Babayev on 22.12.2024.
//

//
//  AnimatedGradientView.swift
//  Kultura
//
//  Created by Tural Babayev on 22.12.2024.
//

import SwiftUI

struct GradientBackground: View {
    var height: CGFloat
    
    var body: some View {
        Rectangle()
            .fill(
                LinearGradient(
                    gradient: Gradient(colors: [
                        Color.purple.opacity(0.9),
                        Color.purple.opacity(0.4),
                        Color.white
                    ]),
                    startPoint: .top,
                    endPoint: .bottom
                )
            )
            .frame(height: height)
            .ignoresSafeArea(edges: [.top])
    }
}


