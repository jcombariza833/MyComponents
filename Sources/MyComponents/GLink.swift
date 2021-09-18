//
//  GLink.swift
//  CustomLoginExample
//
//  Created by JUAN PABLO COMBARIZA MEJIA on 7/11/21.
//

import SwiftUI

public struct GLink: View {
    var labelText: String
    var activeColor: Color? = nil
    var inactiveColor: Color? = nil
    var action: (() -> ())
    
    public init(labelText: String,activeColor: Color? = nil,inactiveColor: Color? = nil, action: @escaping (() -> ()) ) {
        self.labelText = labelText
        self.activeColor = activeColor
        self.inactiveColor = inactiveColor
        self.action = action
    }
    
    @GestureState private var isPress = false
    
    public var body: some View {
        Text(labelText)
            .bold()
            .font(.system(size: 14))
            .textCase(.uppercase)
            .foregroundColor(isPress ? activeColor ?? Color("noFocus") : inactiveColor ?? Color("noFocus") )
            .gesture(
                LongPressGesture(minimumDuration: 0.05)
                    .updating($isPress, body: { value, state, transition in
                        state = value
                    })
                    .onEnded({ _ in
                        action()
                    })
            )
    }
}
