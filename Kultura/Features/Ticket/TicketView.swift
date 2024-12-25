//
//  TicketView.swift
//  Kultura
//
//  Created by Tural Babayev on 24.12.2024.


import SwiftUI

struct TicketView: View {
    var body: some View {
        VStack{
            NavigationView {
                VStack(spacing: 20){
                    ZStack(){
                        Image("ticketView")
                            .resizable()
                            .padding(.top, 5)
                            .padding(.horizontal, 40)
                        
                        VStack(spacing: 20){
                            VStack(alignment: .leading, spacing: 10) {
                                ticketRow(title: "Name", value: "Kamran Hasanli")
                                ticketRow(title: "Görüşün adı", value: "Business lunch")
                                ticketRow(title: "Guests", value: "2 guests")
                                ticketRow(title: "Date", value: "15 January")
                                ticketRow(title: "Time", value: "15:30")
                                ticketRow(title: "Table", value: "#011")
                            }
                            .padding(.horizontal, 60)
                            .padding(.top, 32)
                            
                            Spacer()
                            Spacer()
                            
                            Image("dashedLine")

                            Text("ID - 251")
                                .font(.headline)
                                .padding()
                                .frame(maxWidth: 180)
                                .frame(height: 100)
                                .background(Color.white)
                                .cornerRadius(10)
                                .padding(.horizontal, 50)
                                .padding(.top, 16)
                            
                            Spacer()
                            
                        }
                        
                    }

                    Spacer()
                    
                    HStack{
                        NavigationLink(destination: TabBarView()) {
                            Text("Close")
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
                .background(Color("appSecondary"))
                .navigationBarTitleDisplayMode(.inline)
                .toolbar{
                    ToolbarItem(placement: .principal) {
                        Text("Your Ticket")
                            .font(AppFonts.customFont(name: "Poppins", size: 16))
                    }
                }
                
            }
            .padding(.top, 4)
            .navigationBarHidden(true) // Navigation Bar'ı gizler
        }
        .background(Color("appSecondary"))

        

        
    }
}

//MARK: - Helper Shape
struct DashedLine: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: rect.minX, y: rect.midY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.midY))
        return path
    }
}

//MARK: - Functions
extension View{
    func ticketRow(title: String, value: String) -> some View {
        HStack {
            Text(title)
                .foregroundColor(.gray)
            Spacer()
            Text(value)
                .bold()
        }
    }
}

//MARK: - Preview
#Preview {
    TicketView()
}

