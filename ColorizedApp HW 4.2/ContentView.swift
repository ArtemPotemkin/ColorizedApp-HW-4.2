//
//  ContentView.swift
//  ColorizedApp HW 4.2
//
//  Created by Artem Potemkin on 08.02.2024.
//

import SwiftUI

struct ContentView: View {
    
    @State private var redSliderValue = Double.random(in: 0...255).rounded()
    @State private var greenSliderValue = Double.random(in: 0...255).rounded()
    @State private var blueSliderValue = Double.random(in: 0...255).rounded()
    
    @FocusState private var focusField: Field?
    
    var body: some View {
        ZStack{
            Color.green
                .opacity(0.2)
                .ignoresSafeArea()
                .onTapGesture {
                    focusField = nil
                }
            
            VStack {
                ColorView(red: redSliderValue, green: greenSliderValue, blue: blueSliderValue)
                Spacer()
                
                ColorSliderView(value: $redSliderValue, tintColor: .red)
                    .focused($focusField, equals: .red)
                ColorSliderView(value: $greenSliderValue, tintColor: .green)
                    .focused($focusField, equals: .green)
                ColorSliderView(value: $blueSliderValue, tintColor: .blue)
                    .focused($focusField, equals: .blue)
                Spacer()
            }
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Button(action: previousField) {
                        Image(systemName: "chevron.up")
                    }
                    Button(action: nextField) {
                        Image(systemName: "chevron.down")
                    }
                    Spacer()
                    Button("Done") {
                        focusField = nil
                    }
                }
            }
            .padding()
        }
    }
}

extension ContentView {
    private enum Field {
        case red
        case green
        case blue
    }
    
    private func nextField() {
        switch focusField {
        case .red:
            focusField = .green
        case .green:
            focusField = .blue
        case .blue:
            focusField = .red
        case .none:
            focusField = nil
        }
    }
    
    private func previousField() {
        switch focusField {
        case .red:
            focusField = .blue
        case .green:
            focusField = .red
        case .blue:
            focusField = .green
        case .none:
            focusField = nil
        }
    }
}

#Preview {
    ContentView()
}
