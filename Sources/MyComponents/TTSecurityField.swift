//
//  KSecureField.swift
//  Kelos
//
//  Created by JUAN PABLO COMBARIZA MEJIA on 6/18/20.
//  Copyright © 2020 JUAN PABLO COMBARIZA MEJIA. All rights reserved.
//

import SwiftUI

struct TTSecureField: View {
    var placeholder: String
    @Binding var text: String
    var isValid: Bool
    
    @State private var showPassword: Bool = false
    
    var body: some View {
        ZStack(alignment: .leading) {
            if showPassword {
                TextField("", text: self.$text)
                .padding(.all, 10)
                .padding(.horizontal, 30)
                .background(Config.background)
                .cornerRadius(Config.radius)
                .overlay(RoundedRectangle(cornerRadius: Config.radius)
                .stroke(isValid ? Config.borderColor : Config.errorColor))
                .foregroundColor(Config.textColor)
            } else {
                SecureField("", text: self.$text)
                    .padding(.all, 10)
                    .padding(.horizontal, 30)
                .background(Config.background)
                .cornerRadius(Config.radius)
                .overlay(RoundedRectangle(cornerRadius: Config.radius)
                .stroke(isValid ? Config.borderColor : Config.errorColor))
                .foregroundColor(Config.textColor)
            }
            
            HStack {
                Image(systemName: "lock")
                    .frame(width: 10, height: 10, alignment: .center)
                    .padding(.leading, 10)
                    .foregroundColor(.white)
                
                if self.text.isEmpty {
                    Text(placeholder)
                        .foregroundColor(Config.placeholderColor)
                        .padding(.all, 10)
                }
                
                Spacer()
                
                if showPassword {
                    Image(systemName: "eye.slash")
                        .foregroundColor(.white)
                        .padding(.trailing, 10)
                        .onTapGesture {
                            self.showPassword.toggle()
                        }
                } else {
                    Image(systemName: "eye")
                        .foregroundColor(.white)
                        .padding(.trailing, 10)
                        .onTapGesture {
                            self.showPassword.toggle()
                        }
                }
            }
            
        }
        .autocapitalization(.none)
    }
}

extension TTSecureField {
    struct Config {
        static let background = AnyView(Color.gray.blur(radius: 80.0))
        static let radius = CGFloat(5)
        static let borderColor = Color.gray.opacity(0.4)
        static let placeholderColor = Color.white
        static let textColor = Color.black
        static let errorColor = Color.red
    }
}
