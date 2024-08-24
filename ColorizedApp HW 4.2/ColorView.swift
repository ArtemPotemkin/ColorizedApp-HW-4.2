//
//  ColorView.swift
//  ColorizedApp HW 4.2
//
//  Created by Artem Potemkin on 12.02.2024.
// regenerate terminal token twice
// 29.06.2024 regenerate token XCode
// 29.07.2024 regenerate token XCode
// 24.08.2024 regen token Xcode
// 24.08.2024 regen token terminal

import SwiftUI

struct ColorView: View {
    
    let red: Double
    let green: Double
    let blue: Double
    
    var body: some View {
        Color(red: red / 255, green: green / 255, blue: blue / 255)
            .frame(width: 250, height: 250)
            .clipShape(RoundedRectangle(cornerRadius: 25))
    }
}

#Preview {
    ColorView(red: 100, green: 100, blue: 100)
}
