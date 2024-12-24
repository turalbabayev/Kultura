//
//  ProfileHeaderView.swift
//  Kultura
//
//  Created by Tural Babayev on 22.12.2024.
//

import SwiftUI

struct ProfileHeaderView: View {
    var name: String
    var surname: String
    var email: String
    var profileImage: String
    
    var body: some View {
        HStack(){
            
            
            Image(profileImage)
                .resizable()
                .scaledToFill()
                .frame(width: 60, height: 60)
                .clipShape(Circle())
                .shadow(radius: 4)
                .padding(.leading)
            
            VStack(alignment: .leading){
                Text("\(name) \(surname)")
                    .font(AppFonts.customFont(name: "Poppins-SemiBold", size: 16))
                Text(verbatim: email)
                    .font(AppFonts.customFont(name: "Poppins-Regular", size: 12))
            }
            .padding(.leading, 8)
            
            //Spacer() // Sağdaki boşluğu itmek için

            NavigationLink(destination: EditProfileView(firstName: name, lastName: surname, email: email, profileImage: profileImage, onDone: { _, _, _ in
                print("Daha sonra kullanilacak")
            })){
                Text("Edit Profile")
                    .font(AppFonts.customFont(name: "Poppins-Regular", size: 16))
                    .foregroundColor(.black)
                    .padding(16)
                    .background(.white)
                    .cornerRadius(32)
                    .frame(alignment: .trailing)
                    
                
            }
            .padding(.trailing)
            
        }
        .frame(maxWidth: .infinity)
        .padding(.top, 16)
        .padding(.bottom, 16)
        .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 2)
        .background(Color.gray.opacity(0.2))
        .cornerRadius(32)
        .padding(16)
    }
}

#Preview {
    ProfileHeaderView(name: "Tural", surname: "Babayev", email: "example@gmail.com", profileImage: "avatar")
}
