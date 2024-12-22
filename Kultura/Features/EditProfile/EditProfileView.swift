//
//  EditProfileView.swift
//  Kultura
//
//  Created by Tural Babayev on 22.12.2024.
//

import SwiftUI

struct EditProfileView: View {
    @State private var firstName: String
    @State private var lastName: String
    @State private var email: String
    var profileImage: String
    
    var onDone: (String,String,String) -> Void
    
    init(firstName: String, lastName: String, email: String, profileImage: String, onDone: @escaping (String, String, String) -> Void){
        self._firstName = State(initialValue: firstName)
        self._lastName = State(initialValue: lastName)
        self._email = State(initialValue: email)
        self.profileImage = profileImage
        self.onDone = onDone
    }
    
    var body: some View {
        NavigationView {
            VStack(spacing : 24){
                //Profil Photo
                ZStack(alignment: .bottomTrailing){
                    Image(profileImage)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 100, height: 100)
                        .clipShape(Circle())
                        .shadow(radius: 4)
                        
                    Button(action: {
                        print("Edit profile image tapped")
                    }) {
                        Image(systemName: "pencil")
                            .foregroundColor(.white)
                            .padding(8)
                            .background(Color.black)
                            .clipShape(Circle())
                    }
                }
                
                VStack(spacing: 16){
                    CustomTextFieldView(fields: [
                        CustomTextFieldData(placeholder: "Email", text: $firstName, isSecure: false),
                        CustomTextFieldData(placeholder: "Password", text: $lastName, isSecure: false),
                        CustomTextFieldData(placeholder: "Password", text: $email, isSecure: false)
                    ])
                }
                
                Spacer()
                
                Button {
                    onDone(firstName,lastName,email)
                } label: {
                    Text("Done")
                        .font(AppFonts.customFont(name: "Poppins-Medium", size: 16))
                        .foregroundColor(Color.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.black)
                        .cornerRadius(25)
                        .shadow(radius: 4)
                }
                .padding(.horizontal)

                
            }
        }
        .padding()
        .navigationTitle("Edit profile")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    EditProfileView(
                firstName: "Kamil",
                lastName: "Rzayev",
                email: "example@mail.com",
                profileImage: "avatar"
            ) { _, _, _ in }
}
