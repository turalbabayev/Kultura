//
//  SignupViewModel.swift
//  Kultura
//
//  Created by Tural Babayev on 22.12.2024.
//

import SwiftUI
import Combine

class SignupViewModel: ObservableObject{
    @Published var name: String = ""
    @Published var surname: String = ""
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var passwordAgain: String = ""
}
