//
//  OnboardingView.swift
//  Kultura
//
//  Created by Tural Babayev on 21.12.2024.
//

import SwiftUI

struct OnboardingView: View {
    @StateObject private var viewModel = OnboardingViewModel()
    @AppStorage("hasSeenOnboarding") private var hasSeenOnboarding: Bool = false
    
    var onLogin: () -> Void
    var onSignup: () -> Void
    
    init(onLogin: @escaping () -> Void, onSignup: @escaping () -> Void) {
        self.onLogin = onLogin
        self.onSignup = onSignup
        UIPageControl.appearance().isHidden = true
    }

    
    var body: some View {
        ZStack{
                        
            VStack{
                
                HStack{
                    ForEach(0..<viewModel.pages.count, id: \.self){ index in
                        if index == viewModel.currentPage{
                            Rectangle()
                                .frame(width: 35, height: 10)
                                .cornerRadius(10)
                                .foregroundStyle(.purple)
                        } else{
                            Rectangle()
                                .frame(width: 25, height: 10)
                                .cornerRadius(10)
                                .foregroundStyle(.gray)
                        }
                    }
                }
                .padding(.top, 16)
                
                
                TabView(selection: $viewModel.currentPage) {
                    ForEach(0..<viewModel.pages.count, id: \.self){ index in
                        VStack{
                            Text(viewModel.pages[index].title)
                                .font(Font.custom("Poppins-Medium", size: 20))
                                .multilineTextAlignment(.center)
                                .padding(.bottom, 16)
                            
                            ZStack {
                                // Resim arkasındaki "Glow" efekti
                                Circle()
                                    .fill(LinearGradient(
                                        gradient: Gradient(colors: [Color.purple.opacity(2), Color.purple.opacity(0.5)]),
                                        startPoint: .top,
                                        endPoint: .bottom
                                    ))
                                    .frame(width: 300, height: 300)
                                    .blur(radius: 100)
                                
                                Image(viewModel.pages[index].imageName)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 220, height: 460)
                                    .cornerRadius(20)
                            }
                        }
                        .tag(index)
                    }
                }
                .tabViewStyle(PageTabViewStyle())
                
                HStack{
                    CustomButton(title: "Log in",
                                 action: { onLogin() },
                                 backgroundColor: .white,
                                 foregroundColor: .black,
                                 cornerRadius: 70)
                    .overlay {
                        RoundedRectangle(cornerRadius: 70)
                            .stroke(.gray, lineWidth: 0.5)
                    }
                    
                    CustomButton(title: "Sign up",
                                 action: { onSignup() },
                                 backgroundColor: .purple.opacity(0.8),
                                 foregroundColor: .black,
                                 cornerRadius: 70)
                }
                .padding(32)
            }
        }
        .onAppear {
            hasSeenOnboarding = true
        }
        
    }
        
}

#Preview {
    OnboardingView(
        onLogin: {
            print("Log in button tapped")
        },
        onSignup: {
            print("Sign up button tapped")
        }
    )
}


