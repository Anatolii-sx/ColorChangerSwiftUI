//
//  ContentView.swift
//  ColorChangerSwiftUI
//
//  Created by Анатолий Миронов on 29.10.2021.
//

import SwiftUI

extension View {
    func dismissKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

struct ContentView: View {
    
    @State private var redSliderValue = Double.random(in: 0...255)
    @State private var greenSliderValue = Double.random(in: 0...255)
    @State private var blueSliderValue = Double.random(in: 0...255)
    
    @State private var redTextFieldValue = ""
    @State private var greenTextFieldValue = ""
    @State private var blueTextFieldValue = ""
    
    @State private var alertPresented = false
    
    private func validateTextFields() {
        guard let redTextFieldValue = Int(redTextFieldValue),
              let greenTextFieldValue = Int(greenTextFieldValue),
              let blueTextFieldValue = Int(blueTextFieldValue)
        else {
            setValuesForTextFieldsFromSliders()
            return
        }
            
        if self.redTextFieldValue.isEmpty || redTextFieldValue > 255 ||
           self.greenTextFieldValue.isEmpty || greenTextFieldValue > 255 ||
           self.blueTextFieldValue.isEmpty || blueTextFieldValue > 255 {
            
            setValuesForTextFieldsFromSliders()
            alertPresented.toggle()
        }
    }
    
    private func setValuesForTextFieldsFromSliders() {
        self.redTextFieldValue = "\(lround(redSliderValue))"
        self.greenTextFieldValue = "\(lround(greenSliderValue))"
        self.blueTextFieldValue = "\(lround(blueSliderValue))"
    }
    
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
                
                ColorSliderView(
                    sliderValue: $redSliderValue,
                    textFieldValue: $redTextFieldValue,
                    color: .red
                )
                ColorSliderView(
                    sliderValue: $greenSliderValue,
                    textFieldValue: $greenTextFieldValue,
                    color: .green
                )
                ColorSliderView(
                    sliderValue: $blueSliderValue,
                    textFieldValue: $blueTextFieldValue,
                    color: .blue
                )
                
                Spacer()
            }
        }
        
        .toolbar {
            ToolbarItem(placement: .keyboard) {
                Button("Done") {
                    validateTextFields()
                    dismissKeyboard()
                }
                
            }
        }
        
        .onTapGesture {
            validateTextFields()
            dismissKeyboard()
        }
        
        .alert("Wrong value", isPresented: $alertPresented, actions: {}) {
            Text("Enter value from 0 to 255")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


