//
//  ProfileView.swift
//  Kultura
//
//  Created by Tural Babayev on 22.12.2024.
//

import SwiftUI

struct ProfileView: View {
    let restaurants: [Restaurant]

    var body: some View {
        NavigationView {
            ScrollView{
                VStack(alignment: .leading) {
                    
                    ProfileHeaderView(name: "Tural", surname: "Babayev", email: "turalonliner@gmail.com", profileImage: "avatar")
                    
                    CustomListView(
                            items: [
                                ListItem(title: "Reservations", destination: AnyView(EditProfileView(firstName: "Tural", lastName: "Babayev", email: "turalbabayev@gmail.com", profileImage: "avatar", onDone: { _, _, _ in
                                    
                                })), trailingView: AnyView(Image(systemName: "chevron.right").foregroundColor(.gray))),
                                
                                ListItem(title: "Favorites", destination: AnyView(FavoritesView(restaurants: [
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
                                        name: "Coffelea Khataii",
                                        rating: 4.3,
                                        priceRange: "30-40 AZN",
                                        image: Image("r1"),
                                        leftIcon: .none,
                                        rightIcon: Image("heart"),
                                        leftIconColor: .red,
                                        hasBorder: false // Border var
                                    )
                                ])), trailingView: AnyView(Image(systemName: "chevron.right").foregroundColor(.gray)))
                            ]
                    )
                    
                    
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Reserve Again")
                            .font(.system(size: 20, weight: .bold))
                            .foregroundColor(.black)
                            .padding(.horizontal)

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
                    .padding(.top, 8)
                    
                    CustomListView(
                            items: [
                                ListItem(
                                    title: "Payment methods",
                                    destination: AnyView(Text("Payment Methods")),
                                    trailingView: AnyView(Image(systemName: "chevron.right").foregroundColor(.gray)), // Simge
                                    isToggled: nil // Toggle yok
                                ),
                                ListItem(
                                    title: "Account",
                                    destination: AnyView(AccountView()),
                                    trailingView: AnyView(Image(systemName: "chevron.right").foregroundColor(.gray)), // Simge
                                    isToggled: nil // Toggle yok
                                ),
                                ListItem(title: "Get Help", destination: AnyView(EditProfileView(firstName: "Tural", lastName: "Babayev", email: "turalbabayev@gmail.com", profileImage: "avatar", onDone: { _, _, _ in
                                    
                                })), trailingView: AnyView(Image(systemName: "chevron.right").foregroundColor(.gray)))
                            ]
                    )
                    
                    
                    Spacer()
                    
                }
                .background(Color("appSecondary"))
            }
            .background(Color("appSecondary"))
        }
        .navigationBarHidden(true) // Navigation Bar'ı gizler

    }
}

#Preview {
    ProfileView(restaurants: [
        Restaurant(
            name: "Agabala Restaurant",
            rating: 5.0,
            priceRange: "120-150 AZN",
            image: Image("r1"),
            leftIcon: .none,
            rightIcon: .none,
            leftIconColor: .none,
            hasBorder: false // Border yok
        ),
        Restaurant(
            name: "Coffelea Khatai",
            rating: 4.3,
            priceRange: "30-40 AZN",
            image: Image("r1"),
            leftIcon: .none,
            rightIcon: .none,
            leftIconColor: .red,
            hasBorder: false // Border var
        )
    ])
}
