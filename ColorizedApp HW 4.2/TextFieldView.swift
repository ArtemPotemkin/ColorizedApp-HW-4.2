//
//  TextFieldView.swift
//  ColorizedApp HW 4.2
//
//  Created by Артём Потёмкин on 13.02.2024.
//

import SwiftUI

struct TextFieldView: View {
    @Binding var text: String
    @Binding var value: Double
    
    let action: () -> Void
    
    var body: some View {
        TextField("", text: $text) { _ in
            withAnimation {
                action()
            }
        }
        .frame(width: 60)
        .multilineTextAlignment(.center)
        .textFieldStyle(.roundedBorder)
        .keyboardType(.numberPad)
    }
}


#Preview {
    TextFieldView(text: .constant("128"), value: .constant(128), action: {})
}
