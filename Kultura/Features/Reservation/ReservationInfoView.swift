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
    @State private var meetingOptions = ["Business lunch", "Team meeting", "Project review", "Casual catch-up"]
    
    var fullPhoneNumber: String {
        "+994" + phoneNumber
    }

    @Environment(\.dismiss) var dismiss

    var body: some View {
        ZStack {
            NavigationView {
                VStack(alignment: .leading, spacing: 16) {
                    Text("Your Info")
                        .font(AppFonts.customFont(name: "Poppins", size: 18))
                        .padding(.horizontal)

                    // Phone Number Input
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Phone number")
                            .font(.subheadline)
                            .foregroundColor(.black)
                        
                        HStack {
                            Text("+994 | ")
                                .foregroundColor(.gray)
                                .padding(.leading, 8)
                                .font(AppFonts.customFont(name: "Poppins", size: 14))
                            
                            TextField("", text: $phoneNumber)
                                .keyboardType(.numberPad)
                                .padding(20)
                                .background(Color(UIColor.systemGray5))
                                .cornerRadius(24)
                                //.onChange(of: phoneNumber) { oldValue, newValue in
                                    // Kullanıcı sadece rakam girebilsin
                                    //phoneNumber = newValue.filter { $0.isNumber }
                                //}
                        }
                        .background(Color(UIColor.systemGray5))
                        .cornerRadius(16)
                    }
                    .padding(.horizontal)
                    
                    // Meeting Selection
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Görüşün adı")
                            .font(.subheadline)
                            .foregroundColor(.black)
                        
                        Menu {
                            ForEach(meetingOptions, id: \.self) { option in
                                Button(action: {
                                    selectedMeeting = option
                                }) {
                                    Text(option)
                                }
                            }
                        } label: {
                            HStack {
                                Text(selectedMeeting)
                                    .foregroundColor(.black)
                                    .font(AppFonts.customFont(name: "Poppins", size: 14))
                                
                                Image(systemName: "chevron.down")
                                    .foregroundColor(.gray)
                            }
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding()
                            .background(Color(UIColor.systemGray5))
                            .cornerRadius(16)
                        }
                    }
                    .padding(.horizontal)

                    

                    Spacer()
                    
                    HStack(alignment: .bottom){
                        NavigationLink(destination: TicketView()) {
                            Text("Continue")
                                .font(AppFonts.customFont(name: "Poppins-Regular", size: 16))
                                .frame(maxWidth: 150) // Buton genişliği
                                .padding()
                                .background(Color(UIColor.systemGray4))
                                .cornerRadius(20)
                                .foregroundColor(.black)
                                .padding()
                        }
                    }
                    .frame(maxWidth: .infinity)
                    .background(.white)
                }
                //.padding()
                .frame(maxWidth: .infinity)
                .background(Color("appSecondary")) // İçerik için arka plan rengi
                .navigationBarTitleDisplayMode(.inline)
                /*
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button(action: {
                            //dismiss
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
                 */
                
                
            }
            .background(Color.clear) // NavigationView'in arka planını şeffaf yap
        }
        .navigationBarHidden(true)
    }
}

#Preview {
    ReservationInfoView()
}
