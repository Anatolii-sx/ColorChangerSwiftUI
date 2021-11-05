//
//  ColorSliderView.swift
//  ColorChangerSwiftUI
//
//  Created by Анатолий Миронов on 29.10.2021.
//

import SwiftUI

struct ColorSliderView: View {
    
    @Binding var sliderValue: Double
    @State private var textFieldValue = ""
    
    let color: Color
    
    var body: some View {
        HStack{
            TextView(sliderValue: sliderValue, color: color)
                .padding(.leading, 16)
            
            Slider(value: $sliderValue, in: 0...255, step: 1)
                .tint(color)
                .padding(EdgeInsets(top: 0, leading: 2, bottom: 0, trailing: 10))
            
                // if slider moves, TF value will be changed
                .onChange(of: sliderValue) { isOnFocus in
                    textFieldValue = "\(lround(isOnFocus))"
                }
            
            TextFieldView(textFieldValue: $textFieldValue, sliderValue: $sliderValue, color: color)
                .padding(.trailing, 16)
        }
        
        // Start TF value
        .onAppear {
            textFieldValue = "\(lround(sliderValue))"
        }
    }
}

struct ColorSliderView_Previews: PreviewProvider {
    static var previews: some View {
        ColorSliderView(sliderValue: .constant(150), color: .red)
    }
}
