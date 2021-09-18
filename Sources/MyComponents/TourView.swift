//
//  TourView.swift
//  CustomLoginExample
//
//  Created by JUAN PABLO COMBARIZA MEJIA on 6/24/21.
//

import SwiftUI

struct TourView: View {
    let colors: [Color] = [
            .red, .green, .blue, .gray
        ]
    var body: some View {
        GeometryReader { proxy in
            TabView {
                ForEach(colors, id: \.self) { color in
                    color // Your cell content
                }
                .frame(
                    width: proxy.size.width,
                    height: proxy.size.height
                )
            }
            .tabViewStyle(PageTabViewStyle())
        }.edgesIgnoringSafeArea(.all)
    }
}
