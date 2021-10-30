//
//  ColorSliderView.swift
//  ColorChangerSwiftUI
//
//  Created by Анатолий Миронов on 29.10.2021.
//

import SwiftUI

struct ColorSliderView: View {
    
    @Binding var sliderValue: Double
    @Binding var textFieldValue: String
    let color: Color
    
    var body: some View {
        HStack{
            
            Text("\(lround(sliderValue))")
                .foregroundColor(color)
                .font(.system(size: 16, weight: .bold))
                .frame(width: 35, alignment: .leading)
                .padding(.leading, 16)
            
            Slider(value: $sliderValue, in: 0...255, step: 1)
                .foregroundColor(color)
                .tint(color)
                .padding(EdgeInsets(top: 0, leading: 2, bottom: 0, trailing: 10))
            
            TextField("", text: $textFieldValue)
                .frame(width: 50, height: 40)
                .foregroundColor(color)
                .font(.system(size: 16, weight: .bold))
                .textFieldStyle(.roundedBorder)
                .textContentType(.oneTimeCode)
                .keyboardType(.numberPad)
                .padding(.trailing, 16)
        }
    }
}
