//
//  ColorSliderView.swift
//  ColorizedApp HW 4.2
//
//  Created by Артём Потёмкин on 13.02.2024.
//

import SwiftUI

struct ColorSliderView: View {
    
    @Binding var value: Double
    @State private var text = ""
    @State private var showAlert = false
    
    let tintColor: Color
    
    var body: some View {
        HStack {
            Text(value.formatted())
                .frame(width: 35, height: 40)
            
            Slider(value: $value, in: 0...255, step: 1)
                .tint(tintColor)
                .onChange(of: value) {
                    text = value.formatted()
                }
            
            TextFieldView(text: $text, value: $value, action: checkValue)
                .alert("Wrong format", isPresented: $showAlert, actions: {}) {
                    Text("Please enter value from 0 to 255")
                }
        }
        .onAppear {
            text = value.formatted()
        }
    }
    private func checkValue() {
        if let value = Int(text), (0...255).contains(value) {
            self.value = Double(value)
            return
        }
        showAlert.toggle()
        value = 0
        text = "0"
    }
}

#Preview {
    ColorSliderView(value: .constant(100), tintColor: .red)
}
