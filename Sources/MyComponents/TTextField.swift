//
//  TTextField.swift
//  CustomLoginExample
//
//  Created by JUAN PABLO COMBARIZA MEJIA on 6/24/21.
//

import SwiftUI

//
//  KTextField.swift
//  Kelos
//
//  Created by JUAN PABLO COMBARIZA MEJIA on 6/17/20.
//  Copyright © 2020 JUAN PABLO COMBARIZA MEJIA. All rights reserved.
//

import SwiftUI

public struct TTextField: View {
    var placeholder: String
    @Binding var text: String
    var isValid: Bool
    var image: String = "envelope"
    var leadingIcon: String = "envelope"
    var labelText: String = "envelope"
    var trailingIcon: String = "envelope"
    var activateIndicator: Bool = false
    var helperText: String = ""
    
    
    public var body: some View {
        ZStack(alignment: .leading) {
            TextField("", text: self.$text)
                .padding(.all, 10)
                .padding(.horizontal, 30)
                .background(Config.background)
                .cornerRadius(Config.radius)
                .overlay(RoundedRectangle(cornerRadius: Config.radius)
                    .stroke(isValid ? Config.borderColor : Config.errorColor))
                .foregroundColor(Config.textColor)
            
            HStack {
                Image(systemName: image)
                    .frame(width: 10, height: 10, alignment: .center)
                    .padding(.leading, 10)
                    .foregroundColor(.white)
                
                if self.text.isEmpty {
                    Text(placeholder)
                        .foregroundColor(Config.placeholderColor)
                        .padding(.all, 10)
                }
                
                Spacer()
            }
            
        }
        .autocapitalization(.none)
    }
}

extension TTextField {
    struct Config {
        static let background = AnyView(Color.gray.blur(radius: 80.0))
        static let radius = CGFloat(5)
        static let borderColor = Color.gray.opacity(0.4)
        static let placeholderColor = Color.white
        static let textColor = Color.black
        static let errorColor = Color.red
    }
}

