//
//  LoginView.swift
//  Kultura
//
//  Created by Tural Babayev on 21.12.2024.
//

import SwiftUI

struct LoginView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    
    var body: some View {
        VStack(spacing: 20){
            
            Text("Log in")
                .font(AppFonts.title)
                .foregroundColor(.black)
                .padding(.top, 50)
            
            VStack(spacing: 20){
                CustomTextField(placeholder: "Email", text: $email)
                CustomTextField(placeholder: "Password", text: $password, isSecure: true)
            }
            .padding(.top, 40)
            .padding(.horizontal, 20)
            
            // Forgot Password Link
            Button(action: {
                print("Forgot password tapped")
            }) {
                Text("Forgot password?")
                    .font(.system(size: 14, weight: .medium))
                    .foregroundColor(.black)
            }
            .padding(.top, 20)
            
            Text("Or")
                .font(.system(size: 14))
                .foregroundColor(.gray)
                .padding(.vertical, 10)
            
            HStack(spacing: 20) {
                Button(action: {
                    print("Google button tapped")
                }) {
                    Image(uiImage: UIImage(named: "googleLogo")!)
                        .resizable()
                        .frame(width: 24, height: 24)
                        .foregroundColor(.black)
                        .frame(width: 50, height: 50)
                        .background(Color(.systemGray6))
                        .clipShape(Circle())
                }
            }
            .padding(.bottom, 20)
            
            
            CustomButton(
                title: "Log in",
                action: {
                    print("Log in button tapped")
                },
                backgroundColor: .white,
                foregroundColor: .black,
                cornerRadius: 30
            )
            .padding(.horizontal, 60)
            .overlay(
                RoundedRectangle(cornerRadius: 30)
                    .stroke(Color.gray, lineWidth: 0.5)
                    .padding(.horizontal, 60)
            )
            
            
            Spacer()

        }
        .padding(16)
        
    }
}

#Preview {
    LoginView()
}
