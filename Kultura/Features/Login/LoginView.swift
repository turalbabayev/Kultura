//
//  LoginView.swift
//  Kultura
//
//  Created by Tural Babayev on 21.12.2024.
//

import SwiftUI

struct LoginView: View {
    @StateObject private var viewModel = LoginViewModel()
    @ObservedObject private var keyboardManager = KeyboardManager()
    
    var body: some View {
        ScrollView {
            ZStack(alignment: .top) {
                //Gradient Arka Plan
                GradientBackground(height: LoginConstants.gradientHeight)

                VStack(spacing: 20) {

                    Text("Log in")
                        .font(AppFonts.title)
                        .foregroundColor(.black)
                        .padding(.top, 120)
                    
                    // Email ve Password Alanları
                    VStack(spacing: 20) {
                        CustomTextFieldView(fields: [
                            CustomTextFieldData(placeholder: "Email", text: $viewModel.email, isSecure: false),
                            CustomTextFieldData(placeholder: "Password", text: $viewModel.password, isSecure: true)
                        ])
                    }
                    .padding(.top, LoginConstants.fieldTopPadding)

                    // Forgot Password Link
                    Button(action: {
                        print("Forgot password tapped")
                    }) {
                        Text("Forgot password?")
                            .font(.system(size: 14, weight: .medium))
                            .foregroundColor(.black)
                    }
                    .padding(.top, 15)
                    
                    // Or Divider
                    Text("Or")
                        .font(AppFonts.customFont(name: AppFonts.primaryFont, size: 16))
                        .foregroundColor(.gray)
                        .padding(.vertical, 10)
                    
                    HStack(spacing: 20) {
                        SocialButton(imageName: "googleLogo", action: {
                            print("Google button tapped")
                        })
                    }
                    .padding(.bottom, 70)
                    
                    // Log in Button
                    CustomButton(
                        title: "Log in",
                        action: {
                            print("Email: \(viewModel.email), Password: \(viewModel.password)")
                        },
                        backgroundColor: .white,
                        foregroundColor: .black,
                        cornerRadius: 30
                    )
                    .padding(.horizontal, 70)
                    .overlay(
                        RoundedRectangle(cornerRadius: 30)
                            .stroke(Color.gray, lineWidth: 0.5)
                            .padding(.horizontal, 70)
                    )
                    
                    Spacer() // Alt Boşluk
                        .frame(height: keyboardManager.keyboardHeight)
                        .animation(.easeOut(duration: 0.2), value: keyboardManager.keyboardHeight)
                }
                .padding(16)
            }
        }
        .ignoresSafeArea()
        
    }
}


#Preview {
    LoginView()
}
