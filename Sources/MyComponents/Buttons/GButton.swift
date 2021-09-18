//
//  GButton.swift
//  CustomLoginExample
//
//  Created by JUAN PABLO COMBARIZA MEJIA on 7/9/21.
//

import SwiftUI

public struct GButton: View {
    
    var labelText: String
    var leadingIcon: String? = nil
    var textColor: Color? = nil
    var color: Color? = nil
    var fullWidth: Bool? = nil
    var action: (() -> ())
    
    public init(labelText: String, leadingIcon: String? = nil, textColor: Color? = nil, color: Color? = nil, fullWidth: Bool? = nil, action: @escaping (() -> ()) ) {
        self.labelText = labelText
        self.leadingIcon = leadingIcon
        self.textColor = textColor
        self.color = color
        self.fullWidth = fullWidth
        self.action = action
    }

    public var body: some View {
        Button(action: {
            action()
        }) {
            HStack {
                if let leadingIcon =  leadingIcon {
                    Image(systemName: leadingIcon)
                        .frame(width: 18, height: 18, alignment: .center)
                        .foregroundColor(textColor ?? Color("noFocus"))
                }
                Text(labelText)
                    .bold()
                    .font(.system(size: 14))
                    .textCase(.uppercase)
                    .foregroundColor(textColor ?? Color.white)
            }.frame(minWidth: 0, maxWidth: fullWidth ?? false ? .infinity : nil)
        }
        .buttonStyle(GButtonStyle(color: color))
    }
}
