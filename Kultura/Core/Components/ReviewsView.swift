//
//  ReviewsView.swift
//  Kultura
//
//  Created by Tural Babayev on 24.12.2024.
//

import SwiftUI

struct ReviewsView: View {
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                // Reviews Başlık
                Text("Reviews")
                    .font(.headline)
                    .frame(maxWidth: .infinity, alignment: .leading)

                // Filtre Butonları
                HStack(spacing: 16) {
                    Button(action: {
                        print("Filter tapped")
                    }) {
                        HStack {
                            Image(systemName: "line.3.horizontal.decrease.circle")
                            Text("Filter")
                        }
                        .font(.subheadline)
                        .padding(.vertical, 2)
                        .padding(.horizontal, 16)
                        .background(Color(UIColor.systemGray6))
                        .cornerRadius(16)
                        .foregroundColor(.gray)
                        .overlay {
                            RoundedRectangle(cornerRadius: 12)
                                .stroke(.gray, lineWidth: 0.5)
                        }
                    }

                    Button(action: {
                        print("Latest tapped")
                    }) {
                        Text("Latest")
                            .font(.subheadline)
                            .padding(.vertical, 2)
                            .padding(.horizontal, 16)
                            .background(Color(UIColor.systemGray6))
                            .cornerRadius(16)
                            .foregroundColor(.gray)
                            .overlay {
                                RoundedRectangle(cornerRadius: 12)
                                    .stroke(.gray, lineWidth: 0.5)
                            }
                    }

                    Button(action: {
                        print("Detailed Reviews tapped")
                    }) {
                        Text("Detailed Reviews")
                            .font(.subheadline)
                            .padding(.vertical, 2)
                            .padding(.horizontal, 16)
                            .background(Color(UIColor.systemGray6))
                            .cornerRadius(16)
                            .foregroundColor(.gray)
                            .overlay {
                                RoundedRectangle(cornerRadius: 12)
                                    .stroke(.gray, lineWidth: 0.5)
                            }
                    }
                }

                Divider()

                // Yorumlar Bölümü
                ForEach(0..<3, id: \.self) { index in
                    VStack(alignment: .leading, spacing: 16) {
                        HStack(alignment: .top, spacing: 12) {
                            // Profil Resmi
                            Circle()
                                .fill(Color.gray.opacity(0.3))
                                .frame(width: 40, height: 40)
                                .overlay(
                                    Text("👤") // Örnek bir ikon, yerine resim konulabilir
                                        .font(.title3)
                                )

                            VStack(alignment: .leading, spacing: 4) {
                                // Kullanıcı adı ve tarih
                                HStack {
                                    Text("Kamran Hasanli")
                                        .font(.headline)
                                        .foregroundColor(.black)
                                    Spacer()
                                    Text("2 days ago")
                                        .font(.caption)
                                        .foregroundColor(.gray)
                                }

                                // Kullanıcı yorumu
                                Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus iaculis pharetra ultrices. Integer pretium purus at nisi efficitur, at rutrum diam tempus. Vivamus sit amet placerat velit. Aliquam iaculis cursus mattis.")
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                                    .multilineTextAlignment(.leading)
                                    .lineLimit(nil)
                                    .fixedSize(horizontal: false, vertical: true)
                            }
                        }

                        Divider()
                    }
                }
            }
            .padding()
        }
    }
}
