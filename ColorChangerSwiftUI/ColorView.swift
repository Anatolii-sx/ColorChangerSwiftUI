//
//   ColorView.swift
//  ColorChangerSwiftUI
//
//  Created by Анатолий Миронов on 29.10.2021.
//

import SwiftUI

struct ColorView: View {
    
    let red: Double
    let green: Double
    let blue: Double
    
    var body: some View {
        Color(
            red: red / 255,
            green: green / 255,
            blue: blue / 255
        )
            .cornerRadius(12)
            .overlay(
                RoundedRectangle(cornerRadius: 12)
                    .stroke(Color.white, lineWidth: 3)
            )
    }
}
