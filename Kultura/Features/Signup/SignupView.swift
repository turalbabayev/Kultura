//
//  SignupView.swift
//  Kultura
//
//  Created by Tural Babayev on 21.12.2024.
//

import SwiftUI
import Resolver
import Combine

struct SignupView: View {
    @InjectedObject private var viewModel: SignupViewModel
    @ObservedObject private var keyboardManager = KeyboardManager()
    
    var body: some View {
        NavigationStack {
            GeometryReader { geometry in
                ScrollView {
                    VStack(spacing: 20) {
                        Text("Sign up")
                            .font(AppFonts.title)
                            .foregroundColor(.black)
                            .padding(.top, geometry.safeAreaInsets.top + 20)
                        
                        VStack(spacing: 16) {
                            CustomTextFieldView(fields: [
                                CustomTextFieldData(placeholder: "Full Name", text: $viewModel.fullName, isSecure: false),
                                CustomTextFieldData(placeholder: "Email", text: $viewModel.email, isSecure: false, keyboardType: .emailAddress),
                                CustomTextFieldData(placeholder: "Age", text: $viewModel.age, isSecure: false, keyboardType: .numberPad),
                                CustomTextFieldData(placeholder: "Password", text: $viewModel.password, isSecure: true),
                                CustomTextFieldData(placeholder: "Confirm Password", text: $viewModel.passwordAgain, isSecure: true)
                            ])
                        }
                        .padding(.horizontal, 16)
                        .padding(.top, 20)
                        
                        if let errorMessage = viewModel.errorMessage {
                            Text(errorMessage)
                                .foregroundColor(.red)
                                .font(.system(size: 14))
                                .padding(.horizontal)
                        }
                        
                        CustomButton(
                            title: viewModel.isLoading ? "Signing up..." : "Sign up",
                            action: {
                                viewModel.signup()
                            },
                            backgroundColor: .white,
                            foregroundColor: .black,
                            cornerRadius: 30
                        )
                        .disabled(viewModel.isLoading)
                        .frame(maxWidth: geometry.size.width * 0.8)
                        .overlay(
                            RoundedRectangle(cornerRadius: 30)
                                .stroke(Color.gray, lineWidth: 0.5)
                                .padding(.horizontal, geometry.size.width * 0.2)
                        )
                        .padding(.top, 20)
                        
                        Spacer()
                            .frame(height: keyboardManager.keyboardHeight)
                            .animation(.easeOut(duration: 0.2), value: keyboardManager.keyboardHeight)
                    }
                    .frame(minHeight: geometry.size.height)
                }
                .background(Color.white.edgesIgnoringSafeArea(.all))
                .ignoresSafeArea(.keyboard)
            }
            .navigationBarBackButtonHidden(true)
            .navigationBarHidden(true)
            .navigationDestination(isPresented: $viewModel.isSignupSuccessful) {
                LoginView()
            }
        }
    }
}

#Preview {
    SignupView()
}
