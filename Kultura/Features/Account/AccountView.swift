//
//  AccountView.swift
//  Kultura
//
//  Created by Tural Babayev on 24.12.2024.
//

import SwiftUI

struct AccountView: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack{
            NavigationView{
                VStack{
                    CustomListView(items: [
                        ListItem(title: "Country", destination: nil, trailingView: AnyView(Text("Azerbaijan").foregroundColor(.black))),
                        ListItem(title: "Send Receipts", destination: nil, trailingView: nil, isToggled: true),
                        ListItem(
                            title: "Terms of Service",
                            destination: AnyView(Text("Terms of Service")),
                            trailingView: AnyView(Image(systemName: "chevron.right").foregroundColor(.black)), // Simge
                            isToggled: nil
                        ),
                        ListItem(title: "Notifications", destination: nil, trailingView: nil, isToggled: true),
                        ListItem(title: "Language", destination: nil, trailingView: AnyView(Text("English").foregroundColor(.black))),
                        ListItem(title: "Dark Mode", destination: nil, trailingView: nil, isToggled: false)
                    ])
                    
                    Spacer()
                }
                .background(Color("appSecondary"))
                .padding(.top, 16)
                .navigationBarTitleDisplayMode(.inline)
                .toolbar{
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button(action: {
                            // Geri butonuna tıklama işlemi
                            dismiss()
                        }) {
                            Image("arrow-left")
                                .frame(width: 24, height: 24)
                        }
                    }
                    ToolbarItem(placement: .principal) {
                        Text("Accounts")
                            .font(AppFonts.customFont(name: "Poppins", size: 16))
                    }
                }
                .background(Color("appSecondary"))

                
            }
        }
        .padding(.top, 8)
        .background(Color("appSecondary"))
        .navigationBarHidden(true) // Navigation Bar'ı gizler

    }
}

#Preview {
    AccountView()
}
