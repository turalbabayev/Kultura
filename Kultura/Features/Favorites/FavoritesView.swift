//
//  FavoritesView.swift
//  Kultura
//
//  Created by Tural Babayev on 24.12.2024.
//

import SwiftUI

import SwiftUI

struct FavoritesView: View {
    let restaurants: [Restaurant]
    @Environment(\.dismiss) var dismiss // Geri dönüş

    var body: some View {
        NavigationView {
            ScrollView(showsIndicators: false) {
                VStack{
                    ForEach(restaurants) { restaurant in
                        CustomRestaurantView(
                            restaurant: restaurant,
                            onLeftIconTap: {
                                print("\(restaurant.name) left icon tapped")
                            },
                            onRightIconTap: {
                                print("\(restaurant.name) right icon tapped")
                            }
                        )
                    }
                }
                .padding()

            }
            .background(Color("appSecondary"))
            .navigationBarTitleDisplayMode(.inline)
            .toolbarBackground(Color("appSecondary"), for: .navigationBar) // Navigation Bar arka planı

            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        // Geri butonuna tıklama işlemi
                        dismiss()
                    }) {
                        Image("arrow-right")
                            .resizable()
                            .frame(width: 40, height: 40)
                            .rotationEffect(Angle(degrees: -180))
                    }
                }
                ToolbarItem(placement: .principal) {
                    Text("Favorites")
                        .font(AppFonts.customFont(name: "Poppins", size: 18))
                }
            }
        }
        .padding(.top,12)
        .navigationBarHidden(true) // Navigation Bar'ı gizler
        .background(Color("appSecondary")) // NavigationView'in arka planı

    }
}

#Preview {
    FavoritesView(restaurants: [
        Restaurant(
            name: "Agabala Restaurant",
            rating: 5.0,
            priceRange: "120-150 AZN",
            image: Image("r1"),
            leftIcon: .none,
            rightIcon: Image("heart"),
            leftIconColor: .none,
            hasBorder: false // Border yok
        ),
        Restaurant(
            name: "Coffelea Khatai",
            rating: 4.3,
            priceRange: "30-40 AZN",
            image: Image("r1"),
            leftIcon: .none,
            rightIcon: Image("heart"),
            leftIconColor: .red,
            hasBorder: false // Border var
        ),
        Restaurant(
            name: "Agabala Restaurant",
            rating: 5.0,
            priceRange: "120-150 AZN",
            image: Image("r1"),
            leftIcon: .none,
            rightIcon: Image("heart"),
            leftIconColor: .none,
            hasBorder: false // Border yok
        ),
        Restaurant(
            name: "Agabala Restaurant",
            rating: 5.0,
            priceRange: "120-150 AZN",
            image: Image("r1"),
            leftIcon: .none,
            rightIcon: Image("heart"),
            leftIconColor: .none,
            hasBorder: false // Border yok
        ),
        Restaurant(
            name: "Agabala Restaurant",
            rating: 5.0,
            priceRange: "120-150 AZN",
            image: Image("r1"),
            leftIcon: .none,
            rightIcon: Image("heart"),
            leftIconColor: .none,
            hasBorder: false // Border yok
        ),
        Restaurant(
            name: "Agabala Restaurant",
            rating: 5.0,
            priceRange: "120-150 AZN",
            image: Image("r1"),
            leftIcon: .none,
            rightIcon: Image("heart"),
            leftIconColor: .none,
            hasBorder: false // Border yok
        ),Restaurant(
            name: "Agabala Restaurant",
            rating: 5.0,
            priceRange: "120-150 AZN",
            image: Image("r1"),
            leftIcon: .none,
            rightIcon: Image("heart"),
            leftIconColor: .none,
            hasBorder: false // Border yok
        ),Restaurant(
            name: "Agabala Restaurant",
            rating: 5.0,
            priceRange: "120-150 AZN",
            image: Image("r1"),
            leftIcon: Image("heart"),
            rightIcon: Image("heart"),
            leftIconColor: .none,
            hasBorder: false // Border yok
        ),
    ])
}

