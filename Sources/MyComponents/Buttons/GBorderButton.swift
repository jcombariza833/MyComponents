//
//  GBorderButton.swift
//  CustomLoginExample
//
//  Created by JUAN PABLO COMBARIZA MEJIA on 7/10/21.
//

import SwiftUI

public struct GBorderButton: View {
    var labelText: String
    var leadingIcon: String? = nil
    var color: Color? = nil
    var action: (() -> ())
    
    public init(labelText: String, leadingIcon: String? = nil, color: Color? = nil, action: @escaping (() -> ())) {
        self.labelText = labelText
        self.leadingIcon = leadingIcon
        self.color = color
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
                        .foregroundColor(color ?? Color("noFocus"))
                }
                Text(labelText)
                    .bold()
                    .font(.system(size: 14))
                    .textCase(.uppercase)
                    .foregroundColor(color ?? Color("noFocus"))
            }
        }
        .buttonStyle(GBorderButtonStyle(color: color))
    }
}

