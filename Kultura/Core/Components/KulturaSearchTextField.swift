//
//  SearchTextField.swift
//  Kultura
//
//  Created by Tural Babayev on 22.12.2024.
//

import SwiftUI

struct KulturaSearchTextField: View{
    @State private var searchText: String = ""
    var isSearchPage: Bool
    var onSearch: (String) -> Void = { _ in }

    var body: some View{
        if isSearchPage{
            HStack{
                Image("search-normal")
                    .foregroundColor(.gray)
                    .padding(.leading, 16)
                
                TextField("Search", text: $searchText, onCommit: {
                    onSearch(searchText)
                })
                
                Spacer()
            }
            .padding(.vertical, (70 - 32) / 2) // Yükseklik ayarı için padding
            .background(Color.white)
            .cornerRadius(70 / 2 )
            .frame(height: 70)
            .shadow(color: Color.black.opacity(0.1), radius: 4, x: 0, y: 2)
            .padding(.horizontal, 16)
            
        }
        else {
            HStack {
                Image("search-normal")
                    .foregroundColor(.gray)
                    .padding(.leading, 16)

                
                Text("Search")
                    .foregroundColor(.gray)
                    .font(.system(size: 16))
                
                Spacer()
            }
            .padding(.vertical, (70 - 32) / 2) // Yükseklik ayarı için padding
            .background(Color.white)
            .cornerRadius(70 / 2)
            .frame(height: 70)
            .shadow(color: Color.black.opacity(0.1), radius: 4, x: 0, y: 2)
            .padding(.horizontal, 16)
            .onTapGesture {
                // Ana sayfada tıklandığında arama sayfasına git
                print("Navigate to search page")
            }
        }
    }
}

#Preview {
    KulturaSearchTextField(isSearchPage: false)
}
