//
//  CustomTextField.swift
//  Kultura
//
//  Created by Tural Babayev on 22.12.2024.
//

//
//  CustomTextField.swift
//  Kultura
//
//  Created by Tural Babayev on 22.12.2024.
//

import SwiftUI

struct CustomTextFieldData {
    let placeholder: String
    var text: Binding<String>
    let isSecure: Bool
}

struct CustomTextFieldView: View {
    let fields: [CustomTextFieldData]
    
    var body: some View {
        VStack(spacing: 20) {
            ForEach(fields.indices, id: \.self) { index in
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color("appLabelColor")) // Arka plan rengi
                    .frame(height: 65)
                    .overlay(
                        Group {
                            if fields[index].isSecure {
                                SecureField(fields[index].placeholder, text: fields[index].text)
                                    .autocapitalization(.none)
                                    .disableAutocorrection(true)
                                    .padding(.horizontal, 20)
                                    .font(AppFonts.customFont(name: AppFonts.primaryFont, size: 16))
                                    .foregroundColor(.black)
                            } else {
                                TextField(fields[index].placeholder, text: fields[index].text)
                                    .autocapitalization(.none)
                                    .disableAutocorrection(true)
                                    .padding(.horizontal, 20)
                                    .font(AppFonts.customFont(name: AppFonts.primaryFont, size: 16))
                                    .foregroundColor(.black)
                            }
                        },
                        alignment: .leading
                    )
            }
        }
        .padding(.horizontal, 16)
    }
}

#Preview {
    return CustomTextFieldView(fields: [
        CustomTextFieldData(placeholder: "Email", text: .constant(""), isSecure: false),
        CustomTextFieldData(placeholder: "Password", text: .constant(""), isSecure: true),
        CustomTextFieldData(placeholder: "Username", text: .constant(""), isSecure: false)
    ])
}




