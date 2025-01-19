//
//  AsyncImageView.swift
//  Kultura
//
//  Created by Tural Babayev on 19.01.2025.
//


import SwiftUI

struct AsyncImageView: View {
    let url: URL?
    
    var body: some View {
        if let url = url {
            AsyncImage(url: url) { phase in
                switch phase {
                case .empty:
                    ProgressView()
                case .success(let image):
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                case .failure:
                    Image("placeholder")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                @unknown default:
                    Image("placeholder")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                }
            }
        } else {
            Image("placeholder")
                .resizable()
                .aspectRatio(contentMode: .fill)
        }
    }
} 
