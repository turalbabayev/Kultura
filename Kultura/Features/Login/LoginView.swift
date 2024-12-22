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
        GeometryReader { geometry in
            ScrollView {
                ZStack(alignment: .top) {
                    // Gradient Arka Plan
                    GradientBackground(height: geometry.size.height * 0.25) // Ekran boyutuna göre

                    VStack(spacing: 20) {
                        // Log in Başlığı
                        Text("Log in")
                            .font(AppFonts.title)
                            .foregroundColor(.black)
                            .padding(.top, geometry.size.height * 0.15) // Dinamik üst boşluk

                        // Email ve Password Alanları
                        VStack(spacing: 20) {
                            CustomTextFieldView(fields: [
                                CustomTextFieldData(placeholder: "Email", text: $viewModel.email, isSecure: false),
                                CustomTextFieldData(placeholder: "Password", text: $viewModel.password, isSecure: true)
                            ])
                        }
                        .padding(.top, geometry.size.height * 0.05) // Dinamik boşluk

                        // Forgot Password Link
                        Button(action: {
                            print("Forgot password tapped")
                        }) {
                            Text("Forgot password?")
                                .font(.system(size: 14, weight: .medium))
                                .foregroundColor(.black)
                        }

                        // Or Divider
                        Text("Or")
                            .font(AppFonts.customFont(name: AppFonts.primaryFont, size: 16))
                            .foregroundColor(.gray)
                            .padding(.vertical, 10)

                        // Sosyal Giriş Butonları
                        HStack(spacing: 20) {
                            SocialButton(imageName: "googleLogo", action: {
                                print("Google button tapped")
                            })
                        }
                        .padding(.bottom, geometry.size.height * 0.05) // Dinamik alt boşluk

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
                        .padding(.horizontal, geometry.size.width * 0.2) // Dinamik genişlik
                        .overlay(
                            RoundedRectangle(cornerRadius: 30)
                                .stroke(Color.gray, lineWidth: 0.5)
                                .padding(.horizontal, geometry.size.width * 0.2)
                        )
                    }
                    .padding(16)
                    .padding(.bottom, keyboardManager.keyboardHeight) // Klavye yüksekliği kadar boşluk
                    .animation(.easeOut(duration: 0.2), value: keyboardManager.keyboardHeight)
                }
            }
        }
        .ignoresSafeArea() // Klavyeyi göz ardı eder
    }
}

#Preview {
    LoginView()
}
