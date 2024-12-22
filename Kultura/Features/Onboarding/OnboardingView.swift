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
            VStack(spacing:20){
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
                    ForEach(0..<viewModel.pages.count, id: \.self) { index in
                        VStack {
                            // Başlık
                            Text(viewModel.pages[index].title)
                                .font(Font.custom("Poppins-Medium", size: 22)) // Yazı boyutunu biraz büyüttüm
                                .multilineTextAlignment(.center)
                                .padding(.bottom, 30)
                            
                            // Görsel ve Glow Efekti
                            ZStack {
                                // Glow Efekti
                                Circle()
                                    .fill(
                                        LinearGradient(
                                            gradient: Gradient(colors: [Color.purple.opacity(0.2), Color.purple.opacity(0.1)]),
                                            startPoint: .top,
                                            endPoint: .bottom
                                        )
                                    )
                                    .frame(
                                        width: UIScreen.main.bounds.width * 0.9, // Daha büyük glow
                                        height: UIScreen.main.bounds.width * 0.9
                                    )
                                    .blur(radius: 60) // Glow etkisini artırdım
                                
                                // Görsel
                                Image(viewModel.pages[index].imageName)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(
                                        width: UIScreen.main.bounds.width * 0.65, // Görsel genişliğini artırdım
                                        height: UIScreen.main.bounds.height * 0.4 // Görsel yüksekliğini artırdım
                                    )
                                    .cornerRadius(20)
                            }
                        }
                        .tag(index)
                    }
                }
                .tabViewStyle(PageTabViewStyle())


                
                HStack(alignment: .center) {
                    CustomButton(
                        title: "Log in",
                        action: { onLogin() },
                        backgroundColor: .white,
                        foregroundColor: .black,
                        cornerRadius: 70
                    )
                    .frame(height: 50)
                    .overlay {
                        RoundedRectangle(cornerRadius: 70)
                            .stroke(.gray, lineWidth: 0.5)
                    }
                    
                    CustomButton(
                        title: "Sign up",
                        action: { onSignup() },
                        backgroundColor: .purple.opacity(0.8),
                        foregroundColor: .black,
                        cornerRadius: 70
                    )
                    .frame(height: 50)
                }
                .padding(32)
                .alignmentGuide(.bottom) { $0[.bottom] }

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


