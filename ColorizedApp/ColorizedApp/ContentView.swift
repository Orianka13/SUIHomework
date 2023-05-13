//
//  ContentView.swift
//  ColorizedApp
//
//  Created by Олеся Егорова on 13.05.2023.
//

import SwiftUI

struct ContentView: View {
    @State private var viewColor: Color = .red
    @State private var redSliderValue = 255.0
    @State private var greenSliderValue = 255.0
    @State private var blueSliderValue = 255.0

    var body: some View {
        Color.gray
            .edgesIgnoringSafeArea(.all)
            .overlay(
                VStack {
                    RoundedRectangle(cornerRadius: 20)
                        .foregroundColor(Color(cgColor: CGColor(red: redSliderValue / 255, green: greenSliderValue / 255, blue: blueSliderValue / 255, alpha: 1)))
                        .frame(height: 200)
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(lineWidth: 4)
                                .foregroundColor(.white)
                        )
                        .padding(.bottom)
                    ColorSliderView(value: $redSliderValue, textColor: .red)
                    ColorSliderView(value: $greenSliderValue, textColor: .green)
                    ColorSliderView(value: $blueSliderValue, textColor: .blue)
                    Spacer()
                }
                    .padding())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct ColorSliderView: View {
    @Binding var value: Double
    let textColor: Color

    var body: some View {
        HStack(alignment: .center) {
            Text("\(lround(value))").foregroundColor(textColor)
                .frame(width: 40, alignment: .leading)
            Slider(value: $value, in: 0...255, step: 1)
                .accentColor(textColor)
            TextField("\(value)", value: $value, formatter: NumberFormatter())
                .foregroundColor(textColor)
                .frame(width: 40, alignment: .trailing)
                .multilineTextAlignment(.center)
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(lineWidth: 1)
                        .foregroundColor(.white))
        }
    }
}
