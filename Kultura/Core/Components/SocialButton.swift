//
//  SocialButton.swift
//  Kultura
//
//  Created by Tural Babayev on 22.12.2024.
//

import SwiftUI

struct SocialButton: View {
    var imageName: String
    var action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Image(uiImage: UIImage(named: imageName)!)
                .resizable()
                .frame(width: 24, height: 24)
                .foregroundColor(.black)
                .frame(width: 50, height: 50)
                .background(Color(.systemGray6))
                .clipShape(Circle())
        }
    }
}
