//
//  SignupView.swift
//  Kultura
//
//  Created by Tural Babayev on 21.12.2024.
//

import SwiftUI

struct SignupView: View {
    @StateObject var viewModel = SignupViewModel()
    @ObservedObject private var keyboardManager = KeyboardManager()
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView {
                VStack(spacing: 20) {
                    // Başlık
                    Text("Sign up")
                        .font(AppFonts.title)
                        .foregroundColor(.black)
                        .padding(.top, geometry.safeAreaInsets.top + 20) // Safe area'ya uyum
                    
                    // Input Alanları
                    VStack(spacing: 16) {
                        CustomTextFieldView(fields: [
                            CustomTextFieldData(placeholder: "Name", text: $viewModel.name, isSecure: false),
                            CustomTextFieldData(placeholder: "Last Name", text: $viewModel.surname, isSecure: false),
                            CustomTextFieldData(placeholder: "Email", text: $viewModel.email, isSecure: false),
                            CustomTextFieldData(placeholder: "Password", text: $viewModel.password, isSecure: true),
                            CustomTextFieldData(placeholder: "Confirm Password", text: $viewModel.passwordAgain, isSecure: true)
                        ])
                    }
                    .padding(.horizontal, 16)
                    .padding(.top, 20)
                    
                    // Sign up Button
                    CustomButton(
                        title: "Sign up",
                        action: {
                            print("Name: \(viewModel.name), Email: \(viewModel.email)")
                        },
                        backgroundColor: .white,
                        foregroundColor: .black,
                        cornerRadius: 30
                    )
                    .frame(maxWidth: geometry.size.width * 0.8) // Dinamik genişlik
                    .overlay(
                        RoundedRectangle(cornerRadius: 30)
                            .stroke(Color.gray, lineWidth: 0.5)
                            .padding(.horizontal, geometry.size.width * 0.2) // Overlay genişliği
                    )
                    .padding(.top, 20)
                    
                    
                    Spacer() // Klavye alanına uyum
                        .frame(height: keyboardManager.keyboardHeight)
                        .animation(.easeOut(duration: 0.2), value: keyboardManager.keyboardHeight)
                }
                .frame(minHeight: geometry.size.height) // Tüm ekranı kapsayacak şekilde ayarlandı
            }
            .background(Color.white.edgesIgnoringSafeArea(.all)) // Arka plan rengi
            .ignoresSafeArea(.keyboard) // Klavye uyumu
        }
    }
}

#Preview {
    SignupView()
}
