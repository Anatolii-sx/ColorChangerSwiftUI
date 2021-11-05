//
//  TextFieldView.swift
//  ColorChangerSwiftUI
//
//  Created by Анатолий Миронов on 05.11.2021.
//

import SwiftUI

struct TextFieldView: View {
    
    @Binding var textFieldValue: String
    @Binding var sliderValue: Double
    
    @State private var alertPresented = false
    
    let color: Color
    
    var body: some View {
        TextField("", text: $textFieldValue) { _ in
            checkValue()
        }
            .frame(width: 50, height: 40)
            .foregroundColor(color)
            .font(.system(size: 16, weight: .bold))
            .textFieldStyle(.roundedBorder)
            .textContentType(.oneTimeCode)
            .keyboardType(.numberPad)
            .alert("Wrong value", isPresented: $alertPresented, actions: {}) {
                Text("Enter value from 0 to 255")
            }
    }
    
    private func checkValue() {
        if let value = Int(textFieldValue), (0...255).contains(value) {
            sliderValue = Double(value)
            textFieldValue = "\(value)"
            return
        }
        alertPresented.toggle()
        textFieldValue = "0"
        sliderValue = 0
    }
}

struct TextFieldView_Previews: PreviewProvider {
    static var previews: some View {
        TextFieldView(textFieldValue: .constant("25"), sliderValue: .constant(25), color: .red)
    }
}
