//
//  CustomTextField.swift
//  Kultura
//
//  Created by Tural Babayev on 22.12.2024.
//

import SwiftUI

struct CustomTextField: View {
    var placeholder: String
    @Binding var text: String
    var isSecure: Bool = false
    
    var body: some View {
        ZStack(alignment: .leading) {
            if text.isEmpty {
                Text(placeholder)
                    .foregroundColor(.gray)
                    .padding(.leading, 10)
            }
            
            if isSecure {
                SecureField("Password", text: $text)
                    .padding(20)
                    .background(Color(.systemGray6))
                    .cornerRadius(24)
            } else {
                TextField("", text: $text)
                    .padding(20)
                    .background(Color(.systemGray6))
                    .cornerRadius(24)
            }
        }
        .frame(height: 65)
    }
}
