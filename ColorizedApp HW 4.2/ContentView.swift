//
//  ContentView.swift
//  ColorizedApp HW 4.2
//
//  Created by Артём Потёмкин on 08.02.2024.
//

import SwiftUI

struct ContentView: View {
    @State private var redSliderValue = Double.random(in: 0...255)
    @State private var greenSliderValue = Double.random(in: 0...255)
    @State private var blueSliderValue = Double.random(in: 0...255)
    
    var body: some View {
        ZStack{
            Color.green
                .opacity(0.2)
                .ignoresSafeArea()
            
            VStack {
                Color(
                    red: redSliderValue/255,
                    green: greenSliderValue/255,
                    blue: blueSliderValue/255)
                .frame(width: 250, height: 250)
                .clipShape(RoundedRectangle(cornerRadius: 25))
                Spacer()
                
                SliderView(value: $redSliderValue, tintColor: .red)
                SliderView(value: $greenSliderValue, tintColor: .green)
                SliderView(value: $blueSliderValue, tintColor: .blue)
                Spacer()
            }
            .padding()
        }
    }
}

struct SliderView: View {
    @Binding var value: Double
    let tintColor: Color
    
    var body: some View {
        HStack {
            Text("\(lround(value))")
                .frame(width: 35, height: 40)
            Slider(value: $value, in: 0...255, step: 1)
                .tint(tintColor)
        }
    }
}

#Preview {
    ContentView()
}
