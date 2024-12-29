//
//  ReviewsView.swift
//  Kultura
//
//  Created by Tural Babayev on 24.12.2024.
//

import SwiftUI

struct ReviewsView: View {
    
    let comments = [
        Comment(username: "Kamran Hasanli", profileImage: "avatar", date: "2 days ago", commentText: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus iaculis pharetra ultrices."),
        Comment(username: "Elvin Mammadov", profileImage: "avatar", date: "3 days ago", commentText: "Integer pretium purus at nisi efficitur, at rutrum diam tempus."),
        Comment(username: "Nigar Aliyeva", profileImage: "avatar", date: "5 days ago", commentText: "Vivamus sit amet placerat velit. Aliquam iaculis cursus mattis.")
    ]
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                // Reviews Başlık
                Text("Reviews")
                    .font(AppFonts.customFont(name: "Poppins", size: 18))
                    .frame(maxWidth: .infinity, alignment: .leading)

                // Filtre Butonları
                HStack(spacing: 12) {
                    FilterButton(title: "Filter", iconName: "setting-5") {
                        print("Filter tapped")
                    }
                    FilterButton(title: "Latest", iconName: nil) {
                        print("Latest tapped")
                    }
                    FilterButton(title: "Detailed Reviews", iconName: nil) {
                        print("Detailed Reviews tapped")
                    }
                }
                .foregroundColor(.gray)

                Divider()

                // Yorumlar Bölümü
                ForEach(comments) { comment in
                    CommentView(
                        username: comment.username,
                        profileImage: comment.profileImage,
                        date: comment.date,
                        commentText: comment.commentText
                    )
                    .padding(.vertical, 8)
                }

            }
            .padding()
        }
    }
}

#Preview {
    ReviewsView()
}


//MARK: - Extension -- Filter Button
struct FilterButton: View {
    let title: String
    let iconName: String?
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            HStack {
                if let iconName = iconName {
                    Image(iconName)
                }
                Text(title)
            }
            .font(AppFonts.customFont(name: "Poppins", size: 12))
            .padding(.vertical, 5)
            .padding(.horizontal, 16)
            .cornerRadius(16)
            .foregroundColor(.gray)
            .overlay {
                RoundedRectangle(cornerRadius: 12)
                    .stroke(.gray, lineWidth: 0.5)
            }
        }
    }
}

//MARK: - Comment View

struct CommentView: View {
    let username: String
    let profileImage: String
    let date: String
    let commentText: String

    var body: some View {
        HStack(alignment: .top, spacing: 12) {
            // Profil Resmi
            Circle()
                .fill(Color.gray.opacity(0.3))
                .frame(width: 40, height: 40)
                .overlay(
                    Image(profileImage)
                        .resizable()
                        .scaledToFit()
                )

            VStack(alignment: .leading, spacing: 4) {
                // Kullanıcı adı ve tarih
                HStack {
                    Text(username)
                        .font(AppFonts.customFont(name: "Poppins", size: 14))
                        .foregroundColor(.black)
                    Spacer()
                    Text(date)
                        .font(AppFonts.customFont(name: "Poppins", size: 10))
                        .foregroundColor(.gray)
                }

                // Kullanıcı yorumu
                Text(commentText)
                    .font(AppFonts.customFont(name: "Poppins", size: 14))
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.leading)
                    .lineLimit(nil)
                    .fixedSize(horizontal: false, vertical: true)
            }
        }
        Divider()
    }
}

//MARK: - Comment Model

struct Comment: Identifiable {
    let id = UUID()
    let username: String
    let profileImage: String
    let date: String
    let commentText: String
}

