//
//  ProfileView.swift
//  Kultura
//
//  Created by Tural Babayev on 22.12.2024.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        
        NavigationStack{
            VStack{
                HStack{
                    Text("ffff")
                }
                .background(.black)
                
                VStack{
                    Text("ffff")
                }
                .background(.blue)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color("appSecondary"))
        }
        
    }
}

#Preview {
    ProfileView()
}
