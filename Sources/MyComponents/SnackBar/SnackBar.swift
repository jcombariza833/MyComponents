//
//  SnackBar.swift
//  CustomLoginExample
//
//  Created by JUAN PABLO COMBARIZA MEJIA on 7/12/21.
//

import SwiftUI

public struct SnackBar: View {
    var labelText: String
    var leadingIcon: String? = nil
    var textColor: Color? = nil
    var color: Color? = nil
    var buttonText: String? = nil
    var buttonColor: Color? = nil
    var action: (() -> ())? = nil
    
    public init(labelText: String, leadingIcon: String? = nil, textColor: Color? = nil, color: Color? = nil, buttonText: String? = nil, buttonColor: Color? = nil, action: (() -> ())? = nil) {
        self.labelText = labelText
        self.leadingIcon = leadingIcon
        self.textColor = textColor
        self.color = color
        self.buttonText = buttonText
        self.buttonColor = buttonColor
        self.action = action
    }

    @State private var longButton = false
    
    public var body: some View {
        VStack(alignment: .trailing) {
            HStack {
                if let leadingIcon =  leadingIcon {
                    Image(systemName: leadingIcon)
                        .resizable()
                        .frame(width: 18, height: 18, alignment: .center)
                        .foregroundColor(textColor ?? .white)
                        .padding()
                }
                
                Text(labelText)
                    .foregroundColor(textColor ?? .white)
                    .font(.system(size: 16))
                    .lineLimit(2)
                    .fixedSize(horizontal: false, vertical: true)
                
                Spacer()
                
                if !isLong {
                    if let buttonText = buttonText {
                        Button(action: {
                            if let action = action {
                                action()
                            }
                        }, label: {
                            Text(buttonText)
                                .bold()
                                .font(.system(size: 14))
                                .textCase(.uppercase)
                                .foregroundColor(buttonColor ?? .black)
                        }).padding(.all,8)
                    }
                }
            }
            
            
            if isLong {
                if let buttonText = buttonText {
                    Button(action: {
                        if let action = action {
                            action()
                        }
                    }, label: {
                        Text(buttonText)
                            .bold()
                            .font(.system(size: 14))
                            .textCase(.uppercase)
                            .foregroundColor(buttonColor ?? .black)
                    }).padding(.all,8)
                }
            }
        }
        .frame(minWidth: 285,idealWidth: 285, maxWidth: 300,
               minHeight: 48, idealHeight: 48,
               maxHeight: isLong ? CGFloat(68) : CGFloat(48),
               alignment: .center)
        .padding(.all, isLong ? CGFloat(16) : CGFloat(8))
        .background(color ?? Color("noFocus"))
        .cornerRadius(5.0)
        .shadow(color: .gray, radius: 5, x: 2, y: 2)
        
    }
    
    var isLong: Bool {
        if let buttonText = buttonText {
            return buttonText.count > 10
        }
        return false
    }
    
}
