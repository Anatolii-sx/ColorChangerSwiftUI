//
//  TextView.swift
//  ColorChangerSwiftUI
//
//  Created by Анатолий Миронов on 05.11.2021.
//

import SwiftUI

struct TextView: View {
    
    let sliderValue: Double
    let color: Color
    
    var body: some View {
        Text("\(lround(sliderValue))")
            .foregroundColor(color)
            .font(.system(size: 16, weight: .bold))
            .lineLimit(1)
            .frame(width: 35, alignment: .leading)
    }
}

struct TextView_Previews: PreviewProvider {
    static var previews: some View {
        TextView(sliderValue: 25, color: .red)
    }
}
