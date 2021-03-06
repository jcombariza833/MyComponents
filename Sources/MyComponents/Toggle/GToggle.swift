//
//  GToggle.swift
//  CustomLoginExample
//
//  Created by JUAN PABLO COMBARIZA MEJIA on 7/16/21.
//

import SwiftUI

public struct GToggle<Label> : View where Label : View{
    private var colorOn: Color? = nil
    private var iconOn: String? = nil
    private var colorOff: Color? = nil
    private var iconOff: String? = nil
    @Binding private var isOn: Bool
    private var label: () -> Label
    
    public init(colorOn: Color? = nil, iconOn: String? = nil,colorOff: Color? = nil, iconOff: String? = nil, isOn: Binding<Bool>, @ViewBuilder label: @escaping () -> Label) {
        self.colorOn = colorOn
        self.iconOn = iconOn
        self.colorOff = colorOff
        self.iconOff = iconOff
        self._isOn = isOn
        self.label = label
    }
    
    public var body: some View {
        Toggle(isOn: $isOn, label: self.label)
            .toggleStyle(GToggleStyle(colorOn: colorOn,
                                      iconOn: iconOn,
                                      colorOff: colorOff,
                                      iconOff: iconOff))
    }
}
