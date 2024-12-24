//
//  EditProfileView.swift
//  Kultura
//
//  Created by Tural Babayev on 22.12.2024.
//

import SwiftUI

struct EditProfileView: View {
    
    @Environment(\.dismiss) var dismiss // Geri dönüş

    @State private var firstName: String
    @State private var lastName: String
    @State private var email: String
    var profileImage: String
    
    var onDone: (String, String, String) -> Void
    
    init(firstName: String, lastName: String, email: String, profileImage: String, onDone: @escaping (String, String, String) -> Void) {
        self._firstName = State(initialValue: firstName)
        self._lastName = State(initialValue: lastName)
        self._email = State(initialValue: email)
        self.profileImage = profileImage
        self.onDone = onDone
    }
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 16)
                .stroke(Color.gray, lineWidth: 0.5)
                .background(Color("appSecondary").cornerRadius(16))
            
            VStack {
                NavigationView {
                    VStack(spacing: 24) {
                        // Profil Fotoğrafı
                        ZStack(alignment: .bottomTrailing) {
                            Image(profileImage)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 110, height: 110)
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
                        .padding(.top, 16)
                        
                        // Kullanıcı Bilgileri
                        VStack {
                            Text("Kamil Rzayev")
                                .font(AppFonts.customFont(name: "Poppins-SemiBold", size: 18))
                            Text(verbatim: "example@gmail.com")
                                .font(AppFonts.customFont(name: "Poppins-Regular", size: 12))
                        }
                        
                        // TextField'ler
                        VStack(spacing: 16) {
                            CustomTextFieldView(fields: [
                                CustomTextFieldData(placeholder: "First Name", text: $firstName, isSecure: false),
                                CustomTextFieldData(placeholder: "Last Name", text: $lastName, isSecure: false),
                                CustomTextFieldData(placeholder: "Email", text: $email, isSecure: false)
                            ])
                        }
                        
                        // Buton
                        CustomButton2(
                            title: "Done",
                            action: {
                                print("\(firstName) \(lastName)")
                            },
                            backgroundColor: .white,
                            foregroundColor: .black,
                            cornerRadius: 30,
                            addBorder: true,
                            width: 150
                        )
                        
                        Spacer()
                    }
                    .background(Color("appSecondary"))
                    .navigationBarTitleDisplayMode(.inline)
                    .toolbar {
                        ToolbarItem(placement: .navigationBarLeading) {
                            Button(action: {
                                // Geri butonuna tıklama işlemi
                                dismiss() // "Done" butonuna tıklayınca da geri dön
                            }) {
                                Image("arrow-left")
                                    .frame(width: 24, height: 24)
                            }
                        }
                        ToolbarItem(placement: .principal) {
                            Text("Edit Profile")
                                .font(AppFonts.customFont(name: "Poppins-SemiBold", size: 18))
                        }
                    }
                }
                
            }
            .padding(5)
        }
        .padding(16)
        .background(Color("appSecondary"))
        .navigationBarHidden(true) // Navigation Bar'ı gizler
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

