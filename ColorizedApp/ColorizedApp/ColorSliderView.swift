//
//  ColorSliderView.swift
//  ColorizedApp
//
//  Created by Олеся Егорова on 13.05.2023.
//

import SwiftUI

struct ColorSliderView: View {
    @Binding var value: Double
    let textColor: Color

    @State private var showAlert = false

    var body: some View {
        HStack(alignment: .center) {
            Text("\(lround(value))").foregroundColor(textColor)
                .frame(width: 40, alignment: .leading)
            Slider(value: $value, in: 0...255, step: 1)
                .accentColor(textColor)
            TextField("\(value)", value: $value, formatter: NumberFormatter()) { _ in
                withAnimation {
                    checkValue()
                }
            }
                .foregroundColor(textColor)
                .frame(width: 40, alignment: .trailing)
                .multilineTextAlignment(.center)
                .keyboardType(.decimalPad)
                .alert("Wrong Format", isPresented: $showAlert, actions: {}) {
                    Text("Please enter value 0...255")
                }
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(lineWidth: 1)
                        .foregroundColor(.white))
        }
    }

    private func checkValue() {
        if let value = Int(value.formatted()), (0...255).contains(value) {
            self.value = Double(value)
            return
        }
        showAlert.toggle()
        value = 0.0
    }
}

struct ColorSliderView_Previews: PreviewProvider {
    static var previews: some View {
        ColorSliderView(value: .constant(50), textColor: .red)
    }
}
