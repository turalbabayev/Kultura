//
//  OnboardingView.swift
//  Kultura
//
//  Created by Tural Babayev on 21.12.2024.
//

import SwiftUI

struct OnboardingView: View {
    @StateObject private var viewModel = OnboardingViewModel()
    var onFinish: () -> Void

    init(onFinish: @escaping () -> Void = {}) {
        self.onFinish = onFinish
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
                    Button {
                        
                    } label: {
                        Text("Log in")
                            .padding(16)
                            .frame(maxWidth: .infinity)
                            .background(.white)
                            .cornerRadius(70)
                            .foregroundStyle(.black)
                            .overlay {
                                RoundedRectangle(cornerRadius: 70)
                                    .stroke(.gray, lineWidth: 0.5)
                            }
                        
                        
                    }
                    
                    Button {
                        
                    } label: {
                        Text("Sign up")
                            .padding(16)
                            .frame(maxWidth: .infinity)
                            .background(.purple).opacity(0.8)
                            .cornerRadius(70)
                            .foregroundStyle(.black)
                            
                    }

                }
                .padding(32)

            }
        }
       
    }
}

#Preview {
    OnboardingView()
}

