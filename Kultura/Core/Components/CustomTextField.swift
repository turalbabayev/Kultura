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
    var keyboardType: UIKeyboardType
    
    init(placeholder: String, text: Binding<String>, isSecure: Bool, keyboardType: UIKeyboardType = .default) {
        self.placeholder = placeholder
        self.text = text
        self.isSecure = isSecure
        self.keyboardType = keyboardType
    }
}

struct CustomTextFieldView: View {
    let fields: [CustomTextFieldData]
    
    var body: some View {
        VStack(spacing: 20) {
            ForEach(fields.indices, id: \.self) { index in
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color("appLabelColor"))
                    .frame(height: 65)
                    .overlay(
                        Group {
                            if fields[index].isSecure {
                                SecureField(fields[index].placeholder, text: fields[index].text)
                                    .autocapitalization(.none)
                                    .disableAutocorrection(true)
                                    .keyboardType(fields[index].keyboardType)
                                    .padding(.horizontal, 20)
                                    .font(AppFonts.customFont(name: AppFonts.primaryFont, size: 16))
                                    .foregroundColor(.black)
                            } else {
                                TextField(fields[index].placeholder, text: fields[index].text)
                                    .autocapitalization(.none)
                                    .disableAutocorrection(true)
                                    .keyboardType(fields[index].keyboardType)
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




