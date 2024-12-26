//
//  ReservationInfoView.swift
//  Kultura
//
//  Created by Tural Babayev on 26.12.2024.
//

import SwiftUI

struct ReservationInfoView: View {
    @State private var phoneNumber: String = ""
    @State private var selectedMeeting: String = "Business Lunch"
    @State private var meetingOption = ["Business lunch", "Team meeting", "Project review", "Casual catch-up"]

    @Environment(\.dismiss) var dismiss

    var body: some View {
        ZStack {
            NavigationView {
                VStack(alignment: .leading, spacing: 16) {
                    Text("Merhaba sayfa")
                        .font(.headline)

                    NavigationLink(destination: Text("Detay Sayfası")) {
                        Text("Detaylara Git")
                            .font(.body)
                            .foregroundColor(.white)
                            .padding()
                            .background(Color("appPrimary"))
                            .cornerRadius(8)
                    }

                    Spacer()
                }
                .frame(maxWidth: .infinity)
                .padding(.top, 16)
                .background(Color("appSecondary")) // İçerik için arka plan rengi
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button(action: {
                            dismiss()
                        }) {
                            Image("arrow-left")
                                .frame(width: 24, height: 24)
                        }
                    }
                    ToolbarItem(placement: .principal) {
                        Text("Reserve a table")
                            .font(AppFonts.customFont(name: "Poppins", size: 16))
                    }
                }
            }
            .background(Color.clear) // NavigationView'in arka planını şeffaf yap
        }
        .navigationBarHidden(true)
    }
}

#Preview {
    ReservationInfoView()
}
