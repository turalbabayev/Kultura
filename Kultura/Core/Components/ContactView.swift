//
//  ContactView.swift
//  Kultura
//
//  Created by Tural Babayev on 24.12.2024.
//

import SwiftUI

struct ContactView: View {
    
    var body: some View{
        VStack(spacing: 16) {
                // Call Center
                Text("Call Center")
                    .font(.headline)
                    .frame(maxWidth: .infinity, alignment: .leading)

                HStack {
                    Text("Coffemania")
                    Spacer()
                    Button(action: {}) {
                        Image(systemName: "globe")
                            .font(.title2)
                    }
                    Button(action: {}) {
                        Image(systemName: "phone.fill")
                            .font(.title2)
                    }
                }
                .padding()
                .background(Color(UIColor.systemGray6))
                .cornerRadius(12)

                // Location
                Text("Location")
                    .font(.headline)
                    .frame(maxWidth: .infinity, alignment: .leading)

                // Map Image Placeholder
                Button(action: {
                    let urlString = "https://www.google.com/maps/search/?api=1&query=40.4093,49.8671"
                    if let url = URL(string: urlString) {
                        UIApplication.shared.open(url)
                    }
                }) {
                    Image("map_placeholder") // Yer tutucu harita resmini buraya koyun
                        .resizable()
                        .scaledToFill()
                        .frame(height: 150)
                        .cornerRadius(12)
                        .clipped()
                        .overlay(
                            HStack {
                                Spacer()
                                VStack {
                                    Spacer()
                                    Text("Open in Google Maps")
                                        .font(.caption)
                                        .foregroundColor(.white)
                                        .padding(8)
                                        .background(Color.black.opacity(0.7))
                                        .cornerRadius(8)
                                        .padding(.bottom, 8)
                                        .padding(.trailing, 8)
                                }
                            }
                        )
                }

                // Working Hours
                VStack(alignment: .leading, spacing: 8) {
                    Text("Working hours")
                        .font(.headline)
                    Text("Sunday - Saturday : 09:00 - 18:45")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                .padding()
                .background(Color(UIColor.systemGray6))
                .cornerRadius(12)

                // Chat Support
                HStack {
                    Text("Kultura support")
                        .font(.subheadline)
                    Spacer()
                    Button(action: {
                        print("Open Chat Tapped")
                    }) {
                        Text("Open chat")
                            .font(.subheadline)
                            .foregroundColor(.blue)
                    }
                }
                .padding()
                .background(Color(UIColor.systemGray6))
                .cornerRadius(12)
            }
            .padding()
    }
}
