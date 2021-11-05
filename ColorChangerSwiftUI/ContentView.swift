//
//  ContentView.swift
//  ColorChangerSwiftUI
//
//  Created by Анатолий Миронов on 29.10.2021.
//

import SwiftUI

struct ContentView: View {
    
    @State private var redSliderValue = Double.random(in: 0...255)
    @State private var greenSliderValue = Double.random(in: 0...255)
    @State private var blueSliderValue = Double.random(in: 0...255)
    
    // Automatically checking is focus in TF or not.
    @FocusState private var isInputActive: Bool
    
    var body: some View {
        ZStack {
            Color(red: 19 / 255, green: 75 / 255, blue: 100 / 255)
                .ignoresSafeArea()
            VStack(spacing: 10) {
                ColorView(
                    red: redSliderValue,
                    green: greenSliderValue,
                    blue: blueSliderValue
                )
                    .frame(height: 120)
                    .padding()
                
                VStack {
                    ColorSliderView(sliderValue: $redSliderValue, color: .red)
                    ColorSliderView(sliderValue: $greenSliderValue, color: .green)
                    ColorSliderView(sliderValue: $blueSliderValue, color: .blue)
                }
                .focused($isInputActive)
                .toolbar {
                    ToolbarItemGroup(placement: .keyboard) {
                        Spacer()
                        Button("Done") {
                            isInputActive = false
                        }
                    }
                }
                Spacer()
            }
        }
        .onTapGesture {
            isInputActive = false
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


