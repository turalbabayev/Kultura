//
//  LoginView.swift
//  Kultura
//
//  Created by Tural Babayev on 21.12.2024.
//

import SwiftUI
import Resolver

struct LoginView: View {
    @InjectedObject private var viewModel: LoginViewModel // Dependency Injection
    @ObservedObject private var keyboardManager = KeyboardManager()
    @State private var navigateToTabBar = false // Geçiş kontrolü

    var body: some View {
        NavigationStack {
            GeometryReader { geometry in
                ScrollView {
                    ZStack(alignment: .top) {
                        // Gradient Arka Plan
                        GradientBackground(height: geometry.size.height * 0.25)

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
                            .padding(.top, geometry.size.height * 0.05)

                            // Forgot Password
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

                            // Sosyal Medya Butonları
                            HStack(spacing: 20) {
                                SocialButton(imageName: "googleLogo", action: {
                                    print("Google button tapped")
                                })
                            }
                            .padding(.bottom, geometry.size.height * 0.05)

                            // Log in Butonu ve Navigation
                            CustomButton(
                                title: "Log in",
                                action: {
                                    viewModel.login()
                                    //navigateToTabBar = true // Geçiş tetikleniyor
                                },
                                backgroundColor: .white,
                                foregroundColor: .black,
                                cornerRadius: 30
                            )
                            .padding(.horizontal, geometry.size.width * 0.2)
                            .overlay(
                                RoundedRectangle(cornerRadius: 30)
                                    .stroke(Color.gray, lineWidth: 0.5)
                                    .frame(height: 65)
                                    .padding(.horizontal, geometry.size.width * 0.2)
                            )

                            
                        }
                        .padding(16)
                        .padding(.bottom, keyboardManager.keyboardHeight)
                        .animation(.easeOut(duration: 0.2), value: keyboardManager.keyboardHeight)
                    }
                    .navigationDestination(isPresented: $navigateToTabBar) {
                        TabBarView() // Geçiş yapılacak görünüm
                    }
                }
            }
            .ignoresSafeArea()
        }
    }
}

#Preview {
    LoginView()
}

